local my_float_term_opt = {
	direction = "float",
	display_name = "Terminal",
	cmd = nil,
	close_on_exit = true,
	clear_env = false,
	float_opts = {
		border = "curved",
		winblend = 3,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
		width = function()
			return math.floor(vim.o.columns * 0.9)
		end,
		height = function()
			return math.floor(vim.o.lines * 0.9)
		end,
	},
}
return {
	{
		"akinsho/toggleterm.nvim",
		config = function()
			local term = require("toggleterm")
			vim.g.my_float_term_opt = my_float_term_opt
			term.setup()
		end,
	},
}
