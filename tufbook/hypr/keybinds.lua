--------------
-- Keybinds --

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("CTRL + ALT + right",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("CTRL + ALT + down", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("CTRL + ALT + left",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Windows
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + D", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen",  action = "toggle" }))
hl.bind(mainMod .. " + CTRL + W", hl.dsp.layout("togglesplit"))    -- dwindle layout only

-- Move focus 
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + ALT + mouse:272", hl.dsp.window.resize(), { mouse = true })
hl.bind("mouse:276", hl.dsp.window.drag(),   { mouse = true })
hl.bind("mouse:275", hl.dsp.window.resize(), { mouse = true })

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind("ALT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Program Lanuch
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("zen-browser"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("dolphin"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("steam steam://open/gamepadui"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("code ~/.config/hypr/hyprland.lua"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("emby-theater"))

-- Hyprland Configs
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("code ~/.config/hypr/autostart.lua"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("code ~/.config/hypr/env.lua"))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.exec_cmd("code ~/.config/hypr/hyprland.lua"))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.exec_cmd("code ~/.config/hypr/input.lua"))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.exec_cmd("code ~/.config/hypr/keybinds.lua"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("code ~/.config/hypr/lookandfeel.lua"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("code ~/.config/hypr/monitors.lua"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("code ~/.config/hypr/permissions.lua"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("code ~/.config/hypr/workspace-window-rules.lua"))

-- Noctalia Bar
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("noctalia msg bar-toggle"))

-- Noctalia Settings
hl.bind("ALT + S", hl.dsp.exec_cmd("noctalia msg settings-toggle"))

-- Noctalia Launcher
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))

-- Noctalia GPU Switcher Plugin
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("noctalia msg panel-toggle baizhu/asus-gpu-mode:gpu-mode-panel"))

-- Noctalia Clipboard
hl.bind("ALT + C", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))

-- Hyprlock
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- Hyprshot
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region -o /home/hypr/Pictures/Screenshots"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window -o /home/hypr/Pictures/Screenshots"))
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m output -o /home/hypr/Pictures/Screenshots"))

-- Power
hl.bind(mainMod .. " + CTRL + SHIFT + DELETE", hl.dsp.exec_cmd("systemctl poweroff"))
hl.bind(mainMod .. " + CTRL + DELETE", hl.dsp.exec_cmd("reboot"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
