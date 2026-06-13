require("hyprland.variables")
--Application open binds
hl.bind("SUPER + S", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(browser .. " --private-window"))
hl.bind("SUPER + SHIFT + H", hl.dsp.exec_cmd("hyprpicker | wl-copy"))
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(file_manager))
hl.bind("SUPER + P", hl.dsp.exec_cmd("screenshot.sh"))
hl.bind("SUPER + R", hl.dsp.exec_cmd(searchmenu))

--Window operations.
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + V", hl.dsp.window.float())

--Moving focus between tiled windows.
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

--Moving between workspaces
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 0 }))

--Moving windows between workspaces
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

--Reloading Applications
hl.bind("SUPER + SHIFT + R", hl.dsp.submap("reload"))
hl.define_submap("reload", "reset", function()
	hl.bind("W", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))
	hl.bind("escape", hl.dsp.submap("reset"))
end)

hl.bind("SUPER + O + B", hl.dsp.exec_cmd("open-book.sh"))

--Mouse Binds
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

--Media Key binds
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("SUPER + Left", hl.dsp.exec_cmd("playerctl position 5-"), { repeating = true, dont_inhibit = true })
hl.bind("SUPER + Right", hl.dsp.exec_cmd("playerctl position 5+"), { repeating = true, dont_inhibit = true })
hl.bind("SUPER + Up", hl.dsp.exec_cmd("playerctl next"))
hl.bind("SUPER + Down", hl.dsp.exec_cmd("playerctl previous"))
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ repeating = "true" }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"),
	{ repeating = "true" }
)

--Quit hyprland
hl.bind(
	"SUPER + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")
)
