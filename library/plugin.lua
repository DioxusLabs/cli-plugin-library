local function dump(object)
    if type(object) == 'table' then
        local s = '{ '
        for k,v in pairs(object) do
           if type(k) ~= 'number' then k = '"'..k..'"' end
           s = s .. '['..k..'] = ' .. dump(v) .. ','
        end
        return s .. '} '
     else
        return tostring(object)
     end
end

local api = {
    log = {
        ---@type fun(info: string)
        trace = plugin_lib.log.trace,
        ---@type fun(info: string)
        debug = plugin_lib.log.debug,
        ---@type fun(info: string)
        info = plugin_lib.log.info,
        ---@type fun(info: string)
        warn = plugin_lib.log.warn,
        ---@type fun(info: string)
        error = plugin_lib.log.error,
    },
    command = {
        ---@alias stdio
        --- | '"inhert"'
        --- | '"piped"'
        --- | '"null"'
        ---@type fun(cmd: string[], stdout: stdio, stderr: stdio)
        exec = plugin_lib.command.exec,
    },
    network = {
        ---@type fun(url: string, path: string): boolean
        clone_repo = plugin_lib.network.clone_repo,
        ---@type fun(url: string, path: string): boolean
        download_file = plugin_lib.network.download_file,
        ---@type fun(url: string): string
        download_content = plugin_lib.network.get_content,
    },
    os = {
        ---@alias platform
        --- | '"windows"'
        --- | '"macos"'
        --- | '"linux"'
        ---@type fun(): platform
        current_platform = plugin_lib.os.current_platform,
    }
}

return api