return {
	"folke/which-key.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
	event = "VeryLazy",
	config = function()
		local which_key = require("which-key")
		which_key.setup({
			delay = 800,
			win = {
				padding = { 1, 1, 1, 1 },
				border = "single",
				height = 8,
				wo = { winblend = 20 },
			},
		})
		require("nvim-web-devicons").setup()
		require("config.key-binding").setup()
	end,
	opts = {},
	keys = {},
}
