---@class Manager
---@source https://github.com/DioxusLabs/cli-plugin-library
---@field name string               Plugin name
---@field repository string         Plugin git repository
---@field version string            Plugin version info
---@field author string             Plugin author info
--- |
---@field on_init function          Plugin *first time* load event
local manager = {

    name = "<unknwon>",
    repository = "",
    version = "0.1.0",
    author = "YuKun Liu <mrxzx.info@gmail.com>",

    on_init = function() end,

    ---@class BuildEvent
    ---@field on_start function | nil
    ---@field on_finish function | nil
    build = {
        on_start = nil,
        on_finish = nil,
    },


    ---@class ServeEvent
    ---@field interval_time integer
    ---@field on_start fun(info: BuildStartInfo) | nil
    ---@field on_rebuild function | nil
    ---@field on_interval function | nil
    ---@field on_shutdown function | nil
    serve = {
        interval_time = 0,
        on_start = nil,
        on_rebuild = nil,
        on_interval = nil,
        on_shutdown = nil,
    }

}

return manager
