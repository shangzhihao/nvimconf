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
vim.opt.spelllang = "en_us"
vim.opt.spell = true
vim.opt.listchars = {
    tab = "│─",
    trail = "·",
    eol = "↵",
}
vim.opt.list = true

-- 0 move to the 1st letter of the line
vim.api.nvim_set_keymap("n", "0", "^", { noremap = true, silent = true })
-- U for redo
vim.api.nvim_set_keymap("n", "U", "<C-r>", { noremap = true, silent = true })
-- J to scroll down
vim.api.nvim_set_keymap("n", "J", "<C-d>", { noremap = true, silent = true })
-- K to scroll up
vim.api.nvim_set_keymap("n", "K", "<C-u>", { noremap = true, silent = true })
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], {})

