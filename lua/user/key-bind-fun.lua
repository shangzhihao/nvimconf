local telescope = require("telescope.builtin")
local utils = require("user.utils")
local code_runner = require("user.code-runner")

local terminal = utils.get_term("Terminal", nil, true)
M = {}
M.toggle_terminal = function()
	terminal:toggle()
end

M.buf_diag = function()
	telescope.diagnostics({ bufnr = 0 })
end
M.run_file = code_runner.run_file
M.debug_file = code_runner.debug_file
return M
