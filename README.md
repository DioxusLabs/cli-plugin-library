# Cli Plugin Library

> We provide some std library for **lua** plugin interaction.

```lua
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
```