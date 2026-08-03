--  ______            
-- |  ____|           
-- | |__   _ ____   __
-- |  __| | '_ \ \ / /
-- | |____| | | \ V / 
-- |______|_| |_|\_/  

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- XDG variables
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- GTK variables
hl.env("GTK_THEME", "adw-gtk3")
hl.env("XCURSOR_SIZE", "32")
hl.env("XCURSOR_THEME", "Adwaita")

-- Toolkit backend variables
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("GDK_SCALE", "1")
hl.env("CLUTTER_BACKEND", "wayland")

-- Qt Variables
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- SDL Variables
hl.env("SDL_VIDEODRIVER", "wayland")

-- Mozilla variables
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("EGL_PLATFORM", "wayland")

-- Hyprcursor theme
hl.env("HYPRCURSOR_SIZE", "32")
hl.env("HYPRCURSOR_THEME", "Adwaita")

hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        mouse_move_enables_dpms = true,
        },
})
