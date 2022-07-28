if PLUGIN_LOGGER ~= nil then
    return PLUGIN_LOGGER
else
    return {
        trace = function (info)
            print("[Trace]: " .. info)
        end,
        debug = function (info)
            print("[Debug]: " .. info)
        end,
        info = function (info)
            print("[Info]: " .. info)
        end,
        warn = function (info)
            print("[Warning]: " .. info)
        end,
        error = function (info)
            print("[Error]: " .. info)
        end,
    }
end