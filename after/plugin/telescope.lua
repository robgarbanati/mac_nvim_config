local builtin = require('telescope.builtin')

local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")
-- local extensions = require("telescope.extensions")

telescope.setup {
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        -- i = {
        --   ["<C-k>"] = lga_actions.quote_prompt(),
        --   ["<C-G>"] = lga_actions.quote_prompt({ postfix = " -tc " }),
        --   ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        -- },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    }
  }
}
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
vim.keymap.set("n", "<leader>gw", live_grep_args_shortcuts.grep_word_under_cursor) -- grep word
vim.keymap.set("n", "<leader>gp", builtin.git_files, {}) -- get project
vim.keymap.set("n", "<leader>gf", builtin.find_files, {}) -- get files
vim.keymap.set("n", "<leader>gg", builtin.live_grep, {}) -- get grep
vim.keymap.set('n', '<leader>gb', builtin.buffers, {}) -- get buffers
vim.keymap.set('n', '<leader>gh', builtin.help_tags, {}) -- get help
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {}) -- get references for word under cursor
vim.keymap.set("n", "<leader>gc", ':lua require("telescope").extensions.live_grep_args.live_grep_args({vimgrep_arguments = { "rg", "--with-filename", "--line-number", "--column", "--smart-case", "--type=c" } })<CR>') -- get c files
vim.keymap.set("n", "<leader>gl", ':lua require("telescope").extensions.live_grep_args.live_grep_args({vimgrep_arguments = { "rg", "--with-filename", "--line-number", "--column", "--smart-case", "--type=lua" } })<CR>') -- get lua files
vim.keymap.set("n", "<leader>gy", ':Telescope neoclip extra=plus<CR>') -- get yanks
require('telescope').load_extension('fzf')
-- require('telescope').load_extension('neoclip')
