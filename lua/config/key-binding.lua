local dap = require("dap")
local which_key = require("which-key")
local telescope = require("telescope.builtin")
local oil = require("oil")
local key_funs = require("user.key-bind-fun")
local ICONS = require("config.icons")
local ufo = require("ufo")
local neogen = require("neogen")
local M = {}
-- TODO: add a function to generate the keybindings
vim.keymap.set("n", "<leader>ln", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "rename" })
function M.setup()
	which_key.add({
		-- hidden keys
		{ "<esc>", "<C-\\><C-n>", mode = "t", hidden = true },
		{ "r", "<C-r>", hidden = true },
		{ "q:", "<Nop>", mode = { "n", "v", "t", "x" }, hidden = true },
		{ "<leader>k", key_funs.scroll_up, hidden = true },
		{ "<leader>j", key_funs.scroll_down, hidden = true },
		{ "<leader><leader>", "<Plug>(easymotion-bd-jk)", hidden = true },
		{ "w", "<Plug>(easymotion-bd-fl)", hidden = true },
		-- Buffers
		{ "<leader>b", group = "Buffer", icon = ICONS.buf },
		{ "<leader>bl", "<cmd>Telescope buffers<cr>", desc = "list buffers", icon = ICONS.list },
		{ "<leader>bc", "<cmd>bd<cr>", desc = "close buffer", icon = ICONS.fclose },
		{ "<leader>bd", "<cmd>bd!<cr>", desc = "discard and close", icon = ICONS.discard },
		{ "<leader>bw", "<cmd>w<cr>", desc = "save buffer", icon = ICONS.save },
		{ "<leader>bn", "<cmd>bnext<cr>", desc = "next buffer", icon = ICONS.right },
		{ "<leader>bp", "<cmd>bprev<cr>", desc = "previous buffer", icon = ICONS.left },
		-- Check spells
		{ "<leader>c", group = "Check spells", icon = ICONS.check },
		{ "<leader>cn", "]s", desc = "next misspelled", icon = ICONS.right },
		{ "<leader>cp", "[s", desc = "previous misspelled", icon = ICONS.left },
		{ "<leader>ca", "zg", desc = "add word to dict", icon = ICONS.good },
		{ "<leader>cs", telescope.spell_suggest, desc = "show suggestion", icon = ICONS.list },
		{ "<leader>cr", "<cmd>spellr<cr>", desc = "correct all" },
		-- Debug
		{ "<leader>d", group = "Debug", icon = ICONS.debug },
		{ "<leader>db", dap.toggle_breakpoint, desc = "toggle breakpoint", icon = ICONS.breakpoint },
		{ "<leader>dc", dap.continue, desc = "continue", icon = ICONS.run },
		{ "<leader>dd", key_funs.debug_file, desc = "debug (no ui)", icon = ICONS.debug },
		{ "<leader>dr", key_funs.run_file, desc = "run file", icon = ICONS.run },
		-- Errors
		{ "<leader>e", group = "Errors", icon = ICONS.diag },
		{ "<leader>ed", key_funs.buf_diag, desc = "errors in buffer", icon = ICONS.list },
		{ "<leader>ew", telescope.diagnostics, desc = "error list in workspace", icon = ICONS.list },
		{ "<leader>ep", vim.diagnostic.goto_prev, desc = "previous error", icon = ICONS.left },
		{ "<leader>en", vim.diagnostic.goto_next, desc = "next error", icon = ICONS.right },
		-- Files
		{ "<leader>f", group = "File" },
		{ "<leader>fw", "<cmd>w<cr>", desc = "save file", icon = ICONS.save },
		{ "<leader>ff", "<cmd>Telescope smart_open<cr>", desc = "find files", icon = ICONS.list },
		{ "<leader>fq", "<cmd>q<cr>", desc = "save and quit" },
		{ "<leader>fd", "<cmd>q!<cr>", desc = "discard and quit" },
		{ "<leader>fm", oil.toggle_float, desc = "file manager" },
		{ "<leader>fh", oil.toggle_hidden, desc = "toggle hidden" },
		{ "<leader>fp", key_funs.setting_dir, desc = "file manager" },
		-- LSP
		{ "<leader>l", group = "LSP", icon = ICONS.lsp },
		{ "<leader>la", vim.lsp.buf.code_action, desc = "code action" },
		{ "<leader>ld", vim.lsp.buf.definition, desc = "go to definition", icon = ICONS.motion },
		{ "<leader>lh", vim.lsp.buf.hover, desc = "hover", icon = ICONS.hover },
		{ "<leader>lr", vim.lsp.buf.references, desc = "show references", icon = ICONS.ref },
		{ "<leader>lf", key_funs.format, desc = "format code" },
		-- { "<leader>ln", vim.lsp.buf.rename, desc = "format code" },
		{ "<leader>lt", telescope.treesitter, desc = "list tags", icon = ICONS.list },
		-- Motion
		{ "<leader>m", group = "Motion", icon = ICONS.motion },
		{ "<leader>mm", "<Plug>(easymotion-s2)", desc = "move to word", icon = ICONS.motion },
		{ "<leader>mt", key_funs.scroll_top, desc = "cursor top", icon = ICONS.top },
		{ "<leader>mc", key_funs.scroll_center, desc = "cursor center", icon = ICONS.center },
		{ "<leader>mb", key_funs.scroll_bottom, desc = "cursor bottom", icon = ICONS.bottom },
		{ "<leader>mh", "^", desc = "first letter", icon = ICONS.left },
		{ "<leader>ml", "$", desc = "last letter", icon = ICONS.right },
		-- Search
		{ "<leader>s", group = "Search" },
		{ "<leader>se", telescope.registers, desc = "registers" },
		{ "<leader>sb", telescope.buffers, desc = "buffers" },
		{ "<leader>sf", "<cmd>Telescope smart_open<cr>", desc = "files", icon = ICONS.list },
		{ "<leader>sl", telescope.current_buffer_fuzzy_find, desc = "lines" },
		{ "<leader>sm", "<cmd>Telescope notify<cr>", desc = "messages" },
		{ "<leader>sn", telescope.treesitter, desc = "names" },
		{ "<leader>so", key_funs.todolist, desc = "todos" },
		{ "<leader>sp", "<cmd>Telescope projects<cr>", desc = "projects" },
		{ "<leader>sr", "<cmd>GrugFar<cr>", desc = "search-replace" },
		{ "<leader>ss", telescope.live_grep, desc = "string" },
		{ "<leader>st", telescope.builtin, desc = "telescope pickers" },
		-- Windows
		{ "<leader>w", group = "Windows" },
		{ "<leader>wc", "<c-w>c", desc = "close window", icon = ICONS.cross },
		{ "<leader>ws", "<c-w>s", desc = "split window", icon = ICONS.horizontal },
		{ "<leader>wv", "<c-w>v", desc = "split window vertically", icon = ICONS.vertical },
		{ "<leader>wj", "<c-w>j", desc = "to below window", icon = ICONS.down },
		{ "<leader>wk", "<c-w>k", desc = "to upper window", icon = ICONS.up },
		{ "<leader>wh", "<c-w>h", desc = "to left window", icon = ICONS.left },
		{ "<leader>wl", "<c-w>l", desc = "to right window", icon = ICONS.right },
		{ "<leader>wt", key_funs.toggle_terminal, desc = "toggle terminal", icon = ICONS.terminal },
		-- Misc
		{ "<leader>x", group = "Misc.", icon = ICONS.debug },
		{ "<leader>xh", "<cmd>set hlsearch!<CR>", desc = "toggle highlight", icon = ICONS.misc },
		{ "<leader>xw", key_funs.toggle_wrap, desc = "toggle wrap", icon = ICONS.misc },
		{ "<leader>xd", neogen.generate, desc = "generate doc", icon = ICONS.misc },
		-- Fold
		{ "<leader>z", group = "Fold", icon = ICONS.fold },
		{ "<leader>zr", ufo.openAllFolds, desc = "open all folds", icon = ICONS.fold },
		{ "<leader>zm", ufo.closeAllFolds, desc = "close all folds", icon = ICONS.fold },
		{ "<leader>zh", ufo.peekFoldedLinesUnderCursor, desc = "peek folded lines", icon = ICONS.fold },
	})
end
return M
