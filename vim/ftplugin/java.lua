local home = os.getenv('HOME')
local nvim_dir = home .. "/.local/share/nvim/"
local jdtls_dir = nvim_dir .. "mason/packages/jdtls/"

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

local plugins_dir = jdtls_dir .. "plugins/"
local jar = plugins_dir .. get_equinox_version(plugins_dir)

local on_attach = function(client, bufnr)
    MapLspCommands(client, bufnr)
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
end

local bundles = {
    vim.fn.glob(nvim_dir .. "mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 1)
}
bundles = vim.list_extend(bundles, vim.split(vim.fn.glob(nvim_dir .. "mason/packages/java-test/extension/server/*.jar", 1), "\n"))

local function setJavaKeyMaps()
    local java_maps = {
        {'n', '<Leader>dT', 'lua require("jdtls").test_class()' },
        {'n', '<Leader>ds', 'lua require("jdtls.dap").setup_dap_main_class_configs()' },
        {'n', '<Leader>dt', 'lua require("jdtls").test_nearest_method()' },
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
setJavaKeyMaps()

-- local root_dir = require("jdtls.setup").find_root({"packageInfo"}, "Config")
package.path = package.path .. ";" .. home .. "/.work.lua"
local root_dir = require("work").find_root_work()
local ws_folders_jdtls = {}
if root_dir then
    ws_folders_jdtls = require("work").add_ws_root_folders(root_dir)
else
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'})
end
local eclipse_workspace = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

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
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', jar,
        '-configuration', jdtls_dir .. "/config_" .. get_os(),
        '--jvm-arg=-javaagent:' .. home .. "/Developer/lombok.jar",
        '-data', eclipse_workspace
    },
    root_dir = root_dir,
    settings = {
        java = {}
    },
    init_options = {
        bundles = bundles,
        workspace_folders = ws_folders_jdtls
    },
}
require('jdtls').start_or_attach(config)
