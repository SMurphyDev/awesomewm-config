-- This module defines the launcher wwhich will be added to the wibar
local launcher = {}

local beautiful = require("beautiful")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Awsesome specific controls to display on the launcher
local myawesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

-- A powermenu to display on the launcher
local powermenu = {
	{
		"shutdown",
		function()
			awful.spawn("systemctl poweroff")
		end,
	},
	{
		"restart",
		function()
			awful.spawn("systemctl reboot")
		end,
	},
	{
		"suspend",
		function()
			awful.spawn("systemctl suspend")
		end,
	},
	{
		"sleep",
		function()
			awful.spawn("systemctl hybrid-sleep")
		end,
	},
	{
		"lock",
		function()
			awful.spawn("loginctl lock-session")
		end,
	},
}

-- A top level menu to aggregate our submenus.
local mymainmenu = awful.menu({
	items = {
		{ "awesome", myawesomemenu, beautiful.awesome_icon },
		{ "terminal", terminal },
		{ "power", powermenu },
	},
})

function launcher.create()
	return awful.widget.launcher({
		image = beautiful.awesome_icon,
		menu = mymainmenu,
	})
end

return launcher
