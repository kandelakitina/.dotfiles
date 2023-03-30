-- import plugin safely
local setup, window_picker = pcall(require, "window-picker")
if not setup then
  return
end

require'window-picker'.setup()

local picked_window_id = require('window-picker').pick_window()
local picker = require('window-picker')

-- Bind Window Picker to Alt-W
vim.keymap.set("n", "<A-w>", function()
    local picked_window_id = picker.pick_window() or vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(picked_window_id)
end, { desc = "Pick a window" })