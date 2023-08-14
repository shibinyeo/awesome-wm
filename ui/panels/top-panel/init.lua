--- ███╗   ███╗ ██████╗ ██████╗ ██╗   ██╗██╗     ███████╗███████╗
--- ████╗ ████║██╔═══██╗██╔══██╗██║   ██║██║     ██╔════╝██╔════╝
--- ██╔████╔██║██║   ██║██║  ██║██║   ██║██║     █████╗  ███████╗
--- ██║╚██╔╝██║██║   ██║██║  ██║██║   ██║██║     ██╔══╝  ╚════██║
--- ██║ ╚═╝ ██║╚██████╔╝██████╔╝╚██████╔╝███████╗███████╗███████║
--- ╚═╝     ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝╚══════╝
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

local awful = require("awful")
-- local gears = require("gears")
-- local wibox = require("wibox")
local beautiful = require("beautiful")
-- local xresources = require("beautiful.xresources")
-- local dpi = xresources.apply_dpi
-- local helpers = require("helpers")
-- local widgets = require("ui.widgets")
-- local wbutton = require("ui.widgets.button")
-- local animation = require("modules.animation")

--- ████████╗ ██████╗ ██████╗     ██████╗  █████╗ ███╗   ██╗███████╗██╗     
--- ╚══██╔══╝██╔═══██╗██╔══██╗    ██╔══██╗██╔══██╗████╗  ██║██╔════╝██║     
---    ██║   ██║   ██║██████╔╝    ██████╔╝███████║██╔██╗ ██║█████╗  ██║     
---    ██║   ██║   ██║██╔═══╝     ██╔═══╝ ██╔══██║██║╚██╗██║██╔══╝  ██║     
---    ██║   ╚██████╔╝██║         ██║     ██║  ██║██║ ╚████║███████╗███████╗
---    ╚═╝    ╚═════╝ ╚═╝         ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

return function(s)

    --- ┳┓┏┓┏┓┳┳┓┏┓  ┏┓┏┓┳┳┓┏┓┏┓┳┓┏┓┳┓┏┳┓┏┓
    --- ┃┃┣ ┣ ┃┃┃┣   ┃ ┃┃┃┃┃┃┃┃┃┃┃┣ ┃┃ ┃ ┗┓
    --- ┻┛┗┛┻ ┻┛┗┗┛  ┗┛┗┛┛ ┗┣┛┗┛┛┗┗┛┛┗ ┻ ┗┛
    --- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    --- WIDGETS
    --- ~~~~~~~

    --- ANIMATED TAG LIST
    --- ~~~~~~~~~~~~~~~~~

    --- SYSTRAY
    --- ~~~~~~~

    --- NOTIFICATION PANEL
    --- ~~~~~~~~~~~~~~~~~~

    --- LAYOUT BOX
    --- ~~~~~~~~~~

    --- ┏┓┳┓┏┓┏┓┏┳┓┏┓  ┏┓┏┓┳┓┏┓┓ 
    --- ┃ ┣┫┣ ┣┫ ┃ ┣   ┃┃┣┫┃┃┣ ┃ 
    --- ┗┛┛┗┗┛┛┗ ┻ ┗┛  ┣┛┛┗┛┗┗┛┗┛
    --- ~~~~~~~~~~~~~~~~~~~~~~~~~

    s.top_panel = awful.popup({

        screen = s,
        type = "dock",
        maximum_height = beautiful.wibar_height,
		minimum_width = s.geometry.width,
        placement = function(c)
			awful.placement.top(c)
		end,
        bg = beautiful.transparent,

        widget = {
            -- STOPPED HERE
        }

    })

end