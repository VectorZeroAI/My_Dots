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
local terminal = "kitty"
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
    hl.exec_cmd("swaybg -i ~/wallpapers-main/Wallpaper3.png")
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
            -- active_border = { colors= { "rgba(31E53Fff)", "rgba(2ABCFFff)" }, angle=20 },
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
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.7,
            noise = 0
        },
        glow = {
            enabled = false,
            range = 9,
            render_power = 4,
            color = "rgba(2EBBFFaf)"
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


-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

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

-- Application shortcuts.
hl.bind("SUPER + Q", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + M", hl.dsp.exit())
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + V", hl.dsp.window.float({action="toggle", window="activewindow"}))
hl.bind("SUPER + R", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind("SUPER + X", hl.dsp.exec_cmd("wofi --show run"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("vivaldi"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({"fullscreen", "toggle", 1}))
hl.bind("SUPER + D", hl.dsp.exec_cmd("hyprlock"))

-- Move focus between windows (like Vim keys).
hl.bind("SUPER + l", hl.dsp.focus({direction="right"}))
hl.bind("SUPER + h", hl.dsp.focus({direction="left"}))

-- TODO : Try to use submaps to make more vim like navigation
-- Like making navigation in workspace VS cross workspace by a submap as well as application activation through a submap as well
-- Modal navigation !

-- Switch to specific workspaces.
for i = 1, 9 do
    hl.bind("SUPER + " .. i, hl.dsp.focus({workspace=i}))
    hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({workspace=i, follow = true}))
end

-- Mouse bindings for moving and resizing windows.
hl.bind("SUPER + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia keys (volume, brightness, media controls).
-- Using `{ repeating = true }` for press-and-hold on volume up.
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
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
    match = { workspace = "w[1]" },
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
    scrolling_width = 1,
    fullscreen = true
})


hl.window_rule({
    name = "Make libreoffice fullscreen",
    match = { class = "soffice" },
    fullscreen = true
})

local matches_list = {
    {title = "Open"},
    {title = "Open Files"},
    {class = "org.pulseaudio.pavucontrol"},
    {modal = true}
}

for _, value in ipairs(matches_list) do
    hl.window_rule({
        match = value,
        float = true,
        size = "(monitor_w*0.5) (monitor_h*0.5)",
        fullscreen_state = 0,
        center = true
    })
end

---------------
--- Plugins ---
---------------

if hl.plugin.dynamic_cursors then
    hl.config { 
        plugin = { 
            dynamic_cursors = {
                enabled = true,

                -- sets the cursor behaviour, supports these values:
                -- tilt    - tilt the cursor based on x-velocity
                -- rotate  - rotate the cursor based on movement direction
                -- stretch - stretch the cursor shape based on direction and velocity
                -- none    - do not change the cursor's behaviour
                mode = "stretch",

                -- minimum angle difference in degrees after which the shape is changed
                -- smaller values are smoother, but more expensive for hw cursors
                threshold = 1,

                rotate = {

                    -- length in px of the simulated stick used to rotate the cursor
                    -- most realistic if this is your actual cursor size
                    length = 20,

                    -- clockwise offset applied to the angle in degrees
                    -- this will apply to ALL shapes
                    offset = 0.0,
                },

                tilt = {

                    -- controls how powerful the tilt is, the lower, the more power
                    -- this value controls at which speed (px/s) the full tilt is reached
                    limit = 5000,

                    -- relationship between speed and tilt, supports these values:
                    -- linear             - a linear function is used
                    -- quadratic          - a quadratic function is used (most realistic to actual air drag)
                    -- negative_quadratic - negative version of the quadratic one, feels more aggressive
                    -- see `activation` in `src/mode/utils.cpp` for how exactly the calculation is done
                    activation = "negative_quadratic",

                    -- time window (ms) over which the speed is calculated
                    -- higher values will make slow motions smoother but more delayed
                    window = 100,

                    -- full tilt for each side (°)
                    full = 60,
                },

                stretch = {

                    -- controls how much the cursor is stretched
                    -- this value controls at which speed (px/s) the full stretch is reached
                    -- the full stretch being twice the original length
                    limit = 3000,

                    -- relationship between speed and stretch amount, supports these values:
                    -- linear             - a linear function is used
                    -- quadratic          - a quadratic function is used
                    -- negative_quadratic - negative version of the quadratic one, feels more aggressive
                    -- see `activation` in `src/mode/utils.cpp` for how exactly the calculation is done
                    activation = "quadratic",

                    -- time window (ms) over which the speed is calculated
                    -- higher values will make slow motions smoother but more delayed
                    window = 100,
                },

                -- configure shake to find
                shake = {

                    enabled = true,

                    -- controls how soon a shake is detected
                    -- lower values mean sooner
                    threshold = 5.0,

                    -- magnification level immediately after shake start
                    base = 3.0,
                    -- magnification increase per second when continuing to shake
                    speed = 2.0,
                    -- how much the speed is influenced by the current shake intensity
                    influence = 0.6,

                    -- maximal magnification the cursor can reach
                    -- values below 1 disable the limit (e.g. 0)
                    limit = 0.0,

                    -- time in milliseconds the cursor will stay magnified after a shake has ended
                    timeout = 300,

                    -- show cursor behaviour `tilt`, `rotate`, etc. while shaking
                    effects = true,

                    -- enable ipc events for shake
                    -- see the `ipc` section below
                    ipc = false,
                },

                -- use hyprcursor to get a higher resolution texture when the cursor is magnified
                -- see the `hyprcursor` section below
                hyprcursor = {

                    -- use nearest-neighbour (pixelated) scaling when magnifying beyond texture size
                    -- this will also have effect without hyprcursor support being enabled
                    -- 0 - never use pixelated scaling
                    -- 1 - use pixelated when no highres image
                    -- 2 - always use pixelated scaling
                    nearest = 1,

                    -- enable dedicated hyprcursor support
                    enabled = true,

                    -- resolution in pixels to load the magnified shapes at
                    -- be warned that loading a very high-resolution image will take a long time and might impact memory consumption
                    -- -1 means we use [normal cursor size] * [shake:base option]
                    resolution = -1,

                    -- shape to use when clientside cursors are being magnified
                    -- see the shape-name property of shape rules for possible names
                    -- specifying clientside will use the actual shape, but will be pixelated
                    fallback = "clientside",
                },
            }
        }
    }
end
