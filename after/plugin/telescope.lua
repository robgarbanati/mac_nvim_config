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
  },
  pickers = {
    find_files = {
      -- Use `fd` or another file finder command that allows ignoring .gitignore
      -- find_command = {'fd', '--type', 'f', '--hidden', '--no-ignore'}
      find_command = {'fd', '--type', 'f', '--hidden', '-I', '-L'}
      -- find_command = {'fd', '-I'}
    }
  }
}
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
vim.keymap.set("n", "<leader>gw", live_grep_args_shortcuts.grep_word_under_cursor) -- grep word
vim.keymap.set("n", "<leader>gf", builtin.git_files, {}) -- get project
vim.keymap.set("n", "<leader>ga", builtin.find_files, {}) -- get all files
vim.keymap.set("n", "<leader>gg", builtin.live_grep, {}) -- get grep
-- vim.keymap.set("n", "<leader>gB", builtin.live_grep, { grep_open_files = true }) -- get grep
vim.keymap.set('n', '<leader>gB', function() builtin.grep_string({ search = vim.fn.input("Grep For > "), use_regex = true, bufnr = vim.fn.getbufinfo({ buflisted = true }) }) end)
vim.keymap.set('n', '<leader>gb', builtin.buffers, {}) -- get buffers
vim.keymap.set('n', '<leader>gh', builtin.help_tags, {}) -- get help
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {}) -- get references for word under cursor
vim.keymap.set("n", "<leader>gG", ':lua require("telescope").extensions.live_grep_args.live_grep_args({vimgrep_arguments = { "rg", "-uu", "--with-filename", "--line-number", "--column", "--smart-case"} })<CR>') -- grep all files in current dir and below
vim.keymap.set("n", "<leader>gc", ':lua require("telescope").extensions.live_grep_args.live_grep_args({vimgrep_arguments = { "rg", "--with-filename", "--line-number", "--column", "--smart-case", "--type=c" } })<CR>') -- grep all c files in git project
vim.keymap.set("n", "<leader>gC", ':lua require("telescope").extensions.live_grep_args.live_grep_args({vimgrep_arguments = { "rg", "-uu", "--with-filename", "--line-number", "--column", "--smart-case", "--type=c" } })<CR>') -- grep all c files in current dir and below
vim.keymap.set("n", "<leader>gz", ':lua require("telescope").extensions.live_grep_args.live_grep_args({vimgrep_arguments = { "rg", "--with-filename", "--line-number", "--column", "--smart-case", "--type-add=bazel:*.bzl,BUILD,WORKSPACE", "--type=bazel" } })<CR>') -- grep all bazel files in git project
vim.keymap.set("n", "<leader>gZ", ':lua require("telescope").extensions.live_grep_args.live_grep_args({vimgrep_arguments = { "rg", "-uu", "--with-filename", "--line-number", "--column", "--smart-case", "--type-add=bazel:*.bzl,BUILD,WORKSPACE", "--type=bazel" } })<CR>') -- grep all bazel files in current dir and below
vim.keymap.set("n", "<leader>gs", ':lua require("telescope").extensions.live_grep_args.live_grep_args({vimgrep_arguments = { "rg", "--with-filename", "--line-number", "--column", "--smart-case", "--type=rs" } })<CR>') -- grep all rust files in git project
vim.keymap.set("n", "<leader>gS", ':lua require("telescope").extensions.live_grep_args.live_grep_args({vimgrep_arguments = { "rg", "-uu", "--with-filename", "--line-number", "--column", "--smart-case", "--type=rs" } })<CR>') -- grep all rust file in current dir and belows
vim.keymap.set("n", "<leader>gp", ':lua require("telescope").extensions.live_grep_args.live_grep_args({vimgrep_arguments = { "rg", "--with-filename", "--line-number", "--column", "--smart-case", "--type=py" } })<CR>') -- grep all .py files in git project
vim.keymap.set("n", "<leader>gP", ':lua require("telescope").extensions.live_grep_args.live_grep_args({vimgrep_arguments = { "rg", "-uu", "--with-filename", "--line-number", "--column", "--smart-case", "--type=py" } })<CR>') -- grep all .py file in current dir and belows
vim.keymap.set("n", "<leader>gl", ':lua require("telescope").extensions.live_grep_args.live_grep_args({vimgrep_arguments = { "rg", "--with-filename", "--line-number", "--column", "--smart-case", "--type=lua" } })<CR>') -- grep all lua files
vim.keymap.set("n", "<leader>go", ':lua require("telescope.builtin").live_grep({grep_open_files=true})<CR>')
-- vim.keymap.set("n", "<leader>go", ':lua require("telescope").extensions.live_grep_args.live_grep_args({ grep_open_files = true, vimgrep_arguments = { "rg", "--with-filename", "--line-number", "--column", "--smart-case"} })<CR>')
vim.keymap.set("n", "<leader>gy", ':Telescope neoclip extra=plus<CR>') -- get yanks
require('telescope').load_extension('fzf')

-- require('telescope').load_extension('neoclip')
