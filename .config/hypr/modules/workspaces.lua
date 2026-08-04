-- __          __        _                                  
-- \ \        / /       | |                                 
--  \ \  /\  / /__  _ __| | _____ _ __   __ _  ___ ___  ___ 
--   \ \/  \/ / _ \| '__| |/ / __| '_ \ / _` |/ __/ _ \/ __|
--    \  /\  / (_) | |  |   <\__ \ |_) | (_| | (_|  __/\__ \
--     \/  \/ \___/|_|  |_|\_\___/ .__/ \__,_|\___\___||___/
--                               | |                        
--                               |_|                        

-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.workspace_rule({
    workspace = "1",
    monitor = "DP-2",
})

hl.workspace_rule({
    workspace = "2",
    monitor = "DP-2",
    layout_opts = {
        orientation = "right",
        mfact = 0.60,
    },
})

hl.workspace_rule({
    workspace = "3",
    monitor = "DP-2",
})

hl.workspace_rule({
    workspace = "4",
    monitor = "DP-1",
})

hl.workspace_rule({
    workspace = "5",
    monitor = "DP-1",
})

hl.workspace_rule({
    workspace = "6",
    monitor = "DP-1",
})


-- App workspace assignments

hl.window_rule({
    match = { class = [[^(kitty|foot)$]] },
    workspace = "1 silent",
})

hl.window_rule({
    match = { class = [[(?i)^(firefox|helium|zen)$]] },
    workspace = "2 silent",
})

hl.window_rule({
    match = { class = [[^(vesktop|.*(disc|goofc|WebC|Armc|legc|Venc)ord.*)$]] },
    workspace = "2 silent",
})

hl.window_rule({
    match = { class = [[(?i)^(code|vscodium|codium)$]] },
    workspace = "3 silent",
})

hl.window_rule({
    match = { class = [[(?i)^(Bitwarden)$]] },
    workspace = "3 silent",
})

hl.window_rule({
    match = { class = [[(?i)^(proton.*vpn.*)$]] },
    workspace = "3 silent",
})

hl.window_rule({
    match = { class = [[^(steam)$]] },
    workspace = "4 silent",
})

hl.window_rule({
    match = { class = [[^(org.prismlauncher.PrismLauncher)$]] },
    workspace = "5 silent",
})

hl.window_rule({
    match = { class = [[(?i)^(Spotify)$]] },
    workspace = "6 silent",
})

hl.window_rule({
    match = { class = [[^(sidra)$]] },
    workspace = "6 silent",
})

hl.window_rule({
    match = { class = [[^(com.obsproject.Studio)$]] },
    workspace = "6 silent",
})

hl.window_rule({
    match = { class = [[(?i)gimp]] },
    workspace = "6 silent",
})
