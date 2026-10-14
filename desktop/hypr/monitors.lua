
-- Samsung TV
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "3840x2160@60",
    position = "0x0",
    scale    = "2",
   
     mirror = "HDMI-A-2",
   
    -- disabled = true,
    
})

-- Gigabyte Ultrawide
hl.monitor({
    output   = "DP-1",
    mode     = "3440x1440@144",
    position = "1920x0",
    scale    = "1",
   
    -- mirror = "HDMI-A-1",
    
    -- disabled = true,

})

-- Asus Secondary
hl.monitor({
    output   = "HDMI-A-2",
    mode     = "1920x1080@75",
    position = "5360x300",
    scale    = "1",
    
    -- mirror = "HDMI-A-1",
    
    -- disabled = true,

})