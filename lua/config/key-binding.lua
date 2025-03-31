local dap = require("dap")
local which_key = require("which-key")
local telescope = require("telescope.builtin")
local oil = require("oil")
local key_funs = require("user.key-bind-fun")
local ICONS = require("config.icons")

local M = {}

function M.setup()
	which_key.add({
		{ "<leader>b", group = "Buffers", icon = ICONS.buf }, -- Buffers
		{ "<leader>bl", "<cmd>Telescope buffers<cr>", desc = "list buffers", icon = ICONS.list },
		{ "<leader>bc", "<cmd>bd<cr>", desc = "close buffer", icon = ICONS.fclose },
		{ "<leader>bd", "<cmd>bd!<cr>", desc = "discard and close", icon = ICONS.discard },
		{ "<leader>bs", "<cmd>w<cr>", desc = "save buffer", icon = ICONS.save },
		{ "<leader>d", group = "Diagnostic", icon = ICONS.diag }, -- diagnostics Errors
		{ "<leader>dd", key_funs.buf_diag, desc = "diagnostics in buffer", icon = ICONS.list },
		{ "<leader>dw", telescope.diagnostics, desc = "diagnostics list in workspace", icon = ICONS.list },
		{ "<leader>dp", vim.diagnostic.goto_prev, desc = "previous diagnostic", icon = ICONS.left },
		{ "<leader>dn", vim.diagnostic.goto_next, desc = "next diagnostics", icon = ICONS.right },
		{ "<leader>f", group = "Files" }, -- Files
		{ "<leader>fw", "<cmd>w<cr>", desc = "save file", icon = ICONS.save },
		{ "<leader>fr", telescope.oldfiles, desc = "recent files", icon = ICONS.list },
		{ "<leader>fq", "<cmd>q<cr>", desc = "save and quit" },
		{ "<leader>fd", "<cmd>q!<cr>", desc = "Preference" },
		{ "<leader>ff", telescope.find_files, desc = "find files" },
		{ "<leader>fm", oil.toggle_float, desc = "file manager" },
		{ "<leader>fh", oil.toggle_hidden, desc = "toggle hidden" },
		{ "<leader>fp", key_funs.setting_dir, desc = "file manager" },
		{ "<leader>g", group = "debuG", icon = ICONS.debug }, -- Debug
		{ "<leader>gb", dap.toggle_breakpoint, desc = "toggle breakpoint", icon = ICONS.breakpoint },
		{ "<leader>gc", dap.continue, desc = "continue", icon = ICONS.run },
		{ "<leader>gr", key_funs.run_file, desc = "run file", icon = ICONS.run },
		{ "<leader>gd", key_funs.debug_file, desc = "debug (no ui)", icon = ICONS.debug },
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
		{ "<leader>s", group = "Spells check", icon = ICONS.check }, -- Check spells
		{ "<leader>sn", "]s", desc = "next misspelled", icon = ICONS.left },
		{ "<leader>sp", "[s", desc = "previous misspelled", icon = ICONS.right },
		{ "<leader>sa", "zg", desc = "add word to dict", icon = ICONS.good },
		{ "<leader>ss", telescope.spell_suggest, desc = "show suggestion", icon = ICONS.list },
		{ "<leader>sr", "<cmd>spellr<cr>", desc = "correct all" },
		{ "<leader>t", group = "Telescope" }, -- Search
		{ "<leader>ts", telescope.live_grep, desc = "live grep" },
		{ "<leader>tf", telescope.find_files, desc = "find files" },
		{ "<leader>tl", telescope.current_buffer_fuzzy_find, desc = "search lines" },
		{ "<leader>tm", "<cmd>Telescope notify<cr>", desc = "message history" },
		{ "<leader>tp", "<cmd>Telescope projects<cr>", desc = "projects" },
		{ "<leader>tb", telescope.buffers, desc = "opened buffers" },
		{ "<leader>tt", telescope.treesitter, desc = "treesitter tags" },
		{ "<leader>tr", telescope.registers, desc = "list registers" },
		{ "<leader>w", group = "Windows" }, -- Windows
		{ "<leader>wc", "<c-w>c", desc = "close window", icon = ICONS.cross },
		{ "<leader>ws", "<c-w>s", desc = "split window", icon = ICONS.horizontal },
		{ "<leader>wv", "<c-w>v", desc = "split window vertically", icon = ICONS.vertical },
		{ "<leader>wj", "<c-w>j", desc = "to below window", icon = ICONS.down },
		{ "<leader>wk", "<c-w>k", desc = "to upper window", icon = ICONS.up },
		{ "<leader>wh", "<c-w>h", desc = "to left window", icon = ICONS.left },
		{ "<leader>wl", "<c-w>l", desc = "to right window", icon = ICONS.right },
		{ "<leader>wt", key_funs.toggle_terminal, desc = "toggle terminal", icon = ICONS.terminal },
		{ "<leader>x", group = "Misc.", icon = ICONS.debug }, -- Misc
		{ "<leader>xh", "<cmd>set hlsearch!<CR>", desc = "toggle highlight", icon = ICONS.misc },
	})
end

return M
