-- Create a tasklist which will be displayed on each screen
local tasklist = {}

local awful = require("awful")
local gears = require("gears")

-- BECAUSE THEY DIDN'T PUT IT IN THE FUCKING DOCUMENTATION
-- 1 = The left mouse button.
-- 2 = The scrollwheel button.
-- 3 = The context menu button.
-- 4 = A scroll up increment.
-- 5 = A scroll down increment.
local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)

function tasklist.create(screen)
	local mytasklist = awful.widget.tasklist({
		screen = screen,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
	})

	return mytasklist
end

return tasklist
