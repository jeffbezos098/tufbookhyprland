---------------
-- Autostart --

-- Hyprland 
hl.on("hyprland.start", function()


-- Noctalia    
hl.exec_cmd("noctalia")

-- Drives
hl.exec_cmd("mount /mnt/split")

-- Programs
hl.exec_cmd("hyprlock")
hl.exec_cmd("kitty --hidden")
hl.exec_cmd("fdm --hidden")
hl.exec_cmd("discord --start-minimized")

-- Services
hl.exec_cmd("systemctl --user start hyprland-session.target")
hl.exec_cmd("kded6 &")
hl.exec_cmd("sudo systemctl enable --now tailscaled")
--hl.exec_cmd("systemctl --user start plasma-polkit-agent")

-- Clipboard
hl.exec_cmd("wl-paste --type text --watch cliphist store")
hl.exec_cmd("wl-paste --type image --watch cliphist store")

end)


-- Shutdown

hl.on("hyprland.shutdown", function()
    os.execute("umount ~/Battlestation")
    os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")

end)
