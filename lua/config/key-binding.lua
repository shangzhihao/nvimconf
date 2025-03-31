local M = {}
local web_icons = require("nvim-web-devicons")
local get_icon = web_icons.get_icon
local wk_hl_group = "WhichKeyGroup"

local ICONS = {
    buf = { icon = get_icon("best.app", "app"), hl = wk_hl_group, color = "orange" },
    ckeck = { icon = "󰓆", hl = wk_hl_group, color = "red" },
}

function M.setup()
    local telescope = require("telescope.builtin")
    local which_key = require("which-key")
    local lint = require("lint")
    local dap = require("dap")
    which_key.add({
        {
            "<leader>?",
            function()
                which_key.show({ global = false })
            end,
            desc = "Local Keymaps (which-key)",
        },
        { "<leader>b",  group = "Buffers",            icon = ICONS.buf }, -- Buffers
        { "<leader>bl", "<cmd>Telescope buffers<cr>", desc = "list buffers" },
        { "<leader>bd", "<cmd>bd<cr>",                desc = "close buffer" },
        { "<leader>bs", "<cmd>w<cr>",                 desc = "save buffer" },
        { "<leader>c",  group = "Check spells",       icon = ICONS.ckeck }, -- Check spells
        { "<leader>cn", "]s",                         desc = "next misspelled" },
        { "<leader>cp", "[s",                         desc = "previous misspelled" },
        { "<leader>ca", "zg",                         desc = "add word to dict" },
        { "<leader>cs", telescope.spell_suggest,      desc = "show suggestion" },
        { "<leader>cr", "<cmd>spellr<cr>",            desc = "correct all" },
        { "<leader>d",  group = "Debug" }, -- Debug
        { "<leader>db", dap.toggle_breakpoint,        desc = "find files" },
        { "<leader>dc", dap.continue,                 desc = "find files" },
        { "<leader>e",  group = "Errors" }, -- diagnostics Errors
        {
            "<leader>eb",
            function()
                telescope.diagnostics({ bufnr = 0 })
            end,
            desc = "error list in buffer",
        },
        { "<leader>ew", telescope.diagnostics,       desc = "error list in workspace" },
        { "<leader>f",  group = "Files" }, -- Files
        { "<leader>fs", "<cmd>w<cr>",                desc = "save file" },
        { "<leader>fr", telescope.oldfiles,          desc = "recent files" },
        { "<leader>fq", "<cmd>q<cr>",                desc = "quit nvim" },
        { "<leader>ff", telescope.find_files,        desc = "find files" },
        { "<leader>fm", "<cmd>Oil --float<cr>",      desc = "file manager" },
        { "<leader>s",  group = "Search" }, -- Search
        { "<leader>ss", telescope.live_grep,         desc = "search string" },
        { "<leader>sf", telescope.find_files,        desc = "search files" },
        { "<leader>sb", telescope.buffers,           desc = "serch buffers" },
        { "<leader>st", telescope.treesitter,        desc = "serch tags" },
        { "<leader>sr", telescope.registers,         desc = "serch registers" },
        { "<leader>l",  group = "LSP" }, -- LSP
        { "<leader>la", vim.lsp.buf.code_action,     desc = "code action" },
        { "<leader>ld", vim.lsp.buf.definition,      desc = "go to definition" },
        { "<leader>lh", vim.lsp.buf.hover,           desc = "hover" },
        { "<leader>lr", vim.lsp.buf.references,      desc = "show references" },
        { "<leader>lf", vim.lsp.buf.format,          desc = "format code" },
        { "<leader>lt", telescope.treesitter,        desc = "list tags" },
        { "<leader>ll", lint.try_lint,               desc = "lint code" },
        { "<leader>m",  group = "Motion" }, -- Motion
        { "<leader>mm", "<Plug>(leap)",              desc = "move in this window" },
        { "<leader>mb", "<Plug>(leap-backward)",     desc = "move backward" },
        { "<leader>mf", "<Plug>(leap-forward)",      desc = "move forward" },
        { "<leader>w",  group = "Windows" }, -- Windows
        { "<leader>wc", "<c-w>c",                    desc = "close window" },
        { "<leader>ws", "<c-w>s",                    desc = "split window" },
        { "<leader>wv", "<c-w>v",                    desc = "split window vertically" },
        { "<leader>wj", "<c-w>j",                    desc = "to below window" },
        { "<leader>wk", "<c-w>k",                    desc = "to upper window" },
        { "<leader>wh", "<c-w>h",                    desc = "to left window" },
        { "<leader>wl", "<c-w>l",                    desc = "to right window" },
        { "<leader>p",  group = "Python" }, -- Python
        { "<leader>pm", lint.try_lint,               desc = "mypy lint" },
        { "<leader>pr", "<cmd>!python %<cr>",        desc = "run file" },
        { "<leader>pd", "<cmd>!python -m pdb %<cr>", desc = "run file" },
    })
end

return M
