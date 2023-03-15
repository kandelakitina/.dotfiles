vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<ESC>', ':nohlsearch<CR>', { silent = true })

-- Buffers management (uses close-buffers.nvim plugin)
vim.keymap.set('n', '<C-q>', ':Bdelete<CR>', { silent = true })
vim.keymap.set('n', '<C-h>', ':BufferLineCyclePrev<CR>', { silent = true })
vim.keymap.set('n', '<C-left>', ':BufferLineCyclePrev<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', ':BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<C-right>', ':BufferLineCycleNext<CR>', { silent = true })

-- Save and quit
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<c-a-q>', ':qa!<CR>')

-- Windows
vim.keymap.set('n', '<A-q>', ':close<CR>')
vim.keymap.set('n', '<A-h>', ':split<CR>')
vim.keymap.set('n', '<A-v>', ':vsplit<CR>')

-- Ctrl-E / A in insert mode to go to the end / start of the line 
vim.keymap.set('i', '<C-E>', '<ESC>A')
vim.keymap.set('i', '<C-A>', '<ESC>I')

-- Ctrl-Shift-V to paste 
vim.keymap.set('i', '<C-S-v>', '<C-r>+')
vim.keymap.set('c', '<C-S-v>', '<C-r>+')
vim.keymap.set('n', '<C-S-v>', '"+p')
vim.keymap.set('v', '<C-S-v>', '_dp')

-- Paste instead of selection without yanking
vim.keymap.set('v', 'p', '_dp')

-- Ctrl-c to copy
vim.keymap.set('v', '<C-c>', '"+y')

-- Don't yank with "x"
vim.keymap.set('n', 'x', '"_x')

-- Moving selected blocks with Move plugin
vim.keymap.set('n', '<A-down>', ':MoveLine(1)<CR>')
vim.keymap.set('n', '<A-up>', ':MoveLine(-1)<CR>')
vim.keymap.set('n', '<A-left>', ':MoveHChar(-1)<CR>')
vim.keymap.set('n', '<A-right>', ':MoveHChar(1)<CR>')

vim.keymap.set('v', '<A-down>', ':MoveBlock(1)<CR>')
vim.keymap.set('v', '<A-up>', ':MoveBlock(-1)<CR>')
vim.keymap.set('v', '<A-left>', ':MoveHBlock(-1)<CR>')
vim.keymap.set('v', '<A-right>', ':MoveHBlock(1)<CR>')

-- PackerSync
vim.keymap.set('n', '<leader>ps', ':PackerSync<CR>')

-- Lazygit
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { silent = true })

-- Toggle NeoTree
vim.keymap.set('n', '<C-E>', ':NeoTreeRevealToggle<CR>', { silent = true })

-- Bracey
vim.keymap.set('n', '<leader>bo', ':Bracey<CR>', { silent = true })
vim.keymap.set('n', '<leader>br', ':BraceyReload<CR>', { silent = true })

-- Comment current line or selected lines
vim.keymap.set('n', '<A-c>', '<Plug>(comment_toggle_linewise_current)')
vim.keymap.set('v', '<A-c>', '<Plug>(comment_toggle_linewise_visual)<bar>gv') -- <bar> separates commands

-- Comment out and refresh browser
vim.keymap.set('n', '<A-b>', '<Plug>(comment_toggle_linewise_current)<bar>:BraceyReload<CR>')
vim.keymap.set('v', '<A-b>', '<Plug>(comment_toggle_linewise_visual)<bar>:BraceyReload<CR><bar>gv')

-- Luasnip binding for jumping or expanding (no need to lua code in completions.lua)
-- vim.keymap.set('i', '<TAB>', '<Plug>luasnip-expand-or-jump')
-- vim.keymap.set('i', '<S-TAB>', "<cmd>lua require'luasnip'.jump(-1)<Cr>")
-- vim.keymap.set('s', '<TAB>', "<cmd>lua require('luasnip').jump(1)<Cr>")
-- vim.keymap.set('s', '<S-TAB>', "<cmd>lua require('luasnip').jump(-1)<Cr>")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

--- CCC Colorpicker
vim.keymap.set('n', '<leader>cp', ':CccPick<CR>', { silent = true }) -- pick color
vim.keymap.set('n', '<leader>cc', ':CccConvert<CR>', { silent = true }) -- convert (RGB/HSL/HEX)
vim.keymap.set('n', '<leader>ct', ':CccHighlighterToggle<CR>', { silent = true }) -- toggle highlighting


--- New lines (using unimpaired bindings)
vim.keymap.set('n', '<A-k>', ":<c-u>put!=repeat([''],v:count)<bar>']+1<cr>", { silent = true })
vim.keymap.set('n', '<A-j>', ":<c-u>put =repeat([''],v:count)<bar>'[-1<cr>", { silent = true })

--- Yank all buffer
vim.keymap.set('n', '<leader>aa', ":%y+<cr>")

-- Manual Format
vim.keymap.set('n', '<leader>gf', ":lua vim.lsp.buf.format()<CR>")