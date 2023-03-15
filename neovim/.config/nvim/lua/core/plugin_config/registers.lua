-- import plugin safely
local setup, registers = pcall(require, "registers")
if not setup then
  return
end

require('registers').setup({
  show = '*+\"-/_=#%.01234abc:'
})
