-- -- Gruvbox
-- ----------
-- local setup, gruvbox = pcall(require, "gruvbox")
-- if not setup then
--   return
-- end

-- require("gruvbox").setup()
-- vim.cmd("colorscheme gruvbox")

-- kanagawa
-----------
local setup, kanagawa = pcall(require, "kanagawa")
if not setup then
  return
end

-- require("kanagawa").setup()
vim.cmd("colorscheme kanagawa")
