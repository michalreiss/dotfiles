local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "tokyonight"
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 16.0
config.enable_scroll_bar = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"

return config
