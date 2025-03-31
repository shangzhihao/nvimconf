local macro = function()
	local reg = vim.fn.reg_recording()
	if reg == "" then
		return ""
	else
		return "󰑋" .. reg
	end
end
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local line = require("lualine")
		line.setup({
			sections = {
				lualine_c = {
					"filename",
					macro,
				},
			},
		})
	end,
}
