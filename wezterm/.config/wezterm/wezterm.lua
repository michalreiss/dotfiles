local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Rosé Pine (Gogh)"
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 16.0
config.enable_scroll_bar = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 0,
}

return config
