local M = {}
function M.setup()
	local telescope = require("telescope.builtin")
	local which_key = require("which-key")
	local dap = require("dap")
	which_key.add({
		{ "<leader>b", group = "buffer" }, -- Buffers
		{ "<leader>bl", "<cmd>Telescope buffers<cr>", desc = "list buffers" },
		{ "<leader>bd", "<cmd>bd<cr>", desc = "close buffer" },
		{ "<leader>bs", "<cmd>w<cr>", desc = "save buffer" },
		{ "<leader>c", group = "check spells" }, -- Check spells
		{ "<leader>cn", "]s", desc = "next misspelled" },
		{ "<leader>cp", "[s", desc = "previous misspelled" },
		{ "<leader>ca", "zg", desc = "add word to dict" },
		{ "<leader>cs", telescope.spell_suggest, desc = "show suggestion" },
		{ "<leader>cr", "<cmd>spellr<cr>", desc = "correct all" },
		{ "<leader>f", group = "file" }, -- Debug
		{ "<leader>db", dap.toggle_breakpoint, desc = "find files" },
		{ "<leader>dc", dap.continue, desc = "find files" },
		{ "<leader>f", group = "file" }, -- Files
		{ "<leader>ff", telescope.find_files, desc = "find files" },
		{ "<leader>fb", telescope.buffers, desc = "find buffers" },
		{ "<leader>fm", "<cmd>Oil --float<cr>", desc = "file manager" },
		{ "<leader>ft", telescope.treesitter, desc = "find tags" },
		{ "<leader>fs", "<cmd>w<cr>", desc = "save file" },
		{ "<leader>fq", "<cmd>q<cr>", desc = "quit nvim" },
		{ "<leader>s", group = "search" }, -- Search
		{ "<leader>ss", telescope.live_grep, desc = "search string" },
		{ "<leader>l", group = "LSP" }, -- LSP
		{ "<leader>la", vim.lsp.buf.code_action, desc = "code action" },
		{ "<leader>ld", vim.lsp.buf.definition, desc = "go to definition" },
		{
			"<leader>le",
			function()
				telescope.diagnostics({
					severity = vim.diagnostics.severity.ERROR,
					bufnr = 0,
				})
			end,
			desc = "error diagnostics",
		},
		{ "<leader>lh", vim.lsp.buf.hover, desc = "hover" },
		{ "<leader>lr", vim.lsp.buf.references, desc = "show references" },
		{ "<leader>lf", vim.lsp.buf.format, desc = "format code" },
		{ "<leader>lt", telescope.treesitter, desc = "list tags" },
		{ "<leader>m", group = "motion" }, -- Motion
		{ "<leader>mm", "<Plug>(leap)", desc = "move in this window" },
		{ "<leader>mb", "<Plug>(leap-backward)", desc = "move backward" },
		{ "<leader>mf", "<Plug>(leap-forward)", desc = "move forward" },
		{ "<leader>w", group = "windows" }, -- Windows
		{ "<leader>wc", "<c-w>c", desc = "close window" },
		{ "<leader>ws", "<c-w>s", desc = "split window" },
		{ "<leader>wv", "<c-w>v", desc = "split window vertically" },
		{ "<leader>wj", "<c-w>j", desc = "to below window" },
		{ "<leader>wk", "<c-w>k", desc = "to upper window" },
		{ "<leader>wh", "<c-w>h", desc = "to left window" },
		{ "<leader>wl", "<c-w>l", desc = "to right window" },
	})
end

return M
