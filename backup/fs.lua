local fs = {}

if PLUGIN_FS ~= nil then
    fs = PLUGIN_FS
else
    -- just mock data & function
    fs = {
        exists = function (path)
            return false
        end,
        is_dir = function (path)
            return false
        end,
        is_file = function (path)
            return false
        end,
        create_dir = function (path, recursive)
            return true
        end,
        remove_dir = function (path)
            return true
        end,
        file_get_content = function (path)
            return "File Content"
        end,
        file_set_content = function (path, content)
            return true
        end,
        unzip_file = function (path, target)
            return true
        end
    }
end

return fs