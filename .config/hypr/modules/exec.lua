--  ______               
-- |  ____|              
-- | |__  __  _____  ___ 
-- |  __| \ \/ / _ \/ __|
-- | |____ >  <  __/ (__ 
-- |______/_/\_\___|\___|

-- https://wiki.hypr.land/Configuring/Basics/Dispatchers/#executing-with-rules

 hl.on("hyprland.start", function () 
   -- hl.exec_cmd("qs -c noctalia-shell")
   hl.exec_cmd("noctalia")
   hl.exec_cmd("systemctl --user start hyprpolkitagent")
   hl.exec_cmd("hyprlauncher -d")
  -- hl.exec_cmd("dunst")
   hl.exec_cmd("clipse -listen")
   hl.exec_cmd("hyprpaper")
   hl.exec_cmd("fcitx5 -D")
   hl.exec_cmd("hypridle")
   hl.exec_cmd("blueman-applet")
   hl.exec_cmd("dbus-update-activation-environment --systemd --all")
   hl.exec_cmd("systemctl --user import-environment QT_QPA_PLATFORMTHEME")
 end)
