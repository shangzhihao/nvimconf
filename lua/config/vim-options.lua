vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = ""
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.errorbells = false
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.spelllang = "en_us"
vim.opt.spell = true
-- catppuccin flavor (light to dark) can be: latte, frappe, macchiato, mocha
-- tokyonight flavor (light to dark) can be: day, storm, moon, night
vim.cmd.colorscheme("catppuccin-frappe")
-- vim.cmd.colorscheme("tokyonight-storm")
vim.opt.listchars = {
	tab = "│─",
	trail = "·",
	eol = "↵",
}
vim.opt.list = true
-- Remove the 'q:' keymap that opens the command window
vim.api.nvim_set_keymap("n", "q:", ":", { noremap = true })
-- 0 move to the 1st letter of the line
vim.api.nvim_set_keymap("n", "0", "^", { noremap = true, silent = true })
-- r for redo
vim.api.nvim_set_keymap("n", "r", "<C-r>", { noremap = true, silent = true })
-- J to scroll down
vim.api.nvim_set_keymap("n", "J", "5j", { noremap = true, silent = true })
-- K to scroll up
vim.api.nvim_set_keymap("n", "K", "5k", { noremap = true, silent = true })
-- esc to return normal mode in terminal
vim.api.nvim_set_keymap("t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
-- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], {})
