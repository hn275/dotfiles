require("toggleterm").setup{
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	start_in_insert = true,
	shade_terminals = true,
	shadeing_factor = 1,
	hide_numbers = true,
	open_mapping = [[<c-\>]],
	close_on_exit = true,
	direction = 'float', -- "horizontal" | "veritcal" | "float"
	float_opts = {
		border = 'single'
	}
}
