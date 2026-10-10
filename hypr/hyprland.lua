-- For more information: https://wiki.hypr.land/Configuring/


-----------------
--- AUTOSTART ---
-----------------
-- See: https://wiki.hypr.land/Configuring/Basics/Autostart/
--
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("hyprpm reload dynamic-cursors")
    hl.exec_cmd("vivaldi", { workspace = "2 silent"})
end)

require("lua/general_conf")

require("lua/wallpaper")

require("lua/keybindings")

require("lua/rules")

require("lua/plugins")
