local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")
-- local extensions = require("telescope.extensions")

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
vim.keymap.set("n", "<leader>gq", lga_actions.quote_prompt())
-- vim.keymap.set("n", "<leader>gc", lga_actions.quote_prompt({ postfix = " -tc " }))
-- vim.keymap.set("n", "<leader>gc", telescope.extensions.live_grep_args.live_grep_args({ postfix = " --type=c " }))
-- vim.keymap.set("n", "<leader>gc", telescope.extensions.live_grep_args.live_grep_args())
-- vim.keymap.set("n", "<leader>gc", lga_
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set("n", "<leader>ge", ":lua require('telescope').extensions.live_grep_args.live_grep_args({postfix = ' --type=c ' })<CR>")
vim.keymap.set("n", "<leader>gr", ':lua require("telescope").extensions.live_grep_args.live_grep_args({vimgrep_arguments = { "rg", "--with-filename", "--line-number", "--column", "--smart-case" } })<CR>')
vim.keymap.set("n", "<leader>gc", ':lua require("telescope").extensions.live_grep_args.live_grep_args({vimgrep_arguments = { "rg", "--with-filename", "--line-number", "--column", "--smart-case", "--type=c" } })<CR>')
vim.keymap.set("n", "<leader>gl", ':lua require("telescope").extensions.live_grep_args.live_grep_args({vimgrep_arguments = { "rg", "--with-filename", "--line-number", "--column", "--smart-case", "--type=lua" } })<CR>')
-- vim.api.nvim_buf_set_keymap(0, 'n', '<C-G', "lua require'telescope.builtin'.live_grep{ vimgrep_arguments = { 'rg', '--with-filename', '--line-number', '--column', '--smart-case', '-tc' } }", {noremap=true, silent=true}
vim.keymap.set("n", "<leader>ga", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>gt', "lua require'telescope.builtin'.live_grep{ vimgrep_arguments = { 'rg', '--with-filename', '--line-number', '--column', '--smart-case' } }", {noremap=true, silent=true})
require('telescope').load_extension('fzf')

