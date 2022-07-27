if plugin_commander ~= nil then
    return plugin_commander
else
    return {
        exec = function (cmd)
            print("Mock Exec Command : " .. cmd)
        end,
        execQuiet = function (cmd)
            print("Mock Exec Command [Quiet] : " .. cmd)
        end
    }
end