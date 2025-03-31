return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
        local pairs = require("nvim-autopairs")
        pairs.setup({
        })
    end,
}
