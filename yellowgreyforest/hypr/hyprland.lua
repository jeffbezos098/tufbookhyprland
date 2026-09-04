--------------
-- Programs --

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "hyprlauncher"
local browser     = "zen-browser"


--------------
-- Monitors --

hl.monitor({
    output   = "eDP-2",
    mode     = "1920x1200@144",
    position = "0x0",
    scale    = "1",
    vrr      = true, 
    
    --  disabled = true,

})

hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1200@90",
    position = "0x0",
    scale    = "1",
    vrr      = true,

--  disabled = true,

})

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "3840x2160@60",
    position = "-1920x0",
    scale    = "2",
    vrr      = false,
    
--  disabled = true,

})


---------------
-- Autostart --

-- Hyprland 
hl.on("hyprland.start", function()

-- Programs
hl.exec_cmd("hyprlock")
hl.exec_cmd("fdm --hidden")
hl.exec_cmd("kitty --hidden")
hl.exec_cmd("discord --start-minimized")

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
    os.execute("umount ~/Battlestation")
    os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")

end)


---------
-- ENV --

-- Cursor
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "18")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "18")

-- Session
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_MENU_PREFIX", "plasma-")

-- Themes
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "0")
hl.env("QT_ENABLE_HIGHDPI_SCALING", "1")
hl.env("QT_SCALE_FACTOR", "1")
hl.env("QT_SCALE_FACTOR_ROUNDING_POLICY", "PassThrough")


-----------
-- Input --

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",
        
        numlock_by_default = true,
        
        follow_mouse = 1,

        sensitivity = .2,

        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.5,
            disable_while_typing = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


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
hl.bind("ALT + right",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("ALT + down", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("ALT + left",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

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
hl.bind("mouse:276", hl.dsp.window.drag(),   { mouse = true })
hl.bind("mouse:275", hl.dsp.window.resize(), { mouse = true })


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
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window -o /home/hypr/Pictures/Screenshots"))
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m output -o /home/hypr/Pictures/Screenshots"))

-- Walker
hl.bind("ALT + C", hl.dsp.exec_cmd("cliphist list | walker -d | cliphist decode | wl-copy"))

-- Wayle Bar
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("wayle panel toggle"))

-- Power
hl.bind(mainMod .. " + CTRL + SHIFT + DELETE", hl.dsp.exec_cmd("systemctl poweroff"))
hl.bind(mainMod .. " + SHIFT + DELETE", hl.dsp.exec_cmd("reboot"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))


-------------------
-- Look and Feel --

hl.config({
    general = {
        gaps_in  = 1,
        gaps_out = 1,

        border_size = 0,

        col = {
            active_border   = { colors = {"rgba(00A9DDFF)", "rgba(00A9DD40)"}, angle = 90 },
            inactive_border = "rgba(00A9DD40)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = true,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 0,
        rounding_power = 0,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 3,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 0.8, stiffness = 350, dampening = 25, })

hl.animation({ leaf = "global",        enabled = true, speed = 15,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 8,    bezier = "easeOutQuint" })

-- Windows: faster, but same spring/feel
hl.animation({ leaf = "windows",       enabled = true, speed = 8.0,  spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 8.5,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 3.0,  bezier = "linear",       style = "popin 87%" })

hl.animation({ leaf = "fadeIn",        enabled = true, speed = 3.0,  bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 2.6,  bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 5.0,  bezier = "quick" })

hl.animation({ leaf = "layers",        enabled = true, speed = 6.0,  bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 6.5,  bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 2.6,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 3.0,  bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2.3,  bezier = "almostLinear" })

hl.animation({ leaf = "workspaces",    enabled = true, speed = 3.2,  bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 2.1,  bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 3.2,  bezier = "almostLinear", style = "fade" })

hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 11,   bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})


-----------------
-- Permissions --

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

 hl.config({
   ecosystem = {
     enforce_permissions = false,
   },
 })

 hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
 hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
 hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------
 -- Misc --

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
        disable_watchdog_warning = true,
    },
})


----------------------------
-- Windows and Workspaces --

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})


-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})


-- Permanent Workspace Rules

-- eDP-2

hl.workspace_rule({
    workspace = "1",
    persistent = true,
    monitor = "eDP-2",
})

hl.workspace_rule({
    workspace = "2",
    persistent = true,
    monitor = "eDP-2",
})

hl.workspace_rule({
    workspace = "3",
    persistent = true,
    monitor = "eDP-2",
})

hl.workspace_rule({
    workspace = "4",
    persistent = true,
    monitor = "eDP-2",
})

-- HDMI-A-1

hl.workspace_rule({
    workspace = "5",
    persistent = true,
    monitor = "HDMI-A-1",
})

hl.workspace_rule({
    workspace = "6",
    persistent = true,
    monitor = "HDMI-A-1",
})

hl.workspace_rule({
    workspace = "7",
    persistent = true,
    monitor = "HDMI-A-1",
})

hl.workspace_rule({
    workspace = "8",
    persistent = true,
    monitor = "HDMI-A-1",
})


-- Custom Window Rules by Application

-- Discord
hl.window_rule({
    workspace = "4 silent",
    opacity = "0.75 0.75",
    match = {
        class = "discord"
    }
})

-- Dolphin
hl.window_rule({
    opacity = "0.7 0.7",
    match = {
        class = "org.kde.dolphin"
    }
})

-- Emby
hl.window_rule({
    fullscreen = true,
    match = {
        class = "Emby Theater"
    }
})

-- Gearlever
hl.window_rule({
    opacity = "0.75 0.75",
    match = {
        class = "it.mijorus.gearlever"
    }
})


-- Partition Manager
hl.window_rule({
    float = true,
    size = { 1440, 900},
    opacity = "0.75 0.75",
    match = {
        class = "org.kde.partitionmanager"
    }
})

-- Shelly
hl.window_rule({
    float = true,
    size = { 1440, 900},
    opacity = "0.75 0.75",
    match = {
        class = "com.shellyorg.shelly"
    }
})

-- Steam Games
hl.window_rule({
    fullscreen = true,
    match = {
        class = "steam_app_.*"
    }
})

-- Xenia
hl.window_rule({
    fullscreen = true,
    match = {
        class = "xenia_edge"
    }
})
