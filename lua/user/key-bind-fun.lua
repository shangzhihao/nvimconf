local telescope = require("telescope.builtin")
local utils = require("user.utils")
local oil = require("oil")
local neoscroll = require("neoscroll")
M = {}

M.toggle_wrap = function()
	vim.wo.wrap = not vim.wo.wrap
end

M.buf_diag = function()
	telescope.diagnostics({ bufnr = 0 })
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
