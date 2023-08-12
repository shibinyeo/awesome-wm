--- ┳┳┓┏┓┳┓┳┳┓ ┏┓┏┓
--- ┃┃┃┃┃┃┃┃┃┃ ┣ ┗┓
--- ┛ ┗┗┛┻┛┗┛┗┛┗┛┗┛
--- ~~~~~~~~~~~~~~~

local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
-- local beautiful = require("beautiful")
-- local naughty = require("naughty")
-- local decorations = require("ui.decorations")
local helpers = require("helpers")
local apps = require("configuration.default-apps")

--- ┓┏┏┓┳┓┳┏┓┳┓┓ ┏┓┏┓
--- ┃┃┣┫┣┫┃┣┫┣┫┃ ┣ ┗┓
--- ┗┛┛┗┛┗┻┛┗┻┛┗┛┗┛┗┛
--- ~~~~~~~~~~~~~~~~~

mod = "Mod4"
alt = "Mod1"
ctrl = "Control"
shift = "Shift"

--- ?????????? ---
--- The next lines will show shortcuts for tmux and vim
-- require("awful.hotkeys_popup.keys")
--- ?????????? ---

--- ┏┓┓ ┏┓┳┓┏┓┓   ┏┓┓┏┏┓┳┓┏┳┓┏┓┳┳┏┳┓┏┓
--- ┃┓┃ ┃┃┣┫┣┫┃   ┗┓┣┫┃┃┣┫ ┃ ┃ ┃┃ ┃ ┗┓
--- ┗┛┗┛┗┛┻┛┛┗┗┛  ┗┛┛┗┗┛┛┗ ┻ ┗┛┗┛ ┻ ┗┛
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
awful.keyboard.append_global_keybindings({
	
    --- APPLICATIONS
    --- ~~~~~~~~~~~~
    
    awful.key(
        { mod }, "Return",
	function()
	  awful.spawn(apps.default.terminal)
        end,
	{ description = "open terminal", group = "App" }
    ),

    -- awful.key(
    --     { mod }, "r",
    --     function()
    --         awful.spawn.with_shell(apps.default.app_launcher)
    --     end,
    --     { description = "open app launcher", group = "App" }
    -- ),
    
    -- TEMPORARY LAUNCHER
    awful.key(
        { mod }, "r",
        function () awful.screen.focused().mypromptbox:run() end,
	{ description = "run prompt", group = "launcher" }
    ),

    awful.key(
        { mod }, "f",
        function()
            awful.spawn.with_shell(apps.default.terminal .. ' -e ' .. apps.default.file_manager)
        end,
        { description = "open ranger", group = "App" }
    ),

    awful.key(
        { mod }, "w",
	function()
            awful.spawn(apps.default.web_browser)
        end,
	{ description = "open web browser", group = "App" }
    ),

    awful.key(
        { mod }, "s",
	function()
            awful.spawn("spotify")
        end,
	{ description = "open spotify", group = "App" }
    ),

    awful.key(
        { mod }, "t",
	function()
            awful.spawn("telegram-desktop")
        end,
	{ description = "open telegram", group = "App" }
    ),

    awful.key(
        { mod }, "o",
	function()
            awful.spawn("obsidian")
        end,
	{ description = "open obsidian", group = "App" }
    ),

    awful.key(
        { mod }, "a",
        function()
            awful.spawn("anki")
        end,
	{ description = "open anki", group = "App" }
    ),

    awful.key(
        {}, "Print",
        function()
            awful.spawn("flameshot gui --clipboard --accept-on-select")
        end,
	{ description = "take a screenshot", group = "App" }
    ),

    --- AWESOME WM FUNCTIONS
    --- ~~~~~~~~~~~~~~~~~~~~

    awful.key(
        { mod, ctrl }, "r",
	awesome.restart,
	{ description = "reload awesome", group = "WM" }
    ),

    awful.key(
        { mod, shift }, "q",
	awesome.quit,
        { description = "quit awesome", group = "WM" }
    ),

    awful.key(
        { mod }, "/",
        hotkeys_popup.show_help,
        { description = "show help", group = "WM" }
    ),

    -- awful.key(
    --     { mod, shift }, "Escape",
    --     function()
    --         awesome.emit_signal("module::exit_screen:show")
    --     end,
    --     { description = "exit screen", group = "hotkeys" }
    -- ),

    --- CLIENT NAVIGATION
    --- ~~~~~~~~~~~~~~~~~
    
    awful.key({ mod }, "k",     function() awful.client.focus.bydirection("up")    end, { description = "focus up",    group = "Client" }),
    awful.key({ mod }, "up",    function() awful.client.focus.bydirection("up")    end, { description = "focus up",    group = "Client" }),

    awful.key({ mod }, "j",     function() awful.client.focus.bydirection("down")  end, { description = "focus down",  group = "Client" }),
    awful.key({ mod }, "down",  function() awful.client.focus.bydirection("down")  end, { description = "focus down",  group = "Client" }),

    awful.key({ mod }, "h",     function() awful.client.focus.bydirection("left")  end, { description = "focus left",  group = "Client" }),
    awful.key({ mod }, "left",  function() awful.client.focus.bydirection("left")  end, { description = "focus left",  group = "Client" }),

    awful.key({ mod }, "l",     function() awful.client.focus.bydirection("right") end, { description = "focus right", group = "Client" }),
    awful.key({ mod }, "right", function() awful.client.focus.bydirection("right") end, { description = "focus right", group = "Client" }),

    --- SYSTEM SHORTCUTS
    --- ~~~~~~~~~~~~~~~~

    awful.key(
        {}, "XF86AudioRaiseVolume",
        function()
            awful.spawn("pamixer --allow-boost --set-limit 150 -i 5 -u", false)
            -- awesome.emit_signal("widget::volume")
            -- awesome.emit_signal("module::volume_osd:show", true)
        end
    ),

    awful.key(
        {}, "XF86AudioLowerVolume",
        function()
            awful.spawn("pamixer --allow-boost --set-limit 150 -d 5 -u", false)
            -- awesome.emit_signal("widget::volume")
            -- awesome.emit_signal("module::volume_osd:show", true)
        end
    ),

    awful.key(
        {}, "XF86AudioMute",
        function()
            awful.spawn("pamixer --toggle-mute", false)
        end
    ),

    awful.key(
        {}, "XF86MonBrightnessUp",
        function()
            awful.spawn("brightnessctl set 5%+ -q", false)
            -- awesome.emit_signal("widget::brightness")
            -- awesome.emit_signal("module::brightness_osd:show", true)
        end
    ),

    awful.key(
        {}, "XF86MonBrightnessDown",
        function()
            awful.spawn("brightnessctl set 5%- -q", false)
            -- awesome.emit_signal("widget::brightness")
            -- awesome.emit_signal("module::brightness_osd:show", true)
        end
    ),

})


--- ┏┓┓ ┳┏┓┳┓┏┳┓  ┏┓┓┏┏┓┳┓┏┳┓┏┓┳┳┏┳┓┏┓
--- ┃ ┃ ┃┣ ┃┃ ┃   ┗┓┣┫┃┃┣┫ ┃ ┃ ┃┃ ┃ ┗┓
--- ┗┛┗┛┻┗┛┛┗ ┻   ┗┛┛┗┗┛┛┗ ┻ ┗┛┗┛ ┻ ┗┛
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

client.connect_signal("request::default_keybindings", function()

    awful.keyboard.append_client_keybindings({

	--- MOVE CLIENT WINDOW POSITIONS
	--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        awful.key({ mod, shift }, "k",     function(c) helpers.client.move_client(c, "up")    end, { description = "swap client up",    group = "client" }),
        awful.key({ mod, shift }, "up",    function(c) helpers.client.move_client(c, "up")    end, { description = "swap client up",    group = "client" }),

        awful.key({ mod, shift }, "j",     function(c) helpers.client.move_client(c, "down")  end, { description = "swap client down",  group = "client" }),
        awful.key({ mod, shift }, "down",  function(c) helpers.client.move_client(c, "down")  end, { description = "swap client down",  group = "client" }),

        awful.key({ mod, shift }, "h",     function(c) helpers.client.move_client(c, "left")  end, { description = "swap client left",  group = "client" }),
        awful.key({ mod, shift }, "left",  function(c) helpers.client.move_client(c, "left")  end, { description = "swap client left",  group = "client" }),

        awful.key({ mod, shift }, "l",     function(c) helpers.client.move_client(c, "right") end, { description = "swap client right", group = "client" }),
        awful.key({ mod, shift }, "right", function(c) helpers.client.move_client(c, "right") end, { description = "swap client right", group = "client" }),

        awful.key({ ctrl, alt }, "Down", function() client.focus:move_to_screen() end, { description = "move window to next screen", group = "screen" }),
        awful.key({ mod, shift }, "Tab", function(c) c:move_to_screen() end, { description = "move client to other screen", group = "screen" }),

	--- TOGGLE CLIENT LAYOUT MODE
	--- ~~~~~~~~~~~~~~~~~~~~~~~~~
	
	awful.key(
	    { mod }, "m",
	    function()
                client.focus.fullscreen = not client.focus.fullscreen
                client.focus:raise()
            end,
	    { description = "toggle fullscreen", group = "layout" }
	),

	awful.key(
	    { mod }, "d",
	    function()
                local c = client.focus
                if c then
                    if awful.layout.get(c) == awful.layout.suit.tile then
                        awful.layout.set(awful.layout.suit.floating, c)
                    else
                        awful.layout.set(awful.layout.suit.tile, c)
                    end
                end
            end,
	    {description = "toggle tiling", group = "layout"}
	),

        -- awful.key(
	--     { mod }, "m",
	--     function(c)
        --         c.maximized = not c.maximized
        --         c:raise()
        --     end,
	--     { description = "toggle maximize", group = "client" }
	-- ),
	
	--- OTHER CLIENT MANAGEMENT SHORTCUTS
	--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
        awful.key(
	    { mod }, "Escape",
	    function()
                client.focus:kill()
            end, { description = "close window", group = "App" }
	),

        -- awful.key(
	--     { alt }, "Tab",
	--     function()
        --         awesome.emit_signal("window_switcher::turn_on")
        --     end, { description = "turn on window switcher", group = "app" }
	-- ),

    })

end)
 
--- ┳┓┏┓┓┏┳┏┓┏┓┏┳┓┏┓  ┓ ┏┏┓┳┓┓┏┓┏┓┏┓┏┓┏┓┏┓┏┓
--- ┃┃┣┫┃┃┃┃┓┣┫ ┃ ┣   ┃┃┃┃┃┣┫┃┫ ┗┓┃┃┣┫┃ ┣ ┗┓
--- ┛┗┛┗┗┛┻┗┛┛┗ ┻ ┗┛  ┗┻┛┗┛┛┗┛┗┛┗┛┣┛┛┗┗┛┗┛┗┛
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
awful.keyboard.append_global_keybindings({

    --- NAVIGATE TAGS
    --- ~~~~~~~~~~~~~~~~~~~

    awful.key(
        { mod }, "Tab",
	awful.tag.history.restore,
        {description = "go to previous tag", group = "Workspace"}
    ),

    awful.key {
        modifiers   = { mod },
        keygroup    = "numrow",
        description = "change to tag",
        group       = "Workspace",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { mod, ctrl },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "Workspace",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { mod, shift },
        keygroup    = "numrow",
        description = "move window to tag",
        group       = "Workspace",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },

    --- NAVIGATE SCREENS
    --- ~~~~~~~~~~~~~~~~

    awful.key({ mod }, "`", function () awful.screen.focus_relative(1) end, { description = "focus the next screen", group = "Workspace" }),
    -- awful.key({ mod, ctrl }, "k", function () awful.screen.focus_relative(-1) end, { description = "focus the previous screen", group = "Workspace" }),

    --- NAVIGATE LAYOUTS
    --- ~~~~~~~~~~~~~~~~

    awful.key({ mod }, "space", function () awful.layout.inc(1) end, { description = "select next layout", group = "Workspace" }),
    -- awful.key({ mod, shift }, "space", function () awful.layout.inc(-1) end, { description = "select previous layout", group = "Workspace" }),

})
 
--- ┳┳┓┏┓┳┳┏┓┏┓  ┳┓┳┳┓┳┓┳┳┓┏┓┏┓
--- ┃┃┃┃┃┃┃┗┓┣   ┣┫┃┃┃┃┃┃┃┃┃┓┗┓
--- ┛ ┗┗┛┗┛┗┛┗┛  ┻┛┻┛┗┻┛┻┛┗┗┛┗┛
--- ~~~~~~~~~~~~~~~~~~~~~~~~~~~

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({}          , 1, function(c) c:activate({ context = "mouse_click"                          }) end),
        awful.button({ mod, alt }, 1, function(c) c:activate({ context = "mouse_click", action = "mouse_move"   }) end),
        awful.button({ mod }     , 3, function(c) c:activate({ context = "mouse_click", action = "mouse_resize" }) end),
    })
end)

-- awful.mouse.append_global_mousebindings({
-- 
--     awful.button({}, 1, function() naughty.destroy_all_notifications() end),
-- 
-- })
