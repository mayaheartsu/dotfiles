--  _____                   _   
-- |_   _|                 | |  
--   | |  _ __  _ __  _   _| |_ 
--   | | | '_ \| '_ \| | | | __|
--  _| |_| | | | |_) | |_| | |_ 
-- |_____|_| |_| .__/ \__,_|\__|
--             | |              
--             |_|                                       

-- https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
    input = {
        kb_layout  = "us",
        repeat_rate = 35,
        repeat_delay = 200,
        accel_profile = "flat",
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        follow_mouse = 1,

        touchpad = {
            disable_while_typing = true,
            natural_scroll = true,
            clickfinger_behavior = true,
            middle_button_emulation = false,
            tap_to_click = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})
