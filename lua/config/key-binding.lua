local dap = require("dap")
local which_key = require("which-key")
local telescope = require("telescope.builtin")
local oil = require("oil")
local key_funs = require("user.key-bind-fun")
local ICONS = require("config.icons")

local show_keymap = function()
	which_key.show({ global = false })
end

local M = {}

function M.setup()
	which_key.add({
		{ "<leader>?", show_keymap, icon = ICONS.question, desc = "Local Keymaps (which-key)" },
		{ "<leader>b", group = "Buffers", icon = ICONS.buf }, -- Buffers
		{ "<leader>bl", "<cmd>Telescope buffers<cr>", desc = "list buffers", icon = ICONS.list },
		{ "<leader>bc", "<cmd>bd<cr>", desc = "close buffer", icon = ICONS.fclose },
		{ "<leader>bd", "<cmd>bd!<cr>", desc = "discard and close", icon = ICONS.discard },
		{ "<leader>bs", "<cmd>w<cr>", desc = "save buffer", icon = ICONS.save },
		{ "<leader>c", group = "Check spells", icon = ICONS.check }, -- Check spells
		{ "<leader>cn", "]s", desc = "next misspelled", icon = ICONS.left },
		{ "<leader>cp", "[s", desc = "previous misspelled", icon = ICONS.right },
		{ "<leader>ca", "zg", desc = "add word to dict", icon = ICONS.good },
		{ "<leader>cs", telescope.spell_suggest, desc = "show suggestion", icon = ICONS.list },
		{ "<leader>cr", "<cmd>spellr<cr>", desc = "correct all" },
		{ "<leader>d", group = "Diagnostic", icon = ICONS.diag }, -- diagnostics Errors
		{ "<leader>dd", key_funs.buf_diag, desc = "diagnostics in buffer", icon = ICONS.list },
		{ "<leader>dw", telescope.diagnostics, desc = "diagnostics list in workspace", icon = ICONS.list },
		{ "<leader>dp", vim.diagnostic.goto_prev, desc = "previous diagnostic", icon = ICONS.left },
		{ "<leader>dn", vim.diagnostic.goto_next, desc = "next diagnostics", icon = ICONS.right },
		{ "<leader>f", group = "Files" }, -- Files
		{ "<leader>fs", "<cmd>w<cr>", desc = "save file", icon = ICONS.save },
		{ "<leader>fr", telescope.oldfiles, desc = "recent files", icon = ICONS.list },
		{ "<leader>fq", "<cmd>wq<cr>", desc = "save and quit" },
		{ "<leader>fd", "<cmd>q!<cr>", desc = "Preference" },
		{ "<leader>ff", telescope.find_files, desc = "find files" },
		{ "<leader>fm", oil.toggle_float, desc = "file manager" },
		{ "<leader>fh", oil.toggle_hidden, desc = "file manager" },
		{ "<leader>fp", key_funs.setting_dir, desc = "file manager" },
		{ "<leader>s", group = "Search" }, -- Search
		{ "<leader>ss", telescope.live_grep, desc = "search string" },
		{ "<leader>sf", telescope.find_files, desc = "search files" },
		{ "<leader>sm", "<cmd>:Telescope notify<cr>", desc = "message history" },
		{ "<leader>sp", "<cmd>Telescope projects<cr>", desc = "search project" },
		{ "<leader>sb", telescope.buffers, desc = "search buffers" },
		{ "<leader>st", telescope.treesitter, desc = "search tags" },
		{ "<leader>sr", telescope.registers, desc = "search registers" },
		{ "<leader>l", group = "LSP", icon = ICONS.lsp }, -- LSP
		{ "<leader>la", vim.lsp.buf.code_action, desc = "code action" },
		{ "<leader>ld", vim.lsp.buf.definition, desc = "go to definition", icon = ICONS.motion },
		{ "<leader>lh", vim.lsp.buf.hover, desc = "hover", icon = ICONS.hover },
		{ "<leader>lr", vim.lsp.buf.references, desc = "show references", icon = ICONS.ref },
		{ "<leader>lf", key_funs.format, desc = "format code" },
		{ "<leader>lt", telescope.treesitter, desc = "list tags", icon = ICONS.list },
		{ "<leader>ln", vim.lsp.buf.rename, desc = "rename variable", icon = ICONS.rename },
		{ "<leader>m", group = "Motion", icon = ICONS.motion }, -- Motion
		{ "<leader>mm", "<Plug>(leap)", desc = "move in this window", icon = ICONS.motion },
		{ "<leader>mb", "<Plug>(leap-backward)", desc = "move backward", icon = ICONS.left },
		{ "<leader>mf", "<Plug>(leap-forward)", desc = "move forward", icon = ICONS.right },
		{ "<leader>mp", vim.diagnostic.goto_prev, desc = "previous diagnostic", icon = ICONS.left },
		{ "<leader>mn", vim.diagnostic.goto_next, desc = "next diagnostic", icon = ICONS.right },
		{ "<leader>w", group = "Windows" }, -- Windows
		{ "<leader>wc", "<c-w>c", desc = "close window", icon = ICONS.cross },
		{ "<leader>ws", "<c-w>s", desc = "split window", icon = ICONS.horizontal },
		{ "<leader>wv", "<c-w>v", desc = "split window vertically", icon = ICONS.vertical },
		{ "<leader>wj", "<c-w>j", desc = "to below window", icon = ICONS.down },
		{ "<leader>wk", "<c-w>k", desc = "to upper window", icon = ICONS.up },
		{ "<leader>wh", "<c-w>h", desc = "to left window", icon = ICONS.left },
		{ "<leader>wl", "<c-w>l", desc = "to right window", icon = ICONS.right },
		{ "<leader>wt", key_funs.toggle_terminal, desc = "toggle terminal", icon = ICONS.terminal },
		{ "<leader>g", group = "debuG", icon = ICONS.debug }, -- Python
		{ "<leader>gb", dap.toggle_breakpoint, desc = "toggle breakpoint", icon = ICONS.breakpoint },
		{ "<leader>gc", dap.continue, desc = "continue", icon = ICONS.run },
		{ "<leader>gr", key_funs.run_file, desc = "run file", icon = ICONS.run },
		{ "<leader>gd", key_funs.debug_file, desc = "debug (no ui)", icon = ICONS.debug },
	})
end

return M
