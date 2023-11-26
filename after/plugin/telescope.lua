local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-f>', builtin.git_files, {})
vim.keymap.set('n', '<C-F>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>gc', builtin.live_grep{vimgrep_arguments = {'rg', '--with-filename', '--line-number', '--column', '--smart-case', '-tc'}})
-- vim.api.nvim_buf_set_keymap(0, 'n', '<C-G', "lua require'telescope.builtin'.live_grep{ vimgrep_arguments = { 'rg', '--with-filename', '--line-number', '--column', '--smart-case', '-tc' } }", {noremap=true, silent=true})
-- vim.keymap.set('n', '<leader>fc', function() builtin.live_grep({'rg', '--with-filename', '--line-number', '--column', '--smart-case', '-tc'}) end, {noremap = true, silent = true})
-- vim.keymap.set('n', '<leader>fc', function() builtin.live_grep({'--with-filename', '--line-number', '--column', '--smart-case', '-tc'}) end, {noremap = true, silent = true})
-- vim.keymap.set('n', '<C-G>', function() builtin.grep_string({ search = }) end, {noremap = true, silent = true})
-- vim.keymap.set('n', '<leader>fc', builtin.live_grep, {'rg', '--with-filename', '--line-number', '--column', '--smart-case', '-tc'})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup {
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-G>"] = lga_actions.quote_prompt({ postfix = " -tc " }),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    }
  }
}
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
vim.keymap.set("n", "<leader>gw", live_grep_args_shortcuts.grep_word_under_cursor)
vim.keymap.set("n", "<leader>gp", builtin.git_files, {})
vim.keymap.set("n", "<leader>gf", builtin.find_files, {})
vim.keymap.set("n", "<leader>gg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>gc", lga_actions.quote_prompt({ postfix = " -tc " }))
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
require('telescope').load_extension('fzf')

