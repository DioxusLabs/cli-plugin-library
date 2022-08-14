local dirs = {}

if PLUGIN_DIRS ~= nil then
    dirs = PLUGIN_DIRS
else
    dirs = {
        plugin_dir = function ()
            return "./Plugins/"
        end,
        self_dir = function (name)
            return "./Plugins/" .. name .. "/"
        end,
        document_dir = function ()
            return "./Documents/"
        end,
        download_dir = function ()
            return "./Downloads/"
        end,
        cache_dir = function ()
            return "./Caches/"
        end,
    }
end

return dirs