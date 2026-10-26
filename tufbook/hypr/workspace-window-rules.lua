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


-- eDP-1

hl.workspace_rule({
    workspace = "1",
    persistent = true,
    monitor = "eDP-1",
})

hl.workspace_rule({
    workspace = "2",
    persistent = true,
    monitor = "eDP-1",
})

hl.workspace_rule({
    workspace = "3",
    persistent = true,
    monitor = "eDP-1",
})

hl.workspace_rule({
    workspace = "4",
    persistent = true,
    monitor = "eDP-1",
})


-- eDP-2

hl.workspace_rule({
    workspace = "9",
    persistent = true,
    monitor = "eDP-2",
})

hl.workspace_rule({
    workspace = "10",
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
    opacity = "0.85 0.85",
    match = {
        class = "discord"
    }
})

-- Dolphin
hl.window_rule({
    opacity = "0.75 0.75",
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

-- Mission Center
hl.window_rule({
    opacity = "0.75 0.75",
    match = {
        class = "io.missioncenter.MissionCenter"
    }
})

-- Partition Manager
hl.window_rule({
    opacity = "0.75 0.75",
    match = {
        class = "org.kde.partitionmanager"
    }
})

-- Pavucontrol
hl.window_rule({
    opacity = "0.75 0.75",
    match = {
        class = "org.pulseaudio.pavucontrol"
    }
})

-- Shelly
hl.window_rule({
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

-- VSCode
hl.window_rule({
    opacity = "0.90 0.90",
    match = {
        class = "code-oss"
    }
})

-- Xenia
hl.window_rule({
    fullscreen = true,
    match = {
        class = "xenia_edge"
    }
})
