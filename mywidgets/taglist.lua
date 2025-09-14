-- Create a taglist widget which will be displayed on each screen
local taglist = {}

local awful = require("awful")
local gears = require("gears")

-- BECAUSE THEY DIDN'T PUT IT IN THE FUCKING DOCUMENTATION
-- 1 = The left mouse button.
-- 2 = The scrollwheel button.
-- 3 = The context menu button.
-- 4 = A scroll up increment.
-- 5 = A scroll down increment.
local taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
	end)
)

function taglist.create(screen)
	local mytaglist = awful.widget.taglist({
		screen = screen,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	})

	return mytaglist
end

return taglist
