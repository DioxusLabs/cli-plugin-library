-- dump function
local function dump(object)
    if type(object) == 'table' then
        local s = '{ '
        for k, v in pairs(object) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(object)
    end
end

---@class PluginApi
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
        -- ---@type fun(url: string, path: string): boolean
        -- clone_repo = plugin_lib.network.clone_repo,
        ---@type fun(url: string, path: string): boolean
        download_file = plugin_lib.network.download_file,
        -- ---@type fun(url: string): string
        -- download_content = plugin_lib.network.get_content,
    },
    fs = {
        ---@type fun(path: string, recursive: boolean): boolean
        create_dir = plugin_lib.fs.create_dir,
        ---@type fun(path: string): boolean
        remove_dir = plugin_lib.fs.remove_dir,
        ---@type fun(path: string): string
        file_get_content = plugin_lib.fs.file_get_content,
        ---@type fun(path: string, content: string): boolean
        file_set_content = plugin_lib.fs.file_set_content,
        ---@type fun(path: string, target: string): boolean
        unzip_file = plugin_lib.fs.unzip_file,
    },
    os = {
        ---@alias platform
        --- | '"windows"'
        --- | '"macos"'
        --- | '"linux"'
        ---@type fun(): platform
        current_platform = plugin_lib.os.current_platform,
    },
    path = {
        ---@type fun(path: string, extra: string): string
        join = plugin_lib.path.join,
        ---@type fun(path: string): boolean
        exists = plugin_lib.fs.exists,
        ---@type fun(path: string): boolean
        is_dir = plugin_lib.fs.is_dir,
        ---@type fun(path: string): boolean
        is_file = plugin_lib.fs.is_file,
    },
    dirs = {},
    tool = {
        dump = dump,
    }
}

do
    local private_value = {
        ---@type string | nil
        name = nil,
        ---@type string | nil
        repository = nil,
        ---@type string | nil
        author = nil,
        ---@type string | nil
        version = nil,
        ---@type string
        dir_name = current_dir_name,
    }

    ---@param manager Manager
    function api.init(manager)
        private_value.name = manager.name
        private_value.repository = manager.repository
        private_value.author = manager.author
        private_value.version = manager.version
    end

    ---@return string
    function api.dirs.plugin_dir()
        ---@type string
        local root_dir = plugin_lib.dirs.plugins_dir()
        return api.path.join(root_dir, current_dir_name)
    end

    ---@return string
    function api.dirs.bin_dir()
        local root_dir = api.dirs.plugin_dir()
        return api.path.join(root_dir, "bin")
    end

    ---@return string
    function api.dirs.temp_dir()
        local root_dir = api.dirs.plugin_dir()
        return api.path.join(root_dir, "temp")
    end

    ---@param url string
    ---@param path string
    ---@return boolean
    function api.network.clone_repo(url, path)
        api.command.exec({ "git", "clone", url, path }, "null", "null")
        return api.fs.exists(path) and api.fs.is_dir(path)
    end

end

return api
