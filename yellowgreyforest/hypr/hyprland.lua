-- Originally based off of the cachyos default .lua

-- Main Config Contains Autostart, Default Programs and Keybinds

-- All other Settings are required in there own .lua listed below

-- Please backup before editing configs

-- Monitor settings are based off my system, edit monitors.lua first so you have display after you move the dot files

-- Require
require("monitors")
require("env")
require("permissions")
require("lookandfeel")
require("misc")
require("input")
require("windows-workspaces")


-- Autostart

-- Hyprland 
hl.on("hyprland.start", function()

-- Programs
hl.exec_cmd("hyprpaper")
hl.exec_cmd("wayle panel start")
hl.exec_cmd("hyprlock")
hl.exec_cmd("hypridle")
hl.exec_cmd("fdm --hidden")
hl.exec_cmd(terminal)
-- hl.exec_cmd("discord")

-- Services
hl.exec_cmd("systemctl --user start hyprland-session.target")
hl.exec_cmd("systemctl --user enable --now hyprpolkitagent")
hl.exec_cmd("kded6 &")
hl.exec_cmd("sudo systemctl enable --now tailscaled")
-- hl.exec_cmd("sleep 30 && sshfs hypr@battlestation:/ ~/Battlestation")

-- Clipboard
hl.exec_cmd("wl-paste --type text --watch cliphist store")
hl.exec_cmd("wl-paste --type image --watch cliphist store")

end)


-- Shutdown

hl.on("hyprland.shutdown", function()
    os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
    -- uses a blocking exec function and sleeps a bit to give things time to        
    -- you might also want to kill troublesome/crashing non-systemd background services here:
    -- os.execute("pkill wallpaperthing; systemctl --user stop hyprland-session.target && sleep 0.1")

end)


-- Programs

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "hyprlauncher"
local browser     = "zen-browser"

-- Keybinds

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Windows
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + D", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen",  action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.layout("togglesplit"))    -- dwindle layout only

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
-- hl.bind("mouse:276", hl.dsp.window.drag(),   { mouse = true })
-- hl.bind("mouse:275", hl.dsp.window.resize(), { mouse = true })


for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Program Lanuch
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("steam steam://open/gamepadui"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("code ~/.config/hypr/hyprland.lua"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("emby-theater"))

-- Hyprlauncher
hl.bind("ALT + SPACE", hl.dsp.exec_cmd(menu))

-- Hyprlock
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- Hyprshot
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region -o /home/hypr/Pictures/Screenshots"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m window -o /home/hypr/Pictures/Screenshots"))
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m output -o /home/hypr/Pictures/Screenshots"))

-- Walker
hl.bind("ALT + C", hl.dsp.exec_cmd("cliphist list | walker -d | cliphist decode | wl-copy"))

-- Wayle Bar
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("wayle panel toggle"))

-- Power
hl.bind(mainMod .. " + CTRL + SHIFT + DELETE", hl.dsp.exec_cmd("shutdown now"))
hl.bind(mainMod .. " + SHIFT + DELETE", hl.dsp.exec_cmd("reboot"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

