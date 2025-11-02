local M = {}

--- Join an array with a path separator
--- @param parts any[]
--- @return string
local function joinPath(parts)
    return vim.fn.join(parts, "/")
end

math.randomseed(os.time())

local artDir = joinPath({vim.fn.stdpath("config"), "lua", "ascii"})

local function list_files()
    local files = {}
    local entries = vim.fn.readdir(artDir)

    if not entries then
        vim.print("Could not read directory or directory does not exist")
    end

    for _, entry in ipairs(entries) do
        if vim.fn.isdirectory(entry) == 0 then
            table.insert(files, entry)
        end
    end
    return files
end

local function getRandomHeader()
    local files = list_files()
    local selected = files[math.random(#files)]

    local filePath = joinPath({ artDir, selected })
    local file = io.open(filePath, "r")

    local lines = {'', ''}
    if file then
        for line in file:lines() do
            table.insert(lines, line)
        end
        table.insert(lines, '')
        table.insert(lines, '')
        file:close()
    else
        vim.print("Could not open file " .. filePath)
    end
    return lines
end

local header = nil

function M.getHeader()
    if header == nil then
        header = getRandomHeader()
    end
    return header
end

return M
