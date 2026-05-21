-- __          __        _                                  
-- \ \        / /       | |                                 
--  \ \  /\  / /__  _ __| | _____ _ __   __ _  ___ ___  ___ 
--   \ \/  \/ / _ \| '__| |/ / __| '_ \ / _` |/ __/ _ \/ __|
--    \  /\  / (_) | |  |   <\__ \ |_) | (_| | (_|  __/\__ \
--     \/  \/ \___/|_|  |_|\_\___/ .__/ \__,_|\___\___||___/
--                               | |                        
--                               |_|                        

-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.workspace_rule ({
    workspace = "1",
    "name:terminal",
    monitor = "DP-2",
})

hl.workspace_rule ({
    workspace = "2",
    "name:web & chat",
    monitor = "DP-2",
    layout_opts = 
        {orientation = "right"}, 
        {mfact = 0.60}
})

hl.workspace_rule ({
    workspace = "3",
    "name:text editing",
    monitor = "DP-2",
})

hl.workspace_rule ({
    workspace = "4",
    "name:steam",
    monitor = "DP-1",
})

hl.workspace_rule ({
    workspace = "5",
    "name:game",
    monitor = "DP-1",
})

hl.workspace_rule ({
    workspace = "6",
    "name:music",
    monitor = "DP-1",
})


-- App workspace assignments

hl.window_rule({
    match = { class = [[^(kitty)$]] },
    workspace = "1 silent",
})


hl.window_rule({
    match = { class = [[^(firefox)$]] },
    workspace = "2 silent",
})

hl.window_rule({
    match = { class = [[^(.*(disc|goofc|WebC|Armc|legc|Venc)ord.*)$]] },
    workspace = "2 silent",
})

hl.window_rule({
    match = { class = [[^(vs|codium)$]] },
    workspace = "3 silent",
})

hl.window_rule({
    match = { class = [[^(Bitwarden)$]] },
    workspace = "3 silent",
})

hl.window_rule({
    match = { class = [[^(proton.vpn.app.gtk)$]] },
    workspace = "3 silent",
})

hl.window_rule({
    match = { class = [[^(steam)$]] },
    workspace = "4 silent",
})

hl.window_rule({
    match = { class = [[^(Spotify)$]] },
    workspace = "6 silent",
})

hl.window_rule({
    match = { class = [[^(com.obsproject.Studio)$]] },
    workspace = "6 silent",
})

hl.window_rule({
    match = { class = "gimp" },
    workspace = "6 silent",
})
