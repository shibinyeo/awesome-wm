-- local filesystem = require("gears.filesystem")
-- local config_dir = filesystem.get_configuration_dir()

return {
        default = {
                terminal = "alacritty",
                text_editor = "nvim",
                web_browser = "microsoft-edge-beta",
                file_manager = "ranger",
                -- app_launcher = "rofi -no-lazy-grab -show drun -modi drun -theme " .. config_dir .. "configuration/rofi.rasi",
        },
}
