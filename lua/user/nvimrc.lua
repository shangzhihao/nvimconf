local utils = require("user.utils")

vim.api.nvim_create_autocmd("DirChanged", {
	pattern = "*",
	callback = function()
		local cwd = vim.fn.getcwd()
		local short_cwd = vim.fn.fnamemodify(cwd, ":~")
		vim.notify("cwd to " .. short_cwd, vim.log.levels.INFO)
	end,
})
