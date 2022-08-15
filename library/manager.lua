---@class Manager
---@source https://github.com/DioxusLabs/cli-plugin-library
---@field name string               Plugin name
---@field repository string         Plugin git repository
---@field version string            Plugin version info
---@field author string             Plugin author info
--- |
---@field on_init function          Plugin *first time* load event
---@field on_load function          Plugin load event
---@field on_build_start function   CLI start to build event
---@field on_build_finish function     CLI end to build event

---@type Manager
local manager = {
    name = "<unknwon>",
    repository = "",
    version = "0.1.0",
    author = "YuKun Liu <mrxzx.info@gmail.com>",

    on_init = function () end,
    on_load = function () end,
    on_build_start = function () end,
    on_build_finish = function () end,
}

return manager