-- workspace 1 = left monitor only, everything else = right monitor
hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-4", default = true, persistent = true })
for i = 2, 9 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "DVI-D-1" })
end

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})
