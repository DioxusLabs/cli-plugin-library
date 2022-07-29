local dirs = {}

if PLUGIN_DIRS ~= nil then
    dirs = PLUGIN_DIRS
else
    dirs = {
        plugin_dir = function ()
            return "./"
        end
    }
end