--- ┳┳┓┏┓┳┓┳┳┓ ┏┓┏┓
--- ┃┃┃┃┃┃┃┃┃┃ ┣ ┗┓
--- ┛ ┗┗┛┻┛┗┛┗┛┗┛┗┛
--- ~~~~~~~~~~~~~~~

local awful = require("awful")
-- local filesystem = require("gears.filesystem")
-- local config_dir = filesystem.get_configuration_dir()
local helpers = require("helpers")

--- ┏┓┳┳┳┓┏┓┏┳┓┳┏┓┳┓┏┓
--- ┣ ┃┃┃┃┃  ┃ ┃┃┃┃┃┗┓
--- ┻ ┗┛┛┗┗┛ ┻ ┻┗┛┛┗┗┛
--- ~~~~~~~~~~~~~~~~~~

local function autostart_apps()
        --- Compositor
        -- helpers.run.check_if_running("picom", nil, function()
        --      awful.spawn("picom --config " .. config_dir .. "configuration/picom.conf", false)
        -- end)

        --- Flameshot (Screenshot Application)
        helpers.run.run_once_pgrep("flameshot")

        --- Touchpad Directions
        awful.spawn("xinput set-prop 'ELAN0676:00 04F3:3195 Touchpad' 'libinput Tapping Enabled' 1")
        awful.spawn("xinput set-prop 'ELAN0676:00 04F3:3195 Touchpad' 'libinput Natural Scrolling Enabled' 1")

        --- Set Key Delay
        awful.spawn("xset r rate 200 50")

	--- Set Monitor Configuration
	awful.spawn("xrandr --output HDMI-1 --mode 1920x1080 --above eDP-1 --output eDP-1 --mode 1920x1080 || xrandr --output DP-3 --mode 3440x1440 --above eDP-1 --output eDP-1 --mode 1920x1080")

        --- Polkit Agent (Authenticates things like software manager)
        -- helpers.run.run_once_ps(
        --         "polkit-gnome-authentication-agent-1",
        --         "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
        -- )
end

--- ┏┓┏┳┓┏┓┳┓┏┳┓
--- ┗┓ ┃ ┣┫┣┫ ┃ 
--- ┗┛ ┻ ┛┗┛┗ ┻ 
--- ~~~~~~~~~~~~

autostart_apps()
