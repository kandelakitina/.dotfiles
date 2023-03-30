vim.o.termguicolors = true

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- Line numbers
vim.opt.number = true

-- use spaces for tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Bracey autorefresh page on save (does not work on ext. CSS)
vim.g.bracey_refresh_on_save = 1

-- Smart case when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- use clipboard when copy
vim.opt.clipboard:append("unnamedplus")