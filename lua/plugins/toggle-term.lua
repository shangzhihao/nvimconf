return {
	-- amongst your other plugins
	{
		"akinsho/toggleterm.nvim",
		config = function()
            local term = require("toggleterm")
            term.setup()
        end,
	},
}
