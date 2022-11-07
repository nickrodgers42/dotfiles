local home = os.getenv('HOME')
local nvim_dir = home .. "/.local/share/nvim/"
local jdtls_dir = nvim_dir .. "mason/packages/jdtls/"

local function trim(s)
   return s:gsub("^%s*(.-)%s*$", "%1")
end

local function get_os()
    local handle = io.popen("uname")
    local uname = handle:read("*a")
    handle:close()
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
    local equinox_version = handle:read("*a")
    handle:close()
    return trim(equinox_version)
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home .. '/.java-workspace/' .. project_name
local plugins_dir = jdtls_dir .. "plugins/"
local jar = plugins_dir .. get_equinox_version(plugins_dir)

local on_attach = function(client, bufnr)
    MapLspCommands(client, bufnr)
    print("in attach function")
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
end

local bundles = {
    vim.fn.glob(nvim_dir .. "mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 1)
}
bundles = vim.list_extend(bundles, vim.split(vim.fn.glob(nvim_dir .. "mason/packages/java-test/extension/server/*.jar", 1), "\n"))

local map = vim.api.nvim_set_keymap

map('n', 'cao', [[<Cmd>lua require'jdtls'.organize_imports()<CR>]], { noremap = true })
map('n', 'crv', [[<Cmd>lua require('jdtls').extract_variable()<CR>]], { noremap = true })
map('v', 'crv', [[<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>]], { noremap = true })
map('n', 'crc', [[<Cmd>lua require('jdtls').extract_constant()<CR>]], { noremap = true })
map('v', 'crc', [[<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>]], { noremap = true })
map('v', 'crm', [[<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>]], { noremap = true })
map('n', '<Leader>dT', [[<Cmd>lua require'jdtls'.test_class()<CR>]], { noremap = true })
map('n', '<Leader>dt', [[<Cmd>lua require'jdtls'.test_nearest_method()<CR>]], { noremap = true })
map('n', '<Leader>ds', [[<Cmd>lua require('jdtls.dap').setup_dap_main_class_configs()<CR>]], { noremap = true })

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
        '-data', workspace_dir
    },
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
    settings = {
        java = {}
    },
    init_options = {
        bundles = bundles
    },
}
require('jdtls').start_or_attach(config)
