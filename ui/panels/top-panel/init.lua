--- ███╗   ███╗ ██████╗ ██████╗ ██╗   ██╗██╗     ███████╗███████╗
--- ████╗ ████║██╔═══██╗██╔══██╗██║   ██║██║     ██╔════╝██╔════╝
--- ██╔████╔██║██║   ██║██║  ██║██║   ██║██║     █████╗  ███████╗
--- ██║╚██╔╝██║██║   ██║██║  ██║██║   ██║██║     ██╔══╝  ╚════██║
--- ██║ ╚═╝ ██║╚██████╔╝██████╔╝╚██████╔╝███████╗███████╗███████║
--- ╚═╝     ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝╚══════╝
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

local awful = require("awful")
-- local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
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

    s.clock = require("ui.panels.top-panel.clock")(s)
	-- s.battery = require("ui.panels.top-panel.battery")()
	-- s.network = require("ui.panels.top-panel.network")()

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
            {
                {
                    layout = wibox.layout.align.horizontal,
					expand = "none",
					s.clock,
					-- tag_list(s),
                    {
                        -- system_tray(),
						-- s.battery,
						-- s.network,
						-- notif_panel(),
						-- layoutbox(),
						layout = wibox.layout.fixed.horizontal,
                    }
                },
                left = dpi(10),
				right = dpi(10),
				widget = wibox.container.margin,
            },
            bg = beautiful.wibar_bg,
			widget = wibox.container.background,
        }

    })

    s.top_panel:struts({
		top = s.top_panel.maximum_height,
	})

	--- Remove top_panel on full screen
	local function remove_top_panel(c)
		if c.fullscreen or c.maximized then
			c.screen.top_panel.visible = false
		else
			c.screen.top_panel.visible = true
		end
	end

	--- Remove top_panel on full screen
	local function add_top_panel(c)
		if c.fullscreen or c.maximized then
			c.screen.top_panel.visible = true
		end
	end

	--- Hide bar when a splash widget is visible
	awesome.connect_signal("widgets::splash::visibility", function(vis)
		screen.primary.top_panel.visible = not vis
	end)

	client.connect_signal("property::fullscreen", remove_top_panel)
	client.connect_signal("request::unmanage", add_top_panel)

end