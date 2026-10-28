--  _____                           _   _             
-- |  __ \                         | | (_)            
-- | |  | | ___  ___ ___  _ __ __ _| |_ _  ___  _ __  
-- | |  | |/ _ \/ __/ _ \| '__/ _` | __| |/ _ \| '_ \ 
-- | |__| |  __/ (_| (_) | | | (_| | |_| | (_) | | | |
-- |_____/ \___|\___\___/|_|  \__,_|\__|_|\___/|_| |_|
                                                    
-- https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 8,

        border_size = 1,

        --col = {
            --active_border   = { colors = {"0xffb4befe",}, angle = 45 },
            --inactive_border = "rgba(595959aa)",
        --},
        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,
    },

    decoration = {
        rounding = 5,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        dim_modal = true,
        dim_inactive = false,
        dim_strength = .35,

        shadow = {
            enabled = true,
            color = "0xffb4befe",
            color_inactive = "0x50000000",
            offset = "0 0",
            range = 8,
            render_power = 3,
            scale = 1.0,
            sharp = false,
        },

        blur = {
            enabled = true,
            variant = "acrylic",
            brightness = 0.8172,
            contrast = 0.8916,
            noise = 0.0117,
            vibrancy = 0.1696,
            vibrancy_darkness = 0,
            passes = 2,
            size = 6,
            popups = false,

            -- Blur variants listed underneath, the only one I really care to configure is acrylic
                acrylic = {
                    aberration = 0.25,
                    bulb = 24.0,
                    clarity = 0.82,
                    refraction = 24.0,
                    tint = 0x14EEF5FF,
                },
        },

        glow = {
            enabled = true,
            color = "0xee1a1a1a",
            range = 10,
            render_power = 3,
        },

        motion_blur = {
            enabled = true,
            samples = 7,
        },

        wobble = {
            enabled = false,
            mesh = 12,
            stiffness = 200,
            damping = 12,
            mass = 1,
            intensity = 0.2,
            value_epsilon = 0.25,
            velocity_epsilon = 2,
        },
    }}
)
