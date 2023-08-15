--- ███╗   ███╗ ██████╗ ██████╗ ██╗   ██╗██╗     ███████╗███████╗
--- ████╗ ████║██╔═══██╗██╔══██╗██║   ██║██║     ██╔════╝██╔════╝
--- ██╔████╔██║██║   ██║██║  ██║██║   ██║██║     █████╗  ███████╗
--- ██║╚██╔╝██║██║   ██║██║  ██║██║   ██║██║     ██╔══╝  ╚════██║
--- ██║ ╚═╝ ██║╚██████╔╝██████╔╝╚██████╔╝███████╗███████╗███████║
--- ╚═╝     ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝╚══════╝
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")
local wbutton = require("ui.widgets.button")

---  ██████╗██╗      ██████╗  ██████╗██╗  ██╗
--- ██╔════╝██║     ██╔═══██╗██╔════╝██║ ██╔╝
--- ██║     ██║     ██║   ██║██║     █████╔╝ 
--- ██║     ██║     ██║   ██║██║     ██╔═██╗ 
--- ╚██████╗███████╗╚██████╔╝╚██████╗██║  ██╗
---  ╚═════╝╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

return function(s)

    --- Define Clock Properties
    local clock = wibox.widget {
        widget = wibox.widget.textclock,
        format = "%a %b %e %l:%M %p",
		align = "center",
		valign = "center",
		font = beautiful.font_name .. "Medium 12",
    }
    
    --- Define Clock color
    local accent_color = beautiful.white
    clock.markup = helpers.ui.colorize_text(clock.text, accent_color)
	
    --- Refresh Clock's text every minute   
    clock:connect_signal("widget::redraw_needed", function()
		clock.markup = helpers.ui.colorize_text(clock.text, accent_color)
	end)

    --- Define the widget
	local widget = wbutton.elevated.state({
		child = clock,
		normal_bg = beautiful.wibar_bg,
        hover_effect = false
	})

    return widget

end