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
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")

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

-- naughty.connect_signal("request::display", function(n)
--     naughty.layout.box { notification = n }
-- end)

-- }}}

