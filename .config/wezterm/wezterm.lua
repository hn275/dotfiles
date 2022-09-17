local wez = require("wezterm")
local _keybinds = require("modules.keybinds")
local _tab_color = require("modules.colors.tab_bar")

local M = {
	font = wez.font("JetBrainsMono Nerd Font"),
	color_scheme = "nordfox",
	colors = {
		tab_bar = _tab_color,
	},
	font_size = 10,
	leader = {
		key = "a",
		mods = "CTRL",
		timeout_milliseconds = 1000,
	},
	keys = _keybinds,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	-- Tab bar --
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
}

return M
