--  _____                           _   _             
-- |  __ \                         | | (_)            
-- | |  | | ___  ___ ___  _ __ __ _| |_ _  ___  _ __  
-- | |  | |/ _ \/ __/ _ \| '__/ _` | __| |/ _ \| '_ \ 
-- | |__| |  __/ (_| (_) | | | (_| | |_| | (_) | | | |
-- |_____/ \___|\___\___/|_|  \__,_|\__|_|\___/|_| |_|
                                                    
-- https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 8,

        border_size = 1,

        col = {
            active_border   = { colors = {"0xffb4befe",}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,
    },

    decoration = {
        rounding       = 5,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        dim_modal = true,
        --dim_inactive = true,
        dim_strength = .35,

        shadow = {
            enabled      = true,
            range        = 8,
            render_power = 3,
            color        = "0xffb4befe",
            color_inactive = 0x50000000
        },

        blur = {
            enabled   = true,
            size      = 6,
            passes    = 2,
            vibrancy  = 0.1696,
            brightness = 0.8172,
            noise = 0.0117,
            popups = false,
        },
    }}
)