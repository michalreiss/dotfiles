local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "tokyonight"
config.enable_scroll_bar = false
config.enable_tab_bar = false
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 16.0
config.window_decorations = "RESIZE"

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
    {
        mods   = "LEADER",
        key    = "-",
        action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
    },
    {
        mods   = "LEADER",
        key    = "=",
        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
    },
    {
        mods   = "LEADER",
        key    = "h",
        action = wezterm.action.ActivatePaneDirection "Left"
    },
    {
        mods   = "LEADER",
        key    = "j",
        action = wezterm.action.ActivatePaneDirection "Down"
    },
    {
        mods   = "LEADER",
        key    = "k",
        action = wezterm.action.ActivatePaneDirection "Up"
    },
    {
        mods   = "LEADER",
        key    = "l",
        action = wezterm.action.ActivatePaneDirection "Right"
    },
    {
        mods = "LEADER",
        key = "Enter",
        action = wezterm.action.ActivateCopyMode
    }
}

return config
