local proj_nvim = require("project_nvim")
local Path = require("plenary.path")
local telescope = require("telescope.builtin")
local pl_ft = require("plenary.filetype")
local Terminal = require("toggleterm.terminal").Terminal
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

local ext_to_runner = function(ext)
	return debugger_cmd.runner_mapping[ext]
end

local ext_to_debugger = function(ext)
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

local term_opt = {
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

M.toggle_terminal = function()
	term_opt.dir = vim.fn.getcwd()
	term_opt.display_name = "terminal"
	term_opt.close_on_exit = true
	term_opt.cmd = nil
	local termnal = Terminal:new(term_opt)
	termnal:toggle()
end
M.run_file = function()
	local fname = vim.api.nvim_buf_get_name(0)
	local ftype = pl_ft.detect_from_extension(fname)
	term_opt.display_name = ftype
	term_opt.dir = vim.fn.getcwd()
	term_opt.close_on_exit = false
	local runner = ext_to_runner(ftype)
	if not runner then
		vim.notify("no runner for current buffer", vim.log.levels.WARN)
		return
	end
	term_opt.cmd = runner .. " " .. vim.api.nvim_buf_get_name(0)
	local termnal = Terminal:new(term_opt)
	termnal:toggle()
end

M.noui_debug = function()
	local fname = vim.api.nvim_buf_get_name(0)
	local ftype = pl_ft.detect_from_extension(fname)
	term_opt.display_name = ftype .. " debug"
	term_opt.dir = vim.fn.getcwd()
	term_opt.close_on_exit = true
	local debugger = ext_to_debugger(ftype)
	if not debugger then
		vim.notify("no debugger for current buffer", vim.log.levels.WARN)
		return
	end
	term_opt.cmd = debugger .. " " .. vim.api.nvim_buf_get_name(0)
	local termnal = Terminal:new(term_opt)
	termnal:toggle()
end

M.buf_diag = function()
	telescope.diagnostics({ bufnr = 0 })
end

return M
