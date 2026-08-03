--  __  __             _ _                 
-- |  \/  |           (_) |                
-- | \  / | ___  _ __  _| |_ ___  _ __ ___ 
-- | |\/| |/ _ \| '_ \| | __/ _ \| '__/ __|
-- | |  | | (_) | | | | | || (_) | |  \__ \
-- |_|  |_|\___/|_| |_|_|\__\___/|_|  |___/

-- https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Machine specific settings - adjust accordingly!

-- Right Monitor
hl.monitor({
    output = "DP-1",
    mode = "2560x1440@240",
    position = "2560x0",
    scale = 1,
    bitdepth = 10,
    cm = "hdr",
    vrr = 3,  -- 1 = Always on, 2 = fullscreen only, 3 = only game or video
    supports_wide_color = 1,
    supports_hdr = 1,
    sdrbrightness = 1.0, -- Think of this variable as a multiplier that applies after sdr_max_luminance. Keep it simple and keep at 1. Make more finite adjustments via sdr_max_luminance instead.
    sdrsaturation = 1.0,
    sdr_min_luminance = 0.0005,  -- Allow true black in SDR mode
    sdr_max_luminance = 300, -- BT.2408 target is 203 nits SDR, 1000 nits HDR. Macbook Pro M1 is 500 nits SDR, 1000 - 1600 nits HDR. Macbook Pro M3 and beyond are 600 - 1000 nits SDR, 1000 - 1600 nits HDR. Steam Deck OLED is 600 nits SDR, 1000 nits HDR. All listed SDR values area peak values, likely half of that brightness during regular use. Go with your heart and don't melt your eyes
    min_luminance = 0.0005,
    max_luminance = 880,
    sdr_eotf = "auto",
})

-- Left Monitor
hl.monitor({
    output = "DP-2",
    mode = "2560x1440@240",
    position = "0x0",
    scale = 1,
    bitdepth = 10,
    cm = "hdr",
    vrr = 3,  -- 1 = Always on, 2 = fullscreen only, 3 = only game or video
    supports_wide_color = 1,
    supports_hdr = 1,
    sdrbrightness = 1.0, -- Think of this variable as a multiplier that applies after sdr_max_luminance. Keep it simple and keep at 1.0. Make more finite adjustments via sdr_max_luminance instead
    sdrsaturation = 1.0,
    sdr_min_luminance = 0.0005,  -- Allow true black in SDR mode
    sdr_max_luminance = 300, -- BT.2408 target is 203 nits SDR, 1000 nits HDR. Macbook Pro M1 is 500 nits SDR, 1000 - 1600 nits HDR. Macbook Pro M3 and beyond are 600 - 1000 nits SDR, 1000 - 1600 nits HDR. Steam Deck OLED is 600 nits SDR, 1000 nits HDR. All listed SDR values area peak values, likely half of that brightness during regular use. Go with your heart and don't melt your eyes
    min_luminance = 0.0005,
    max_luminance = 880,
    sdr_eotf = "auto",
})

-- HDR rendering settings
hl.config({
    render = ({
        direct_scanout = 0, -- Enables direct scanout. Direct scanout attempts to reduce lag when there is only one fullscreen application on a screen (e.g. game). It is also recommended to set this to false if the fullscreen application shows graphical glitches. 2 - off, 1 - on, 2 - auto (on with content type ‘game’)
        -- Set this to 0 to avoid breakage in HDR. If left on, direct_scanout will disrupt hyprland's ability to properly facilitate hdr swapchain. A lot of heartache went into learning about this
        -- cm_fs_passthrough = 2,  -- 1 = always pass through color settings, 2 = HDR only
        cm_sdr_eotf = "gamma22force", -- Default transfer function for displaying SDR apps. "default" - Use default value (sRGB), "gamma22" - Treat unspecified as Gamma 2.2, "gamma22force" - Treat unspecified and sRGB as Gamma 2.2, "srgb" - Treat unspecified as sRGB
        cm_auto_hdr = 2, -- Auto-switch to HDR in fullscreen when needed. 0 - off, 1 - switch to cm, hdr, 2 - switch to cm, hdredid
        -- cm_auto_hdr = 0 if games refuse to play nice and appear with washed out colors
    }
)})

hl.config({
    general = {
    -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = true,
    }
})

hl.config({
    quirks = ({
        prefer_hdr = 1,
    }
)})
