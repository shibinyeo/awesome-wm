--- ███████╗██████╗      █████╗ ██╗    ██╗███████╗███████╗ ██████╗ ███╗   ███╗███████╗
--- ██╔════╝██╔══██╗    ██╔══██╗██║    ██║██╔════╝██╔════╝██╔═══██╗████╗ ████║██╔════╝
--- ███████╗██████╔╝    ███████║██║ █╗ ██║█████╗  ███████╗██║   ██║██╔████╔██║█████╗  
--- ╚════██║██╔══██╗    ██╔══██║██║███╗██║██╔══╝  ╚════██║██║   ██║██║╚██╔╝██║██╔══╝  
--- ███████║██████╔╝    ██║  ██║╚███╔███╔╝███████╗███████║╚██████╔╝██║ ╚═╝ ██║███████╗
--- ╚══════╝╚═════╝     ╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝

pcall(require, "luarocks.loader")
local gears = require("gears")
local beautiful = require("beautiful")

--- ┏┳┓┓┏┏┓┳┳┓┏┓
---  ┃ ┣┫┣ ┃┃┃┣ 
---  ┻ ┛┗┗┛┛ ┗┗┛

local theme_dir = gears.filesystem.get_configuration_dir() .. "theme/"
beautiful.init(theme_dir .. "theme.lua")

--- ┏┓┏┓┳┓┏┓┳┏┓┳┳┳┓┏┓┏┳┓┳┏┓┳┓┏┓
--- ┃ ┃┃┃┃┣ ┃┃┓┃┃┣┫┣┫ ┃ ┃┃┃┃┃┗┓
--- ┗┛┗┛┛┗┻ ┻┗┛┗┛┛┗┛┗ ┻ ┻┗┛┛┗┗┛

require("configuration")

--- ┳┳┓┏┓┳┓┳┳┓ ┏┓┏┓
--- ┃┃┃┃┃┃┃┃┃┃ ┣ ┗┓
--- ┛ ┗┗┛┻┛┗┛┗┛┗┛┗┛

-- require("modules")

--- ┳┳┳
--- ┃┃┃
--- ┗┛┻

require("ui")

--- ┏┓┏┓┳┓┳┓┏┓┏┓┏┓
--- ┃┓┣┫┣┫┣┫┣┫┃┓┣ 
--- ┗┛┛┗┛┗┻┛┛┗┗┛┗┛

--- Enable for lower memory consumption
-- collectgarbage("setpause", 110)
-- collectgarbage("setstepmul", 1000)
-- gears.timer({
--         timeout = 5,
--         autostart = true,
--         call_now = true,
--         callback = function()
--                 collectgarbage("collect")
--         end,
-- })

--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

local awful = require("awful")
require("awful.autofocus")
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
-- naughty.connect_signal("request::display_error", function(message, startup)
--     naughty.notification {
--         urgency = "critical",
--         title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
--         message = message
--     }
-- end)
-- }}}

-- {{{ Notifications

ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule       = { },
        properties = {
            screen           = awful.screen.preferred,
            implicit_timeout = 5,
        }
    }
end)

naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)

-- }}}

