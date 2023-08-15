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

-- Standard awesome library
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Notification library
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

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- Default modkey.
modkey = "Mod4"
-- }}}

-- {{{ Wallpaper
-- screen.connect_signal("request::wallpaper", function(s)
--     awful.wallpaper {
--         screen = s,
--         widget = {
--             {
--                 image     = beautiful.wallpaper,
--                 upscale   = true,
--                 downscale = true,
--                 widget    = wibox.widget.imagebox,
--             },
--             valign = "center",
--             halign = "center",
--             tiled  = false,
--             widget = wibox.container.tile,
--         }
--     }
-- end)
-- }}}

-- {{{ Wibar

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- screen.connect_signal("request::desktop_decoration", function(s)

--     -- Create a promptbox for each screen
--     s.mypromptbox = awful.widget.prompt()

--     -- Create an imagebox widget which will contain an icon indicating which layout we're using.
--     -- We need one layoutbox per screen.
--     s.mylayoutbox = awful.widget.layoutbox {
--         screen  = s,
--         buttons = {
--             awful.button({ }, 1, function () awful.layout.inc( 1) end),
--             awful.button({ }, 3, function () awful.layout.inc(-1) end),
--             awful.button({ }, 4, function () awful.layout.inc(-1) end),
--             awful.button({ }, 5, function () awful.layout.inc( 1) end),
--         }
--     }

--     -- Create a taglist widget
--     s.mytaglist = awful.widget.taglist {
--         screen  = s,
--         filter  = awful.widget.taglist.filter.all,
--         buttons = {
--             awful.button({ }, 1, function(t) t:view_only() end),
--             awful.button({ modkey }, 1, function(t)
--                                             if client.focus then
--                                                 client.focus:move_to_tag(t)
--                                             end
--                                         end),
--             awful.button({ }, 3, awful.tag.viewtoggle),
--             awful.button({ modkey }, 3, function(t)
--                                             if client.focus then
--                                                 client.focus:toggle_tag(t)
--                                             end
--                                         end),
--             awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
--             awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
--         }
--     }

--     -- Create a tasklist widget
--     s.mytasklist = awful.widget.tasklist {
--         screen  = s,
--         filter  = awful.widget.tasklist.filter.currenttags,
--         buttons = {
--             awful.button({ }, 1, function (c)
--                 c:activate { context = "tasklist", action = "toggle_minimization" }
--             end),
--             awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
--             awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
--             awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
--         }
--     }

--     -- Create the wibox
--     s.mywibox = awful.wibar {
--         position = "top",
--         screen   = s,
--         widget   = {
--             layout = wibox.layout.align.horizontal,
--             { -- Left widgets
--                 layout = wibox.layout.fixed.horizontal,
--                 mylauncher,
--                 s.mytaglist,
--                 s.mypromptbox,
--             },
--             s.mytasklist, -- Middle widget
--             { -- Right widgets
--                 layout = wibox.layout.fixed.horizontal,
--                 mykeyboardlayout,
--                 wibox.widget.systray(),
--                 mytextclock,
--                 s.mylayoutbox,
--             },
--         }
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

