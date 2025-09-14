-- Create an imagebox widget which will contain an icon indicating which
-- layout we're using. We need one layoutbox per screen.
local layoutbox = {}

local awful = require("awful")
local gears = require("gears")

function layoutbox.create(screen)
	local mylayoutbox = awful.widget.layoutbox(screen)
	mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))

	return mylayoutbox
end

return layoutbox
