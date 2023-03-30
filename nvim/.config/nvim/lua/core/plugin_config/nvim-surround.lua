-- import plugin safely
local setup, nvim_surround = pcall(require, "nvim-surround")
if not setup then
  return
end

require("nvim-surround").setup({
  keymaps = {
    visual = "gs",
  },
})