return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		require("lint").linters_by_ft = {
			python = { "ruff", "mypy" },
			-- python = { "pylint", "mypy" },
			rust = { "clippy" },
			java = { "checkstyle" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
