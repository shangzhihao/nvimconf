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
	precedes = "«",
	extends = "»",
}
vim.opt.list = true
vim.opt.signcolumn = "yes"
