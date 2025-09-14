-- A simple widget to display my battery percentage on the task bar
local battery = {}

local awful = require("awful")

function battery.create()
	return awful.widget.watch("cat /sys/class/power_supply/BAT0/capacity", 120, function(widget, stdout)
		widget:set_text(string.format("battery: %s", stdout))
	end)
end

return battery
