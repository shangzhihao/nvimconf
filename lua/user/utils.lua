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

M.go_next_diag = function()
    -- Get all diagnostics in the current buffer
    local diagnostics = vim.diagnostic.get(0)

    if #diagnostics == 0 then
        vim.notify("No diagnostics found in current buffer", vim.log.levels.INFO)
        return
    end
    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local next_line = nil
    local smallest_diff = math.huge

    for _, diagnostic in ipairs(diagnostics) do
        local diag_line = diagnostic.lnum + 1 -- Convert to 1-based line number
        local diff = diag_line - current_line

        if diff > 0 and diff < smallest_diff then
            smallest_diff = diff
            next_line = diag_line
        end
    end

    if next_line then
        vim.api.nvim_win_set_cursor(0, { next_line, 0 })
    else
        -- If no next diagnostic, wrap around to the first one
        local first_diag = diagnostics[1]
        vim.api.nvim_win_set_cursor(0, { first_diag.lnum + 1, 0 })
    end
end

M.go_prev_diag = function()
    -- Get all diagnostics in the current buffer
    local diagnostics = vim.diagnostic.get(0)
    if #diagnostics == 0 then
        vim.notify("No diagnostics found in current buffer", vim.log.levels.INFO)
        return
    end

    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local prev_line = nil
    local smallest_diff = math.huge

    -- Find the previous diagnostic before current line
    for _, diagnostic in ipairs(diagnostics) do
        local diag_line = diagnostic.lnum + 1 -- Convert to 1-based line number
        local diff = current_line - diag_line
        if diff > 0 and diff < smallest_diff then
            smallest_diff = diff
            prev_line = diag_line
        end
    end

    if prev_line then
        vim.api.nvim_win_set_cursor(0, { prev_line, 0 })
    else
        -- If no previous diagnostic, wrap around to the last one
        local last_diag = diagnostics[#diagnostics]
        vim.api.nvim_win_set_cursor(0, { last_diag.lnum + 1, 0 })
    end
end

M.check_command = function(command)
    -- Use the `system` function to execute shell commands
    local handle, _ = io.popen("which " .. command)
    if not handle then
        return false
    end

    local clangd_path = handle:read("*a") -- Read the entire output as a string
    handle:close()                     -- Close the pipe
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
