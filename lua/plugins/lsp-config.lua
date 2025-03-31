return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({})
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.clangd.setup({})
            lspconfig.pylsp.setup({
                settings = {
                    plugins = {
                        pycodestyle = {
                            ignore = { "W391" },
                            maxLineLength = 120,
                        },
                    },
                },
            })
        end,
    },
}
