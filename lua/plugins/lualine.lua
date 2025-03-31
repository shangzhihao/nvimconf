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
				lualine_a = { "mode", macro },
				lualine_b = { "diagnostics" },
				lualine_c = {
					{ "buffers", hide_filename_extension = true },
				},
			},
		})
	end,
}
