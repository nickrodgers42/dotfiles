local home = os.getenv('HOME')
local nvim_dir = home .. "/.local/share/nvim/"
local jdtls_dir = nvim_dir .. "mason/packages/jdtls/"
local jdtls_plugins_dir = jdtls_dir .. "plugins/"
local work_path = home .. "/.work.lua"
if vim.fn.filereadable(work_path) then
    package.path = package.path .. work_path
end

local work_loaded, work = pcall(require, work_path)

local function trim(s)
   return s:gsub("^%s*(.-)%s*$", "%1")
end

local function get_os()
    local handle = io.popen("uname")
    local uname = ""
    if handle ~= nil then
        uname = handle:read("*a")
        handle:close()
    end
    uname = trim(uname)
    if (uname == "Darwin") then
        return "mac"
    else
        return "linux"
    end
end

local function get_equinox_version(plugins_dir)
    local cmd = "ls " .. plugins_dir .. " | "
    cmd = cmd .. "grep equinox.launcher_"
    local handle = io.popen(cmd)
    local equinox_version = ""
    if handle ~= nil then
        equinox_version = handle:read("*a")
        handle:close()
    end
    return trim(equinox_version)
end

local function get_jdtls_jar_location()
    return jdtls_plugins_dir .. get_equinox_version(jdtls_plugins_dir)
end

local on_attach = function(client, bufnr)
    if work_loaded then
        work.add_ws_folders(work.get_ws_folders())
    end
    MapLspCommands(client, bufnr)
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    local dap = require('dap')
    dap.configurations.java = {
        {
            type = 'java',
            request = 'attach',
            name = 'attach to process',
            hostname = 'localhost',
            port = 5005
        }
    }
end

local function get_bundles()
    local bundles = {
        vim.fn.glob(nvim_dir .. "mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
        vim.fn.glob(home .. "/Developer/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", true)
    }
    return vim.list_extend(bundles, vim.split(vim.fn.glob(nvim_dir .. "mason/packages/java-test/extension/server/*.jar", true), "\n"))
end

local function setJavaKeyMaps()
    local java_maps = {
        {'n', '<Leader>dT', 'lua require("jdtls").test_class()' },
        {'n', '<Leader>ds', 'lua require("jdtls.dap").setup_dap_main_class_configs()' },
        {'n', '<Leader>dt', 'lua require("jdtls").test_nearest_method()' },
        {'n', '<Leader>da', 'lua require("dap").continue()' },
        {'n', 'cao', 'lua require("jdtls").organize_imports()'},
        {'n', 'crc', 'lua require("jdtls").extract_constant()' },
        {'n', 'crv', 'lua require("jdtls").extract_variable()'},
        {'v', 'crc', 'lua require("jdtls").extract_constant(true)' },
        {'v', 'crm', 'lua require("jdtls").extract_method(true)' },
        {'v', 'crv', 'lua require("jdtls").extract_variable(true)'},
    }
    for _, keymap in ipairs(java_maps) do
        local command = '<Cmd>' .. keymap[3] .. '<CR>'
        if keymap[1] == 'v' then
            command = '<Esc>' .. command
        end
        vim.api.nvim_set_keymap(keymap[1], keymap[2], command, { noremap = true })
    end
end

local function get_root_dir()
    if work_loaded then
        return work.get_root_dir()
    end
    return vim.fs.root(0, {".git", "mvnw", "gradlew"})
end

local function get_ws_folders()
    if work_loaded then
        return work.get_ws_folders()
    end
    return {}
end


local function get_eclipse_workspace(root_dir)
    return home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
end


local function main()
    local root_dir = get_root_dir()
    local config = {
        on_attach = on_attach,
        cmd = {
            'java',
            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
            '-Dosgi.bundles.defaultStartLevel=4',
            '-Declipse.product=org.eclipse.jdt.ls.core.product',
            '-Dlog.protocol=true',
            '-Dlog.level=ALL',
            '-Xms1g',
            '-javaagent:' .. require('mason-registry').get_package('jdtls'):get_install_path() .. '/lombok.jar',
            '--add-modules=ALL-SYSTEM',
            '--add-opens', 'java.base/java.util=ALL-UNNAMED',
            '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
            '-jar', get_jdtls_jar_location(),
            '-configuration', jdtls_dir .. "config_" .. get_os() .. "_arm",
            '-data', get_eclipse_workspace(root_dir),
        },
        root_dir = root_dir,
        settings = {
            java = {}
        },
        init_options = {
            bundles = get_bundles(),
            workspace_folders = get_ws_folders()
        },
    }

    setJavaKeyMaps()
    require('jdtls').start_or_attach(config)
end

main()
