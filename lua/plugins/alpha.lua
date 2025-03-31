return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local theme = require("user.start-mrp")
		theme.file_icons.provider = "devicons"
		require("alpha").setup(theme.config)
	end,
}
