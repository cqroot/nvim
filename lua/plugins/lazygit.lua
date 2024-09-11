local M = {}

local lazygit = require("toggleterm.terminal").Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "curved",
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

function M.toggle()
    lazygit:toggle()
end

return M