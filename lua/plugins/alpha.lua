return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local theme = require("config.startui-mrp")
		-- local theme = require("config.startui-mru")
		theme.file_icons.provider = "devicons"
		require("alpha").setup(theme.config)
	end,
}
