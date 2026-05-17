--  _                             _   
-- | |                           | |  
-- | |     __ _ _   _  ___  _   _| |_ 
-- | |    / _` | | | |/ _ \| | | | __|
-- | |___| (_| | |_| | (_) | |_| | |_ 
-- |______\__,_|\__, |\___/ \__,_|\__|
--               __/ |                
--              |___/       

-- https://wiki.hypr.land/Configuring/Layouts/

hl.config({
  general = {
  layout = "master",
  },
})

hl.config({
  dwindle = {
      force_split                  = 0,
      preserve_split               = false,
      smart_split                  = false,
      smart_resizing               = true,
      permanent_direction_override = false,
      special_scale_factor         = 1,
      split_width_multiplier       = 1.0,
      use_active_for_splits        = true,
      default_split_ratio          = 1.0,
      split_bias                   = 0,
      precise_mouse_move           = false,
  },
})

hl.config({
  master = {
      mfact                        = 0.55,
      new_status                   = "slave",
      new_on_top                   = true,
      orientation                  = "left",
  },
})

hl.config({
  scrolling = {
     fullscreen_on_one_column      = true,
     column_width                  = 0.5,
     focus_fit_method              = 1,
     follow_focus                  = true,
     follow_min_visible            = 0.4,
     explicit_column_widths        = 0.33, 0.5, 0.667, 1.0,
     direction                     = "right",
  },
})
