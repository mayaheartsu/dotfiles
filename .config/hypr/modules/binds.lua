--  ____  _           _     
-- |  _ \(_)         | |    
-- | |_) |_ _ __   __| |___ 
-- |  _ <| | '_ \ / _` / __|
-- | |_) | | | | | (_| \__ \
-- |____/|_|_| |_|\__,_|___/

-- https://wiki.hypr.land/Configuring/Basics/Binds/

local menu = "hyprlauncher"
local terminal = "kitty"
local browser = "firefox"
local fileManager = "nemo"


local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local secondMod = "SUPER + SHIFT"
local thirdMod = "SUPER + CTRL"

-- App binds
hl.bind(mainMod .. "+ d", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. "+ RETURN", hl.dsp.exec_cmd(terminal, {workspace = "1 silent"}))
hl.bind(mainMod .. " + b", hl.dsp.exec_cmd(browser, {workspace = "2 silent"}))
hl.bind(mainMod .. " + e", hl.dsp.exec_cmd(fileManager))
hl.bind(secondMod .. " + e", hl.dsp.exec_cmd(terminal .. " -e ranger"))
hl.bind(secondMod .. " + c", hl.dsp.exec_cmd(terminal .. " --class clipse -e clipse"))


-- Brightness
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Volume
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"), { locked = true, repeating = true })

-- Media Keys
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Window Management
hl.bind(mainMod .. " + q", hl.dsp.window.close({"activewindow",})) --close one window
hl.bind(secondMod .." + q", hl.dsp.window.kill({"activewindow,"})) --close all windows
hl.bind(mainMod .. " + t", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.layout("swapwithmaster master"))

-- Maximize
--hl.bind(mainMod .. " + f", hl.dsp.window.fullscreen({ action = "toggle"}))
hl.bind(mainMod .. " + f", hl.dsp.window.fullscreen({ action = "toggle", mode = 1 }))

-- Fullscreen
hl.bind(secondMod .. " + f", hl.dsp.window.fullscreen({ action = "toggle", mode = 0 }))

-- Fullscreen & Maximize 
hl.bind(thirdMod .. " + f", hl.dsp.window.fullscreen({ action = "toggle", set = 2 }))


-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Change active window focus
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "d" }))

-- Resize active window
hl.bind(thirdMod .. " + h", hl.dsp.window.resize({ x = -40, y = 0, relative = true}), { repeating = true })
hl.bind(thirdMod .. " + l", hl.dsp.window.resize({ x = 40, y = 0, relative = true}), { repeating = true })
hl.bind(thirdMod .. " + j", hl.dsp.window.resize({ x = 0, y = -40, relative = true}), { repeating = true })
hl.bind(thirdMod .. " + k", hl.dsp.window.resize({ x = 0, y = 40, relative = true}), { repeating = true })

-- Move active window
hl.bind(secondMod .. " + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(secondMod .. " + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(secondMod .. " + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(secondMod .. " + j", hl.dsp.window.move({ direction = "down" }))

-- Send active window to workspace
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end
