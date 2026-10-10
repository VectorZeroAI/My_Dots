-------------------
--- ## KEYBINDINGS ##
-------------------
local fileManager = "thunar"

-- The window management submap.
hl.define_submap("window_manage", function ()
    hl.bind("k", hl.dsp.focus({workspace="+1"}))
    hl.bind("j", hl.dsp.focus({workspace="-1"}))

    for i = 1, 9 do
        hl.bind("" .. i, hl.dsp.focus({workspace=i}))
        hl.bind("SHIFT + " .. i, hl.dsp.window.move({workspace=i, follow = true}))
    end

    hl.bind("l", hl.dsp.focus({direction="right"}))
    hl.bind("h", hl.dsp.focus({direction="left"}))
    hl.bind("f", hl.dsp.window.fullscreen({"fullscreen", "toggle", 1}))

    hl.bind("q", hl.dsp.exec_cmd("kitty"))
    hl.bind("c", hl.dsp.window.close())
    hl.bind("e", hl.dsp.exec_cmd(fileManager))
    hl.bind("s", hl.dsp.exec_cmd("vivaldi"))

    hl.bind("a", hl.dsp.workspace.toggle_special("magic"))

    hl.bind("r", function ()
        hl.dispatch(hl.dsp.exec_cmd("wofi --show drun"))
        hl.dispatch(hl.dsp.submap("type"))
    end)
    hl.bind("x", function ()
        hl.dispatch(hl.dsp.exec_cmd("wofi --show run"))
        hl.dispatch(hl.dsp.submap("type"))
    end)

    hl.bind("mouse:272", hl.dsp.window.drag(), { mouse = true })
    hl.bind("mouse:273", hl.dsp.window.resize(), { mouse = true })

    hl.bind("return", hl.dsp.submap("type"))
    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Submap to type stuff into the thingy.
hl.define_submap("type", function ()
    hl.bind("return", hl.dsp.submap("reset"), {non_consuming = true})
end)

-- The global shortcuts.
hl.bind("SUPER + Q", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + M", hl.dsp.exit())
hl.bind("SUPER + V", hl.dsp.window.float({action="toggle", window="activewindow"}))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({"fullscreen", "toggle", 1}))
hl.bind("SUPER + D", hl.dsp.exec_cmd("hyprlock"))

hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("wl-kbptr"))

hl.bind("SUPER + b", hl.dsp.submap("window_manage"))

-- Toggle special workspace.
hl.bind("SUPER + A", hl.dsp.workspace.toggle_special("magic"))

-- Move focus between windows (like Vim keys).
hl.bind("SUPER + l", hl.dsp.focus({direction="right"}))
hl.bind("SUPER + h", hl.dsp.focus({direction="left"}))

hl.bind("SUPER + b", hl.dsp.submap("window_manage"))


-- Switch to specific workspaces.
for i = 1, 9 do
    hl.bind("SUPER + " .. i, hl.dsp.focus({workspace=i}))
    hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({workspace=i, follow = true}))
end

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
