require("nvim-tree").setup({
		auto_reload_on_write = true,
		sort_by = "name",
		view = {
			mappings = {
				list = {
					{ key = "<C-t>", action = "" },
					{ key = "o", action = "edit" },
					{ key = "i", action = "split" },
					{ key = "s", action = "vsplit" },
					{ key = "<S-t>", action = "newtab" },
					{ key = "?", action = "toggle_help" },
					{ key = "n", action = "create" },
				}
			}
		},
	})

