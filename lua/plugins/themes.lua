return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            -- flavor (light to dark) can be: latte, frappe, macchiato, mocha
            vim.cmd.colorscheme("catppuccin-frappe")
        end,
    },
}
