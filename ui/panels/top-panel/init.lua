--- ███╗   ███╗ ██████╗ ██████╗ ██╗   ██╗██╗     ███████╗███████╗
--- ████╗ ████║██╔═══██╗██╔══██╗██║   ██║██║     ██╔════╝██╔════╝
--- ██╔████╔██║██║   ██║██║  ██║██║   ██║██║     █████╗  ███████╗
--- ██║╚██╔╝██║██║   ██║██║  ██║██║   ██║██║     ██╔══╝  ╚════██║
--- ██║ ╚═╝ ██║╚██████╔╝██████╔╝╚██████╔╝███████╗███████╗███████║
--- ╚═╝     ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝╚══════╝
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
-- local helpers = require("helpers")
local widgets = require("ui.widgets")
local wbutton = require("ui.widgets.button")
local animation = require("modules.animation")

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
	s.battery = require("ui.panels.top-panel.battery")()
	-- s.network = require("ui.panels.top-panel.network")()

    --- ANIMATED TAG LIST
    --- ~~~~~~~~~~~~~~~~~

    --- Create Taglist Buttons - what happens when clicking on taglist
    local modkey = "Mod4"
	local taglist_buttons = gears.table.join(
		awful.button({}, 1, function(t)
			t:view_only()
		end)
	) 

    local function tag_list(s)
        
        --- Define Taglist
		local taglist = awful.widget.taglist({

			screen = s,
			filter = awful.widget.taglist.filter.all,
			layout = { layout = wibox.layout.fixed.horizontal },
			widget_template = {

				widget = wibox.container.margin,
				forced_width = dpi(40),
				forced_height = dpi(40),

				create_callback = function(self, c3, _)
					local indicator = wibox.widget({
						widget = wibox.container.place,
						valign = "center",
						{
							widget = wibox.container.background,
							forced_height = dpi(8),
							shape = gears.shape.rounded_bar,
						},
					})

					self.indicator_animation = animation:new({
						duration = 0.125,
						easing = animation.easing.linear,
						update = function(self, pos)
							indicator.children[1].forced_width = pos
						end,
					})

					self:set_widget(indicator)

					if c3.selected then
						self.widget.children[1].bg = beautiful.accent
						self.indicator_animation:set(dpi(32))
					elseif #c3:clients() == 0 then
						self.widget.children[1].bg = beautiful.color8
						self.indicator_animation:set(dpi(8))
					else
						self.widget.children[1].bg = beautiful.accent
						self.indicator_animation:set(dpi(16))
					end
				end,

				update_callback = function(self, c3, _)
					if c3.selected then
						self.widget.children[1].bg = beautiful.accent
						self.indicator_animation:set(dpi(32))
					elseif #c3:clients() == 0 then
						self.widget.children[1].bg = beautiful.color8
						self.indicator_animation:set(dpi(8))
					else
						self.widget.children[1].bg = beautiful.accent
						self.indicator_animation:set(dpi(16))
					end
				end,
			},

			buttons = taglist_buttons,

		})

        --- Define Taglist Widget
		local widget = wbutton.elevated.state({
			normal_bg = beautiful.widget_bg,
			normal_shape = gears.shape.rounded_bar,
			child = {
				taglist,
				margins = { left = dpi(10), right = dpi(10) },
				widget = wibox.container.margin,
			},
		})

        --- Create Taglist Widget
		return wibox.widget({
			widget,
			margins = dpi(5),
			widget = wibox.container.margin,
		})
	end

    --- SYSTRAY
    --- ~~~~~~~

    --- NOTIFICATION PANEL
    --- ~~~~~~~~~~~~~~~~~~

    --- LAYOUT BOX
    --- ~~~~~~~~~~

    local function layoutbox()

        --- Define Layoutbox Buttons - what happens when clicked
		local layoutbox_buttons = gears.table.join(

			--- Left click
			awful.button({}, 1, function(c)
				awful.layout.inc(1)
			end),

			--- Right click
			awful.button({}, 3, function(c)
				awful.layout.inc(-1)
			end)

		)

        --- Define Layoutbox
		s.mylayoutbox = awful.widget.layoutbox()
		s.mylayoutbox:buttons(layoutbox_buttons)

        --- Define Layoutbox Widget
		local widget = wbutton.elevated.state({
			child = s.mylayoutbox,
			normal_bg = beautiful.wibar_bg,
		})

        --- Create Layoutbox Widget
		return widget

	end

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
					tag_list(s),
                    {
                        -- system_tray(),
						s.battery,
						-- s.network,
						-- notif_panel(),
						layoutbox(),
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
	-- local function remove_top_panel(c)
	-- 	if c.fullscreen or c.maximized then
	-- 		c.screen.top_panel.visible = false
	-- 	else
	-- 		c.screen.top_panel.visible = true
	-- 	end
	-- end

	-- --- Remove top_panel on full screen
	-- local function add_top_panel(c)
	-- 	if c.fullscreen or c.maximized then
	-- 		c.screen.top_panel.visible = true
	-- 	end
	-- end

	--- Hide bar when a splash widget is visible
	awesome.connect_signal("widgets::splash::visibility", function(vis)
		screen.primary.top_panel.visible = not vis
	end)

	-- client.connect_signal("property::fullscreen", remove_top_panel)
	-- client.connect_signal("request::unmanage", add_top_panel)

end