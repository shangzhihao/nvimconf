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
        require("nvim-web-devicons").setup()
        require("config.key-binding").setup()
    end,
    opts = {},
    keys = {},
}
