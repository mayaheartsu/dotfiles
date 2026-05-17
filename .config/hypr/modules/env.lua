--  ______            
-- |  ____|           
-- | |__   _ ____   __
-- |  __| | '_ \ \ / /
-- | |____| | | \ V / 
-- |______|_| |_|\_/  

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "32")
hl.env("HYPRCURSOR_SIZE", "32")
--hl.env("GTK_THEME", "Catppuccin-Mocha-Standard-Lavender-dark")
hl.env("XCURSOR_THEME", "BreezeX-RosePine-Linux")
hl.env("HYPRCURSOR_THEME", "BreezeX-RosePine-Linux")

-- Toolkit backend
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("GDK_SCALE", "1")

-- XDG Specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Qt Variables
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

--


hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        mouse_move_enables_dpms = true,
        },
})
