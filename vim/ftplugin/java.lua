local home = os.getenv('HOME')
local nvim_dir = home .. "/.local/share/nvim/"
local jdtls_dir = nvim_dir .. "lsp_servers/jdtls/"

function trim(s)
   return s:gsub("^%s*(.-)%s*$", "%1")
end

function get_os()
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

function get_equinox_version()
    local cmd = "ls " .. home
    cmd = cmd .."/.local/share/nvim/lsp_servers/jdtls/plugins/ "
    cmd = cmd .. "| grep equinox.launcher_"
    local handle = io.popen(cmd)
    local equinox_version = handle:read("*a")
    handle:close()
    return trim(equinox_version)
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home .. '/.java-workspace/' .. project_name
local jar = jdtls_dir .. "plugins/" .. get_equinox_version()

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
    -- root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
    settings = {
        java = {}
    },
    init_options = {
        bundles = {}
    },
}
require('jdtls').start_or_attach(config)
