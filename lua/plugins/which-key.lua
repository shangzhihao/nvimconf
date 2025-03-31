return {
    "folke/which-key.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    event = "VeryLazy",
    config = function()
        local which_key = require("which-key")
        which_key.setup({
            delay = 800,
        })
        require("config.key-binding").setup()
    end,
    opts = {},
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Local Keymaps (which-key)",
        },
    },
}
