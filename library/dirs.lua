local dirs = {}

if PLUGIN_DIRS ~= nil then
    dirs = PLUGIN_DIRS
else
    dirs = {
        plugin_dir = function ()
            return "./"
        end,
        self_dir = function (name)
            return "./" .. name
        end,
        document_dir = function ()
            return "./Documents"
        end,
        download_dir = function ()
            return "./Downloads"
        end
    }
end

return dirs