
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

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


-- Permanent Workspace 

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


-- Fullscreen Window Rules


hl.window_rule({
    fullscreen = true,
    match = {
        class = "steam_app_.*"
    }
})


hl.window_rule({
    fullscreen = true,
    match = {
        class = "xenia_edge"
    }
})


hl.window_rule({
    fullscreen = true,
    match = {
        class = "rpcs3"
    }
})

hl.window_rule({
    fullscreen = true,
    match = {
        class = "Emby Theater"
    }
})

-- Float Window Rules

hl.window_rule({
    float = true,
    match = {
        class = "com.shellyorg.shelly"
    }
})


hl.window_rule({
    float = true,
    match = {
        class = "org.kde.partitionmanager"
    }
})

