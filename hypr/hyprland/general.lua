require("hyprland.variables")

hl.on("hyprland.start", function()
	hl.exec_cmd(browser)
	hl.exec_cmd(navbar)
	hl.exec_cmd(wallpaper)
end)

--General config
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 1,

		col = { active_border = "#414a4d", inactive_border = "#272c2e" },

		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},
})

--Decoration config
hl.config({
	decoration = {
		rounding = 4,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		dim_inactive = true,
		dim_strength = 0.3,

		shadow = { enabled = false },

		blur = { enabled = false },
	},
})

--Disable animation, if I want any I'll write it.

hl.config({
	animations = { enabled = false },
})

--Input config
hl.config({
	input = {
		kb_layout = "us",
		kb_options = "caps:escape",

		accel_profile = "flat",
		follow_mouse = 0,
		sensitivity = 0,

		touchpad = {
			disable_while_typing = true,
			natural_scroll = false,
		},
	},
})

--Miscellaneous config
hl.config({
	misc = {
		disable_hyprland_logo = false,
	},
})
