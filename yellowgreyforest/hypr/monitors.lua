-- Monitors

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
    mode     = "1920x1200@144",
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
