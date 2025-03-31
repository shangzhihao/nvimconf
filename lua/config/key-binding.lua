local M = {}
local dap = require("dap")
local utils = require("lua.user.utils")
local which_key = require("which-key")
local telescope = require("telescope.builtin")
local ICONS = require("lua.user.icons")
function M.setup()
	which_key.add({
		{
			"<leader>?",
			function()
				which_key.show({ global = false })
			end,
			icon = ICONS.question,
			desc = "Local Keymaps (which-key)",
		},
		{ "<leader>b", group = "Buffers", icon = ICONS.buf }, -- Buffers
		{ "<leader>bl", "<cmd>Telescope buffers<cr>", desc = "list buffers", icon = ICONS.list },
		{ "<leader>bc", "<cmd>bd<cr>", desc = "close buffer", icon = ICONS.fclose },
		{ "<leader>bd", "<cmd>bd!<cr>", desc = "discard and close", icon = ICONS.discard },
		{ "<leader>bs", "<cmd>w<cr>", desc = "save buffer", icon = ICONS.save},
		{ "<leader>c", group = "Check spells", icon = ICONS.check }, -- Check spells
		{ "<leader>cn", "]s", desc = "next misspelled", icon = ICONS.left },
		{ "<leader>cp", "[s", desc = "previous misspelled", icon = ICONS.right },
		{ "<leader>ca", "zg", desc = "add word to dict", icon = ICONS.good },
		{ "<leader>cs", telescope.spell_suggest, desc = "show suggestion", icon = ICONS.list },
		{ "<leader>cr", "<cmd>spellr<cr>", desc = "correct all" },
		{ "<leader>D", group = "Diagnostic", icon = ICONS.diag }, -- diagnostics Errors
		{
			"<leader>Dd",
			function()
				telescope.diagnostics({ bufnr = 0 })
			end,
			desc = "diagnostics in buffer",
			icon = ICONS.list,
		},
		{ "<leader>Dw", telescope.diagnostics, desc = "diagnostics list in workspace", icon = ICONS.list },
		{ "<leader>Dp", utils.go_prev_diag, desc = "previous diagnostic", icon = ICONS.left },
		{ "<leader>Dn", utils.go_next_diag, desc = "next diagnostics", icon = ICONS.right },
		{ "<leader>f", group = "Files" }, -- Files
		{ "<leader>fs", "<cmd>w<cr>", desc = "save file", icon = ICONS.save },
		{ "<leader>fr", telescope.oldfiles, desc = "recent files", icon=ICONS.list },
		{ "<leader>fq", "<cmd>wq<cr>", desc = "save and quit" },
		{ "<leader>fd", "<cmd>q!<cr>", desc = "discard and quit" },
		{ "<leader>ff", telescope.find_files, desc = "find files" },
		{ "<leader>fm", "<cmd>Oil --float<cr>", desc = "file manager" },
		{ "<leader>s", group = "Search" }, -- Search
		{ "<leader>ss", telescope.live_grep, desc = "search string" },
		{ "<leader>sf", telescope.find_files, desc = "search files" },
		{ "<leader>sb", telescope.buffers, desc = "search buffers" },
		{ "<leader>st", telescope.treesitter, desc = "search tags" },
		{ "<leader>sr", telescope.registers, desc = "search registers" },
		{ "<leader>l", group = "LSP", icon = ICONS.lsp }, -- LSP
		{ "<leader>la", vim.lsp.buf.code_action, desc = "code action" },
		{ "<leader>ld", vim.lsp.buf.definition, desc = "go to definition", icon=ICONS.motion},
		{ "<leader>lh", vim.lsp.buf.hover, desc = "hover", icon=ICONS.hover},
		{ "<leader>lr", vim.lsp.buf.references, desc = "show references", icon=ICONS.ref},
		{ "<leader>lf", vim.lsp.buf.format, desc = "format code" },
		{ "<leader>lt", telescope.treesitter, desc = "list tags", icon=ICONS.list},
		{ "<leader>ln", vim.lsp.buf.rename, desc = "rename variable", icon=ICONS.rename},
		{ "<leader>m", group = "Motion", icon = ICONS.motion }, -- Motion
		{ "<leader>mm", "<Plug>(leap)", desc = "move in this window", icon = ICONS.motion },
		{ "<leader>mb", "<Plug>(leap-backward)", desc = "move backward", icon = ICONS.left },
		{ "<leader>mf", "<Plug>(leap-forward)", desc = "move forward", icon = ICONS.right },
		{ "<leader>mp", utils.go_prev_diag, desc = "previous diagnostic", icon = ICONS.left },
		{ "<leader>mn", utils.go_next_diag, desc = "next diagnostic", icon = ICONS.right },
		{ "<leader>w", group = "Windows" }, -- Windows
		{ "<leader>wc", "<c-w>c", desc = "close window", icon = ICONS.cross },
		{ "<leader>ws", "<c-w>s", desc = "split window", icon = ICONS.horizontal },
		{ "<leader>wv", "<c-w>v", desc = "split window vertically", icon = ICONS.vertical },
		{ "<leader>wj", "<c-w>j", desc = "to below window", icon = ICONS.down },
		{ "<leader>wk", "<c-w>k", desc = "to upper window", icon = ICONS.up },
		{ "<leader>wh", "<c-w>h", desc = "to left window", icon = ICONS.left },
		{ "<leader>wl", "<c-w>l", desc = "to right window", icon = ICONS.right },
		{
			"<leader>wt",
			function()
				utils.terminal:toggle()
			end,
			desc = "toggle terminal",
			icon = ICONS.terminal,
		},
		{ "<leader>d", group = "Debug", icon = ICONS.debug }, -- Python
        { "<leader>db", dap.toggle_breakpoint, desc = "toggle breakpoint", icon=ICONS.breakpoint},
		{ "<leader>dc", dap.continue, desc = "continue", icon=ICONS.run },
		{
			"<leader>dr",

			function()
				local term_opt = utils.term_opt
				term_opt.display_name = "python"
				term_opt.close_on_exit = false
				term_opt.cmd = "python " .. vim.api.nvim_buf_get_name(0)
				local termnal = utils.Term:new(term_opt)
				termnal:toggle()
			end,
			desc = "run file",
			icon = ICONS.run,
		},
		{
			"<leader>dd",
			function()
				local term_opt = utils.term_opt
				term_opt.display_name = "pdb"
				term_opt.close_on_exit = true
				term_opt.cmd = "python -m pdb " .. vim.api.nvim_buf_get_name(0)
				local termnal = utils.Term:new(term_opt)
				termnal:toggle()
			end,
			desc = "debug (no ui)",
			icon = ICONS.debug,
		},
	})
end

return M
