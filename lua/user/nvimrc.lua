local utils = require("user.utils")

vim.api.nvim_create_autocmd("BufEnter", {
	callback = utils.chdir,
})
