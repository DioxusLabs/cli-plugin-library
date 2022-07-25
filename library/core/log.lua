if plugin_logger ~= nil then
    return plugin_logger
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