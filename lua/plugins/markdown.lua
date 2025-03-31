return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {},
	config = function()
		local render_mark = require("render-markdown")
		require("render-markdown").setup({
			file_types = { "markdown", "vimwiki" },
			vim.treesitter.language.register("markdown", "vimwiki"),
			render_mark.enable(),
		})
	end,
}
