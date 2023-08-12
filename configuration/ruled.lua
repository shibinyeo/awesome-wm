--- ┳┳┓┏┓┳┓┳┳┓ ┏┓┏┓
--- ┃┃┃┃┃┃┃┃┃┃ ┣ ┗┓
--- ┛ ┗┗┛┻┛┗┛┗┛┗┛┗┛
--- ~~~~~~~~~~~~~~~

local awful = require("awful")
local beautiful = require("beautiful")
local ruled = require("ruled")
local helpers = require("helpers")

--- ┳┓┳┳┓ ┏┓┏┓
--- ┣┫┃┃┃ ┣ ┗┓
--- ┛┗┗┛┗┛┗┛┗┛
--- ~~~~~~~~~~

--- Get screen geometry
local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

ruled.client.connect_signal("request::rules", function()
	
    --- Applies to all clients
    --- ~~~~~~~~~~~~~~~~~~~~~~
    
    ruled.client.append_rule({
        id = "global",
        rule = {},
        properties = {
            raise = true,
            size_hints_honor = false,
            honor_workarea = true,
            honor_padding = true,
            screen = awful.screen.focused,
            focus = awful.client.focus.filter,
            titlebars_enabled = beautiful.titlebar_enabled,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
        },
    })

    --- Clients that should float and be centered
    --- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    ruled.client.append_rule({
        id = "floating",
        rule_any = {
            role = {
                "pop-up",
                "GtkFileChooserDialog",
                "conversation",
            },
            type = {
                "dialog",
            },
        },
        properties = {
            floating = true,
            placement = helpers.client.centered_client_placement
        },
    })

    --- Image Viewers
    --- ~~~~~~~~~~~~~
    
    ruled.client.append_rule({
        rule_any = {
            class = {
                "feh",
                "imv",
            },
        },
        properties = {
            floating = true,
            width = screen_width * 0.7,
            height = screen_height * 0.75,
        },
        callback = function(c)
            awful.placement.centered(c, { honor_padding = true, honor_workarea = true })
        end,
    })

    --- Which clients need not have titlebars
    --- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    ruled.client.append_rule({
    	id = "titlebars",
    	rule_any = {
    	    class = {
    	    	"Spotify",
		"obsidian",
    	    },
    	},
    	properties = {
    	    titlebars_enabled = false,
    	},
    })

    --- Clients to open in tag 1
    --- ~~~~~~~~~~~~~~~~~~~~~~~~
    
    ruled.client.append_rule({
        rule_any = {
            class = {
                "Microsoft-edge-beta",
            },
        },
        properties = {
            tag = "1",
        },
    })

    --- Clients to open in Tag 2
    --- ~~~~~~~~~~~~~~~~~~~~~~~~
    
    ruled.client.append_rule({
        rule_any = {
            class = {
                "obsidian",
            },
        },
        properties = {
            tag = "2",
        },
    })

    --- Clients to open in Tag 3
    --- ~~~~~~~~~~~~~~~~~~~~~~~~
    
    ruled.client.append_rule({
        rule_any = {
            class = {
                "Anki",
            },
        },
        properties = {
            tag = "3",
        },
    })

    --- Clients to open in Tag 5
    --- ~~~~~~~~~~~~~~~~~~~~~~~~
    
    ruled.client.append_rule({
        rule_any = {
            class = {
                "TelegramDesktop",
            },
        },
        properties = {
            tag = "5",
        },
    })

    --- Clients to open in Tag 6
    --- ~~~~~~~~~~~~~~~~~~~~~~~~
    
    ruled.client.append_rule({
        rule_any = {
            class = {
                "org.gnome.clocks",
    	        "Spotify",
            },
        },
        properties = {
            tag = "6",
        },
    })

end)
