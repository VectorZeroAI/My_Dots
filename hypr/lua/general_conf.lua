----------------
--- MONITORS ---
----------------
-- See: https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "auto",
    scale = 1
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "preferred",
    position = "auto",
    mirror = "eDP-1",
    scale = 1
})


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

    scrolling = {
        fullscreen_on_one_column = true, -- A single window takes the whole screen
        column_width = 0.5,              -- Default column width (50% of screen)
        focus_fit_method = 1,            -- 0 = center, 1 = fit
        follow_focus = true,
        direction = "right",
        wrap_swapcol = true,
        wrap_focus = true
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
