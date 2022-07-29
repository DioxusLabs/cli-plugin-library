local command = require("command")
local fs = require("fs")

local downloader = {
    -- clone repo from git
    clone_repo = function (url, path)
        command.exec({"git", "clone", url, path}, "null", "null")
        return fs.exists(path) and fs.is_dir(path)
    end
}

if PLUGIN_DOWNLOADER ~= nil then
    for key, value in pairs(PLUGIN_LOGGER) do
        downloader[key] = value
    end
end

return downloader