-- Environment Variables
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QS_ICON_THEME", "Papirus-Dark")

-- Autostart
hl.on("hyprland.start", function()
	hl.exec_cmd("caelestia-shell -d")
	hl.exec_cmd("sleep 1 && protonvpn-app")
	hl.exec_cmd("otd-daemon &")
end)

-- Monitors
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

-- Core Configuration
hl.config({
	input = {
		kb_layout = "us",
		kb_options = "compose:ralt",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = true,
		},
	},
	general = {
		gaps_in = 0,
		gaps_out = 0,
		border_size = 0,
		["col.active_border"] = "rgba(000000ff)",
		layout = "dwindle",
	},
	decoration = {
		rounding = 0,
		blur = {
			enabled = true,
			size = 10,
			passes = 3,
			new_optimizations = true,
			ignore_opacity = true,
			noise = 0.3,
			contrast = 2,
			brightness = 1,
			vibrancy = 0.3,
			vibrancy_darkness = 0.0,
		},
		active_opacity = 1.0,
		inactive_opacity = 0.8,
		fullscreen_opacity = 1.0,
	},
	animations = {
		enabled = true,
	},
	misc = {
		disable_hyprland_logo = false,
	},
	dwindle = {
		preserve_split = true,
	},
	master = {
		new_status = "master",
	},
})

-- Curves (Replaces hl.bezier)
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("md3_standard", { type = "bezier", points = { { 0.2, 0 }, { 0, 1 } } })
hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("md3_accel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.8 }, { 0.1, 1.02 } } })
hl.curve("crazyshot", { type = "bezier", points = { { 0.1, 1.0 }, { 0.76, 0.92 } } })
hl.curve("hyprnostretch", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.0 } } })
hl.curve("menu_decel", { type = "bezier", points = { { 0.1, 1 }, { 0, 1 } } })
hl.curve("menu_accel", { type = "bezier", points = { { 0.38, 0.04 }, { 1, 0.07 } } })
hl.curve("easeInOutCirc", { type = "bezier", points = { { 0.85, 0 }, { 0.15, 1 } } })
hl.curve("easeOutCirc", { type = "bezier", points = { { 0, 0.55 }, { 0.45, 1 } } })
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("softAcDecel", { type = "bezier", points = { { 0.26, 0.26 }, { 0.15, 1 } } })
hl.curve("md2", { type = "bezier", points = { { 0.4, 0 }, { 0.2, 1 } } })
hl.curve("gentle_spring", { type = "bezier", points = { { 0.3, 1.1 }, { 0.4, 1 } } })

-- Animations (Using 'bezier' instead of 'curve')
hl.animation({ leaf = "windows", enabled = true, speed = 3.6, bezier = "gentle_spring", style = "popin 90%" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3.6, bezier = "gentle_spring", style = "popin 90%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3.6, bezier = "md3_accel", style = "popin 60%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.6, bezier = "md3_decel" })
hl.animation({ leaf = "layers", enabled = true, speed = 2.6, bezier = "md3_decel", style = "slide" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.6, bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2.2, bezier = "menu_accel" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 2.6, bezier = "gentle_spring" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.1, bezier = "menu_accel" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 7.6, bezier = "menu_decel", style = "slidefade 15%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.6, bezier = "gentle_spring", style = "slidevert" })

-- Window Rules
hl.window_rule({ match = { class = "pavucontrol" }, float = true })
hl.window_rule({ match = { class = "blueman-manager" }, float = true })
hl.window_rule({ match = { class = "nm-connection-editor" }, float = true })
hl.window_rule({ match = { class = "zen" }, workspace = "2" })
hl.window_rule({ match = { class = "neovide" }, workspace = "3" })
hl.window_rule({ match = { class = "vesktop" }, workspace = "3" })
hl.window_rule({ match = { class = "org.telegram.desktop" }, workspace = "4" })
hl.window_rule({ match = { class = "Spotify" }, workspace = "4" })
hl.window_rule({ match = { class = "neovide" }, fullscreen = true })
hl.window_rule({
	match = { class = "LiveSplitOne" },
	opacity = "0.4 0.4 override",
	no_blur = true,
})

-- Layer Rules
hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "rofi" }, blur = true })
hl.layer_rule({
	match = { namespace = "caelestia-drawers" },
	blur = true,
	ignore_alpha = 0.8,
})

-- Binds
local mainMod = "SUPER"
local terminal = "kitty"
local fileManager = "thunar"
local menu = "caelestia-shell ipc call drawers toggle launcher"
local notifbar = "caelestia-shell ipc call drawers toggle sidebar"
local screenlock = "caelestia-shell ipc call lock lock"

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exit())
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(fileManager .. " ~/Pictures/Wallpapers"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + R", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + T", hl.dsp.window.pin())
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(notifbar))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("caelestia-shell record"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd(screenlock))

-- Move tiles
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Move focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))

-- Resize Submap (Replaces binde and submap_start/end)
hl.bind("ALT + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
	-- The { repeating = true } flag replaces 'binde'
	hl.bind("l", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind("h", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
	hl.bind("j", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Switch & Move workspaces
for i = 1, 9 do
	hl.bind(mainMod .. " + " .. tostring(i), hl.dsp.focus({ workspace = tostring(i) }))
	hl.bind(mainMod .. " + SHIFT + " .. tostring(i), hl.dsp.window.move({ workspace = tostring(i) }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

-- Mouse Binds (Replaces bindm with { mouse = true } flag)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop / Media Keys
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 10%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })

-- General Function Keys
hl.bind("ALT + F6", hl.dsp.exec_cmd("brightnessctl set 10%+"))
hl.bind("ALT + F5", hl.dsp.exec_cmd("brightnessctl set 10%-"))
hl.bind("ALT + F3", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("ALT + F2", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })

-- Screenshot & Zoom
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -zm region -o ~/Pictures/Screenshots"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("hyprshot -zm window -o ~/Pictures/Screenshots"))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd("boomer"))

-- Media control (Replaces bindl with { locked = true } flag)
hl.bind(mainMod .. " + ALT + K", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind(mainMod .. " + ALT + J", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd("playerctl next"), { locked = true })

-- Scroll for pen
hl.bind(mainMod .. " + h", hl.dsp.exec_cmd("ydotool click 1"))
hl.bind(mainMod .. " + mouse_down", hl.dsp.exec_cmd("ydotool click 5"))
