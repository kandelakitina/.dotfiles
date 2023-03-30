-- import plugin safely
local setup, ccc = pcall(require, "ccc")
if not setup then
  return
end

vim.opt.termguicolors = true

local ccc = require("ccc")

ccc.setup({
  highlighter = { auto_enable = true}
})