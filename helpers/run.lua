-- QUICK INTRO:
-- This whole file is meant to support the autostart.lua configuration. The functions defined here are mainly to check if
-- a process is already running or not, so that when awesome restarts, it does not spawn another instance of the process.


--- ┳┳┓┏┓┳┓┳┳┓ ┏┓┏┓
--- ┃┃┃┃┃┃┃┃┃┃ ┣ ┗┓
--- ┛ ┗┗┛┻┛┗┛┗┛┗┛┗┛
--- ~~~~~~~~~~~~~~~

local awful = require("awful")

--- ┓┏┏┓┳┓┳┏┓┳┓┓ ┏┓┏┓
--- ┃┃┣┫┣┫┃┣┫┣┫┃ ┣ ┗┓
--- ┗┛┛┗┛┗┻┛┗┻┛┗┛┗┛┗┛
--- ~~~~~~~~~~~~~~~~~

local tostring = tostring
local string = string
local ipairs = ipairs
local math = math
local os = os

local _run = {}

--- ┏┓┳┳┳┓┏┓┏┳┓┳┏┓┳┓┏┓
--- ┣ ┃┃┃┃┃  ┃ ┃┃┃┃┃┗┓
--- ┻ ┗┛┛┗┗┛ ┻ ┻┗┛┛┗┗┛
--- ~~~~~~~~~~~~~~~~~~

--- Ensures the process specified is started only once - this is used specifically for flameshot
function _run.run_once_pgrep(cmd)
        local findme = cmd
        local firstspace = cmd:find(" ")
        if firstspace then
                findme = cmd:sub(0, firstspace - 1)
        end
        awful.spawn.easy_async_with_shell(string.format("pgrep -u $USER -x %s > /dev/null || (%s)", findme, cmd))
end

--- Ensures the process specified is started only once - this is used specifically for polkit agent
function _run.run_once_ps(findme, cmd)
        awful.spawn.easy_async_with_shell(string.format("ps -C %s|wc -l", findme), function(stdout)
                if tonumber(stdout) ~= 2 then
                        awful.spawn(cmd, false)
                end
        end)
end

--- Ensures the process specified is started only once - this is used specifically for picom
function _run.check_if_running(command, running_callback, not_running_callback)
        awful.spawn.easy_async_with_shell(string.format("ps aux | grep '%s' | grep -v 'grep'", command), function(stdout)
                if stdout == "" or stdout == nil then
                        if not_running_callback ~= nil then
                                not_running_callback()
                        end
                else
                        if running_callback ~= nil then
                                running_callback()
                        end
                end
        end)
end

--- ┳┓┏┓┏┳┓┳┳┳┓┳┓
--- ┣┫┣  ┃ ┃┃┣┫┃┃
--- ┛┗┗┛ ┻ ┗┛┛┗┛┗
--- ~~~~~~~~~~~~~

return _run
