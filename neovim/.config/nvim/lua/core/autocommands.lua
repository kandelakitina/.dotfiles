local cmd = vim.cmd
local A = vim.api

-- Highlight on yank
A.nvim_create_autocmd({ 'TextYankPost' }, {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- cmd [[
--     augroup PWDFollowBuffer
--         autocmd!
--         autocmd BufEnter * silent! lcd %:p:h
--     augroup end
-- ]]

-- A.nvim_create_autocmd(
--     "BufEnter",
--     { command = [[lcd %:p:h]] }
-- )