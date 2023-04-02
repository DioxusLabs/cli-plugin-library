---@class Manager
---@source https://github.com/DioxusLabs/cli-plugin-library
---@field name string                       Plugin name
---@field repository string                 Plugin git repository
---@field version string                    Plugin version info
---@field author string                     Plugin author info
--- |
---@field on_init function                  Plugin *first time* load event
local manager = {

    name = "<unknwon>",
    repository = "",
    version = "0.1.0",
    author = "YuKun Liu <mrxzx.info@gmail.com>",

    on_init = function() end,

    ---@class InnerField
    ---@field plugin_dir string
    ---@field from_loader boolean
    inner = {
        plugin_dir = "",
        from_loader = false,
    },

    ---@class BuildEvent
    ---@field on_start function | nil
    ---@field on_finish function | nil
    build = {
        on_start = nil,
        on_finish = nil,
    },


    ---@class ServeEvent
    ---@field on_start fun(info: ServeStartInfo) | nil
    ---@field on_rebuild fun(info: ServeRebuildInfo) | nil
    ---@field on_shutdown function | nil
    serve = {
        on_start = nil,
        on_rebuild = nil,
        on_shutdown = nil,
    }

}

return manager
