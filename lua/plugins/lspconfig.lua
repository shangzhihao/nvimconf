return {
	"neovim/nvim-lspconfig",
	config = function()
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                },
            },
        })

        vim.lsp.config("pyright", {})

        -- Enable them for their respective filetypes
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("pyright")
    end,
}
