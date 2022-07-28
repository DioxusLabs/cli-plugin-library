if PLUGIN_COMMAND ~= nil then
    return PLUGIN_COMMAND
else
    return {
        exec = function (cmd, stdout, stderr)
            print("Mock Exec Command : " .. cmd)
        end,
    }
end