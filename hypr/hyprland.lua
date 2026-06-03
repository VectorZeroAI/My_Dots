-- ~/.config/hypr/hyprland.lua
-- Hyprland Lua configuration migrated from legacy .conf
-- For more information: https://wiki.hypr.land/Configuring/

----------------
-- -- ### MONITORS ###
----------------
-- lua syntax: hl.monitor({ output = "NAME", mode = "MODE", position = "POS", scale = SCALE })
-- See: https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "auto",
    scale = 1
})

-- Mirroring is not yet documented in Lua. This is an assumption based on the old config.
hl.monitor({
    output = "HDMI-A-1",
    mode = "preferred",
    position = "auto",
    mirror = "eDP-1",
    scale = 1
})

-------------------
-- ### MY PROGRAMS ###
-------------------
-- You can store your favorite programs in variables for later use.
local terminal = "wezterm"
local fileManager = "thunar"
local menu = "wofi"

---------------
-- ## AUTOSTART ###
---------------
-- Using the hyprland.start event to launch applications at startup.
-- See: https://wiki.hypr.land/Configuring/Basics/Autostart/
--
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaybg -i ~/Downloads/Wallpaper2.png")
    hl.exec_cmd("vivaldi", { workspace= "2 silent"})
end)

-------------------------
-- ## ENVIRONMENT VARIABLES ###
-------------------------
-- Set environment variables for X11 and Hyprland cursors.
-- See: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-------------------
-- ## PERMISSIONS ###
-------------------
-- -- Permissions for plugins.
-- hl.permission({
--     binary = "/usr/(bin|local/bin)/hyprpm",
--     type = "plugin",
--     mode = "allow"
-- })

-------------------
-- ## LOOK AND FEEL ###
-------------------
-- Global configuration settings.
-- See: https://wiki.hypr.land/Configuring/Variables/#general
hl.config({
    general = {
        gaps_in = 1,
        gaps_out = -1,
        border_size = 2,
        col = {
            active_border = "rgba(2ABCFFff)",
            inactive_border = "rgba(595959aa)"
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "scrolling"
    },

    -- Decoration settings (opacity, shadows, blur)
    -- See: https://wiki.hypr.land/Configuring/Variables/#decoration
    decoration = {
        active_opacity = 1.0,
        inactive_opacity = 0.7,
        shadow = {
            enabled = false,
            range = 9,
            render_power = 11,
            color = "rgba(1a1a1aee)"
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.6
        }
    },

    -- Layout-specific settings for Dwindle and Master.
    -- See: https://wiki.hypr.land/Configuring/Dwindle-Layout/
    dwindle = {
        preserve_split = true
    },
    master = {
        new_status = "slave",
        mfact = 0.60
    },

    -- Miscellaneous settings.
    -- See: https://wiki.hypr.land/Configuring/Variables/#misc
    misc = {
        disable_hyprland_logo = false
    }
})

-- Animation curves and styles.
-- See: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


-------------
-- ## INPUT ###
-------------
-- Keyboard and input device configuration.
-- See: https://wiki.hypr.land/Configuring/Variables/#input
hl.config({
    input = {
        kb_layout = "de",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 0,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false
        }
    }
})

-- Touchpad gestures.
-- See: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Per-device input settings.
-- See: https://wiki.hypr.land/Configuring/Basics/Devices/
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5
})

-------------------
-- ## KEYBINDINGS ###
-------------------
-- Main mod key.
-- See: https://wiki.hypr.land/Configuring/Basics/Binds/
local mainMod = "SUPER"

-- Application shortcuts.
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({action="toggle", window=1}))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind("SUPER + X", hl.dsp.exec_cmd("wofi --show run"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("vivaldi"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({"fullscreen", "toggle", 1}))

-- Move focus between windows (like Vim keys).
hl.bind("SUPER + l", hl.dsp.focus({direction="right"}))
hl.bind("SUPER + h", hl.dsp.focus({direction="left"}))

-- Switch to specific workspaces.
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({workspace=i}))
end

-- Mouse bindings for moving and resizing windows.
-- hl.bind(mainMod, "mouse:272", hl.dsp.window.drag()) NOTE : this will work in the next release, my current version doesnt yet have this.
-- hl.bind(mainMod, "mouse:273", hl.dsp.window.resize())

-- Multimedia keys (volume, brightness, media controls).
-- Using `{ repeating = true }` for press-and-hold on volume up.
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- See: https://wiki.hypr.land/Configuring/Basics/Window-Rules/
--
-- ----------------
-- WINDOW RULES ---
-- ----------------
hl.window_rule({
    name = "smart_gaps",
    match = { workspace = "w[1]" },   -- Matches workspace 1
    maximize = true,
    border_size = 0
})

hl.window_rule({
    name="kitty start width",
    match = { class = "kitty" },
    scrolling_width = 0.5
})

hl.window_rule({
    name = "vivaldi start width",
    match = { class = "vivaldi-stable" },
    scrolling_width = 1
})

hl.window_rule({
    name = "thunar float",
    match = { class = "thunar" },
    float = true
})
