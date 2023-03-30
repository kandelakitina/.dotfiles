vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- import plugin safely
local setup, neo_tree = pcall(require, "neo-tree")
if not setup then
  return
end

require("neo-tree").setup({
  mappings = {
    ["S"] = "split_with_window_picker",
    ["s"] = "vsplit_with_window_picker",
  }
})
