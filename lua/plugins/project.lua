return {
	"ahmedkhalf/project.nvim",
	config = function()
		local proj = require("project_nvim")
		proj.setup({
			detection_methods = { "pattern" },

			-- All the patterns used to detect root dir, when **"pattern"** is in
			-- detection_methods
			-- .nvimproj is a flag that makes a folder nvim project
			patterns = { ".git", "pyproject.toml", "Cargo.toml", "Makefile", ".nvimproj" },

			-- Don't calculate root dir on specific directories
			-- Ex: { "~/.cargo/*", ... }
			exclude_dirs = { "~", "/opt/homebrew" },

			-- Show hidden files in telescope
			show_hidden = false,

			-- When set to false, you will get a message when project.nvim changes your
			-- directory.
			silent_chdir = true,

			-- What scope to change the directory, valid options are
			-- * global (default)
			-- * tab
			-- * win
			scope_chdir = "global",

			-- Path where project.nvim will store the project history for use in
			-- telescope
			datapath = vim.fn.stdpath("data"),
		})
		require("telescope").load_extension("projects")
	end,
}
