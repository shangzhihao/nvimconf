local proj_nvim = require("project_nvim")
local Path = require("plenary.path")

local debugger_cmd = require("config.debugger-cmd")

local M = {}

local is_subdir = function(parent_dir, child_dir)
	local parent_path = Path:new(parent_dir)
	local child_path = Path:new(child_dir)
	parent_path = parent_path:absolute()
	child_path = child_path:absolute()
	local parent_str = tostring(parent_path)
	local child_str = tostring(child_path)
	return child_str:sub(1, #parent_str) == parent_str and #child_str >= #parent_str
end
M.is_subdir = is_subdir

M.chdir = function()
	local current_folder = Path:new(vim.fn.expand("%:p:h"))
	local cwd = Path:new(vim.fn.getcwd())
	local mrp = proj_nvim.get_recent_projects()
	for _, proj in ipairs(mrp) do
		local proj_path = Path:new(proj)
		if is_subdir(proj_path, current_folder) then
			if proj_path:absolute() == cwd:absolute() then
				return
			end
			local new_cwd = tostring(proj_path)
			vim.cmd("lcd " .. new_cwd)
			local short_cwd = vim.fn.fnamemodify(new_cwd, ":~")
			vim.notify("change cwd to " .. short_cwd, vim.log.levels.INFO)
			return
		end
	end
	vim.cmd("lcd " .. tostring(current_folder))
end
M.ext_to_runner = function(ext)
	return debugger_cmd.runner_mapping[ext]
end

M.ext_to_debugger = function(ext)
	return debugger_cmd.debugger_mapping[ext]
end

M.check_command = function(command)
	-- Use the `system` function to execute shell commands
	local handle, _ = io.popen("which " .. command)
	if not handle then
		return false
	end

	local clangd_path = handle:read("*a") -- Read the entire output as a string
	handle:close() -- Close the pipe
	if clangd_path ~= "" then
		return true
	else
		return false
	end
end

M.term_opt = {
	direction = "float",
	display_name = "Terminal",
	cmd = nil,
	close_on_exit = true,
	clear_env = false,
	float_opts = {
		border = "curved",
		winblend = 3,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
		width = function()
			return math.floor(vim.o.columns * 0.8)
		end,
		height = function()
			return math.floor(vim.o.lines * 0.8)
		end,
	},
}

return M
