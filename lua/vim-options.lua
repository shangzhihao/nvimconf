vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.errorbells = false
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.opt.listchars = {
    tab = "│─",
    trail="·",
    eol = "↵",
}
vim.opt.list = true

vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight NonText guibg=NONE ctermbg=NONE")
vim.cmd("highlight LineNr guibg=NONE ctermbg=NONE")
vim.cmd("highlight Folded guibg=NONE ctermbg=NONE")
vim.api.nvim_set_keymap("n", "0", "^", { noremap = true, silent = true })

