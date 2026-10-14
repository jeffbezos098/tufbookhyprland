---------------
-- Autostart --

-- Hyprland 
hl.on("hyprland.start", function()

-- Noctalia
hl.exec_cmd("noctalia")

-- Programs
hl.exec_cmd("hyprlock")
hl.exec_cmd("fdm --hidden")
hl.exec_cmd("kitty --hidden")
hl.exec_cmd("discord --start-minimized")
hl.exec_cmd("solaar -w hide")

-- Services
hl.exec_cmd("systemctl --user start hyprland-session.target")
hl.exec_cmd("kded6 &")
hl.exec_cmd("sudo systemctl enable --now tailscaled")

-- Clipboard
hl.exec_cmd("wl-paste --type text --watch cliphist store")
hl.exec_cmd("wl-paste --type image --watch cliphist store")

end)

-- Shutdown

hl.on("hyprland.shutdown", function()
    os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
    -- uses a blocking exec function and sleeps a bit to give things time to close
    -- you might also want to kill troublesome/crashing non-systemd background services here:
    -- os.execute("pkill wallpaperthing; systemctl --user stop hyprland-session.target && sleep 0.1")

end)
