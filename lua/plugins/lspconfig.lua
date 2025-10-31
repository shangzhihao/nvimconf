-- lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- merge cmp capabilities with LSP defaults
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- configure servers (new API)
    vim.lsp.config("pyright", {
      capabilities = capabilities,
      -- settings = { python = { analysis = { typeCheckingMode = "basic" } } },
    })

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    })

    -- (optional) Ruff LSP if you want linting/quickfixes
    -- vim.lsp.config("ruff", { capabilities = capabilities })

    -- enable them globally
    vim.lsp.enable("pyright")
    vim.lsp.enable("lua_ls")
    -- vim.lsp.enable("ruff")
  end,
}

