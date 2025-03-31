local M = {}

local debugger_cmd = require("config.debugger-cmd")

M.ext_to_runner = function(ext)
    return debugger_cmd.runner_mapping[ext]
end

M.ext_to_debugger = function(ext)
    return debugger_cmd.debugger_mapping[ext]
end

M.get_ext_name = function(full_path)
    -- Find the last dot in the string
    local lastDot = full_path:match("^.-(%.[^%.\\/]*)$")
    -- If there's no dot, return an empty string (no extension)
    if not lastDot then
        return ""
    end
    return lastDot:sub(2)
end

M.get_dir = function(full_path)
    return full_path:match("(.*/)") or full_path:match("(.+\\)")
end

M.check_command = function(command)
    -- Use the `system` function to execute shell commands
    local handle, _ = io.popen("which " .. command)
    if not handle then
        return false
    end

    local clangd_path = handle:read("*a") -- Read the entire output as a string
    handle:close()                        -- Close the pipe
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
