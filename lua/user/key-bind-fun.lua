local telescope = require("telescope.builtin")
local utils = require("user.utils")
local code_runner = require("user.code-runner")
local oil = require("oil")
local conform = require("conform")
local terminal = utils.get_term("Terminal", nil, true)
local neoscroll = require("neoscroll")
M = {}

M.toggle_wrap = function()
	vim.wo.wrap = not vim.wo.wrap
end
M.format = function()
	local bufnr = vim.api.nvim_get_current_buf()
	conform.format({ bufnr = bufnr })
end

M.toggle_terminal = function()
	terminal:toggle()
end

M.buf_diag = function()
	telescope.diagnostics({ bufnr = 0 })
end
M.run_file = code_runner.run_file
M.debug_file = code_runner.debug_file
M.setting_dir = function()
	local config_dir = vim.fn.stdpath("config")
	oil.toggle_float(config_dir)
end
M.scroll_up = function()
	neoscroll.scroll(-0.3, { move_cursor = true, duration = 200 })
end
M.scroll_down = function()
	neoscroll.scroll(0.3, { move_cursor = true, duration = 200 })
end
M.scroll_top = function()
	neoscroll.zt({ half_win_duration = 250 })
end
M.scroll_bottom = function()
	neoscroll.zb({ half_win_duration = 250 })
end
M.scroll_center = function()
	neoscroll.zz({ half_win_duration = 250 })
end
M.todolist = function()
	local cwd = vim.fn.getcwd()
	local cmd = "TodoTelescope cwd=" .. cwd
	vim.cmd(cmd)
end
return M
