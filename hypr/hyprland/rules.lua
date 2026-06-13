hl.window_rule({
	name = "fix-xwayland-drags",

	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = true,
		pin = true,
	},

	no_focus = true,
})

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

--[[
hl.window({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = {20}
})
]]

hl.window_rule({
	name = "float-ebboks",
	match = { initial_class = "calibre-ebook-viewer" },
	float = true,
	size = { 600, 800 },
})
