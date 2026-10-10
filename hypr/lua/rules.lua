-- See: https://wiki.hypr.land/Configuring/Basics/Window-Rules/
------------
-- RULES ---
------------


hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "smart_gaps",
    match = { workspace = "w[1]" },
    border_size = 0
})

hl.workspace_rule({
    workspace = "special:magic",
    on_created_empty = "kitty"
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
