package.path = package.path .. ";/Users/rgarbana/.config/nvim/?.lua"
require("plugins")
vim.g.mapleader = " "
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldnestmax = 1

