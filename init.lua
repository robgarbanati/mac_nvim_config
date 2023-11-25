package.path = package.path .. ";/Users/rgarbana/.config/nvim/?.lua"
require("plugins")
vim.g.mapleader = " "
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldnestmax = 1
vim.opt.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').' ... '.trim(getline(v:foldend))]]
-- vim.cmd [[highlight Folded ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE]]
