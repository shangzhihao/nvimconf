local get_ft = require("plenary.filetype").detect_from_extension
local utils = require("user.utils")

local M = {}

local run_py = function()
	local fname = vim.api.nvim_buf_get_name(0)
	local cmd = "python " .. fname
	local terminal = utils.get_term("python", cmd, false)
	terminal:toggle()
end
local debug_py = function()
	local fname = vim.api.nvim_buf_get_name(0)
	local cmd = "python -m pdb " .. fname
	local terminal = utils.get_term("pdb", cmd, false)
	terminal:toggle()
end

local run_lua = function()
	vim.cmd("luafile %")
end
local debug_lua = nil

local run_rust = function()
	local cmd = "cargo run"
	local terminal = utils.get_term("rust", cmd, false)
	terminal:toggle()
end
local debug_rust = nil

local run_java = function()
	local cmd = "gradle run"
	local terminal = utils.get_term("java", cmd, false)
	terminal:toggle()
end
local debug_java = nil

local commands = {
	python = {
		run = run_py,
		debug = debug_py,
	},
	lua = {
		run = run_lua,
		debug = debug_lua,
	},
	rust = {
		run = run_rust,
		debug = debug_rust,
	},
	java = {
		run = run_java,
		debug = debug_java,
	},
}

M.run_file = function()
	local fname = vim.api.nvim_buf_get_name(0)
	local ft = get_ft(fname)
	if not (ft and commands[ft] and commands[ft].run) then
		vim.notify("no runner for current buffer", vim.log.levels.WARN)
		return
	end
	commands[ft].run()
end

M.debug_file = function()
	local fname = vim.api.nvim_buf_get_name(0)
	local ft = get_ft(fname)
	if not (ft and commands[ft] and commands[ft].debug) then
		vim.notify("no debugger for current buffer", vim.log.levels.WARN)
		return
	end
	commands[ft].debug()
end

return M
