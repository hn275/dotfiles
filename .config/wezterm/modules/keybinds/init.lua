local action = require("wezterm").action

return {
	-- Open a new tab
	{
		key = "t",
		mods = "ALT",
		action = action.SpawnTab("CurrentPaneDomain"),
	},
	-- Tab navigator
	{
		key = "T",
		mods = "ALT|SHIFT",
		action = action.ShowTabNavigator,
	},
	-- Next tab
	{
		key = "]",
		mods = "ALT",
		action = action.ActivateTabRelativeNoWrap(1),
	},
	-- Prev tab
	{
		key = "[",
		mods = "ALT",
		action = action.ActivateTabRelativeNoWrap(-1),
	},
	-- Prev tab
	{
		key = "w",
		mods = "ALT",
		action = action.CloseCurrentTab({ confirm = true }),
	},
	-- New workspace
	{
		key = "N",
		mods = "LEADER",
		action = action.SwitchToWorkspace({
			name = "new workspace",
		}),
	},
	-- Next workspace
	{
		key = "]",
		mods = "LEADER",
		action = action.SwitchWorkspaceRelative(1),
	},
	-- Prev workspace
	{
		key = "[",
		mods = "LEADER",
		action = action.SwitchWorkspaceRelative(-1),
	},
}
