local proj_nvim = require("project_nvim")
local Path = require("plenary.path")
local togg_term = require("toggleterm.terminal")
local Terminal = togg_term.Terminal
local term_opt = vim.g.my_float_term_opt

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

local function deepcopy(orig)
	local copy
	if type(orig) == "table" then
		copy = {}
		for key, value in pairs(orig) do
			copy[deepcopy(key)] = deepcopy(value)
		end
		setmetatable(copy, deepcopy(getmetatable(orig)))
	else
		copy = orig
	end
	return copy
end
M.deepcopy = deepcopy

M.get_term = function(title, cmd, is_close)
	local opt = deepcopy(term_opt)
	opt.dir = vim.fn.getcwd()
	opt.display_name = title
	opt.close_on_exit = is_close
	opt.cmd = cmd
	return Terminal:new(opt)
end
return M
