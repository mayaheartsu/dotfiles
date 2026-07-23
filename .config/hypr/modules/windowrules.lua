-- __          ___           _                 _____       _           
-- \ \        / (_)         | |               |  __ \     | |          
--  \ \  /\  / / _ _ __   __| | _____      __ | |__) |   _| | ___  ___ 
--   \ \/  \/ / | | '_ \ / _` |/ _ \ \ /\ / / |  _  / | | | |/ _ \/ __|
--    \  /\  /  | | | | | (_| | (_) \ V  V /  | | \ \ |_| | |  __/\__ \
--     \/  \/   |_|_| |_|\__,_|\___/ \_/\_/   |_|  \_\__,_|_|\___||___/

-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({ match = { class = "(org.pulseaudio.pavucontrol)$" }, float = true})
hl.window_rule({ match = { class = "^()$, match:title ^(Picture in picture)$vv" }, float = true})
hl.window_rule({ match = { class = "^()$, match:title ^(Save File)$" }, float = true})
hl.window_rule({ match = { class = "^()$, match:title ^(Open File)$" }, float = true})
hl.window_rule({ match = { class = "^()$, match:title ^(Picture-in-Picture)$" }, float = true})
hl.window_rule({ match = { class = "^(Firefox)$, match:title ^(Picture-in-Picture)$" }, float = true})
hl.window_rule({ match = { class = "^(blueman-manager)$" }, float = true})
hl.window_rule({ match = { class = "^(xdg-desktop-portal-gtk)$" }, float = true})
hl.window_rule({ match = { class = "^(geeqie)$" }, float = true})
hl.window_rule({ match = { class = "^(mpv)$" }, float = true})
hl.window_rule({ match = { class = "^(file-roller)$" }, float = true})
hl.window_rule({ match = { class = "^(hyprpolkitagent)$" }, float = true})
hl.window_rule({ 
    name = "file manager",
    match = { class = "(nemo)$" }, 
    float = true,
    size =  {1600, 900},
})

hl.window_rule({ 
    name = "clipse",
    match = { class = "(clipse)$" },
    float = true,
    size = { 622, 652 },
    stay_focused = true
})

hl.layer_rule({ match = { namespace = "notifications" }, animation ="fadeIn"})
hl.layer_rule({ match = { namespace = "hyprlauncher" }, animation="popin"})

-- No Screenshare
hl.window_rule({ match = { class = "^(Bitwarden)$" }, no_screen_share = true})
hl.window_rule({ match = { class = "^(nemo)$" }, no_screen_share = true})
hl.layer_rule({ match = { namespace = "notifications" }, no_screen_share = true,})

local browserClass = "^([Ff]irefox)|helium$"

-- Video Content Types
hl.window_rule({ match = { initial_class = "vlc" }, content = "video"})
hl.window_rule({ match = { initial_class = "mpv" }, content = "video"})
hl.window_rule({ match = { initial_class = "harbor" }, content = "video"})
hl.window_rule({ match = { initial_class = ".*jellyfin-media-player$" }, content = "video"})
hl.window_rule({ match = { title = "^(Picture-In-Picture)$" }, content = "video"})
hl.window_rule({ match = { title = "^.*(- YouTube).*$" }, content = "video"})
hl.window_rule({ match = { title = "^.*(- YouTube).*$" }, {match = browserClass}})

-- Gaming Window Rules
local steamAppClass = "^steam_app(_\\d+|default)?$"

-- proton games
hl.window_rule({
    match = { xdg_tag = [[^(proton-game)$]] },
    tag = "+video-game"
})

-- gamescope games
hl.window_rule({
    match = { initial_class = [[^(gamescope)$]] },
    tag = "+gamescope"
})

-- content 3
hl.window_rule({
    match = { content = 3 },
    tag = "+video-game"
})

-- steamapp class
hl.window_rule({
    match = { initial_class = steamAppClass },
    tag = "+video-game"
})

-- exe catchall
hl.window_rule({
    match = { initial_class = [[^(.*\.exe)$]] },
    tag = "+video-game"
})

-- minecraft & modpacks
hl.window_rule({
    match = { initial_title = [[^(Minecraft|Tekxit).*$]] },
    tag = "+video-game"
})

-- art of rally
hl.window_rule({
    match = { initial_class = [[^(artofrally).*$]] },
    tag = "+video-game"
})

-- exclude splash screens for steam games
hl.window_rule({
    match = { 
        class = steamAppClass, 
        title = "SplashScreen" 
    },
    tag = "-video-game"
})

-- exclusde crash reports
hl.window_rule({
    match = { 
        tag = "video-game", 
        title = [[([Cc]rash.?[Rr]eport)]] 
    },
    tag = "-video-game"
})

-- default monitors for wayland-native proton games controlled by steam launch parameter - this is important and ensures they are assigned to the correct display and workspace

local gamingWorkspace = "5"
workspace = gamingWorkspace

hl.window_rule({
    name = "video-games",
    match = {
        tag = "video-game"
    },
    content = "game",
    workspace = gamingWorkspace,
    monitor = "DP-1",
    border_size = 0,
    decorate = false,
    force_rgbx = true,
    fullscreen = true,
    immediate = true,
    fullscreen_state = 2, 2,
    idle_inhibit = "always",
    no_anim = true,
    no_blur = true,
    no_dim = true,
    no_max_size = true,
    no_shadow = true,
    opacity = 1.0,
    opaque = true,
    persistent_size = true,
    pseudo = true,
    render_unfocused = true,
    rounding = 0,
    sync_fullscreen = true,
    confine_pointer = true,
})

hl.window_rule({
    name = "gamescope-games",
    match = {
        tag = "gamescope"
    },
    --content = "game",
    workspace = gamingWorkspace,
    monitor = "DP-1",
    border_size = 0,
    --decorate = false,
    --force_rgbx = true,
    fullscreen = true,
    immediate = true,
    fullscreen_state = 2, 2,
    idle_inhibit = "always",
    no_anim = true,
    no_blur = true,
    no_dim = true,
    no_max_size = true,
    no_shadow = true,
    opacity = 1.0,
    opaque = true,
    persistent_size = true,
    pseudo = true,
    render_unfocused = true,
    rounding = 0,
    sync_fullscreen = true,
    confine_pointer = true,
})

-- makes all steam client windows float (useful for update news & friends list)
hl.window_rule({
    match = { class = [[^(steam)$]] },
    float = true
})
-- makes steam client override the float and be tiled
hl.window_rule({
    match = { 
        class = [[^(steam)$]],
        title = [[(Steam)$]]
    },
    tile = true
})

-- makes steam friends list stay at a locked size
hl.window_rule({
    match = { title = [[^(Friends List)$]] },
    size = { 280, 800 }
})

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

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

--  Smart gaps
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, rounding = 0 })

-- XWayland Screensharing
hl.window_rule({
    match = { class = [[^(xwaylandvideobridge)$]] },
    opacity = 0.0,
    no_anim = true,
    no_initial_focus = true,
    max_size = "1 1",
    no_blur = true,
    no_focus = true
})
