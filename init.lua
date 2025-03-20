package.path = package.path .. ";/Users/rgarbana/.config/nvim/?.lua"
require("plugins")
-- require("editorconfig")
vim.g.mapleader = " "
vim.o.showmode = false
vim.wo.number = true
vim.opt.list = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.breakindentopt="shift:-2"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.completeopt = 'menu,menuone'
vim.o.scrolloff = 8
-- Enable auto-indentation for new lines
-- vim.opt.autoindent = true
-- Convert tabs into spaces when typing a tab in insert mode
vim.opt.expandtab = true
-- Number of spaces a tab counts for when typing a tab in insert mode
vim.opt.softtabstop = 4
-- Number of spaces that a '\t' (tab) character in the file is presented as.
vim.opt.tabstop = 4
-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 4
-- Set the maximum width of text that can be inserted
vim.opt.textwidth = 100
-- Set maximum depth of fold nesting
vim.opt.foldnestmax = 1
-- Set the level of folding on opening a file. Aka everything is folded when opening a new file/buffer.
vim.opt.foldlevel = 1
-- Edit the text shown in folds. Here we show the first line in a fold, then '...' then the last line in a fold.
vim.opt.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').' ... '.trim(getline(v:foldend))]]

vim.cmd [[filetype plugin indent on]]
-- Enable smart indentation, which adjusts indent based on syntax
-- vim.opt.smartindent = true
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.opt_local.autoindent = true
        vim.opt_local.smartindent = false
    end
})
-- Auto-commands for C, C++ and header files
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"c", "cpp", "h"},
    callback = function()
        vim.opt_local.cindent = true
        vim.opt_local.cinoptions = ":0,g0,(0,w1"
        -- vim.opt_local.shiftwidth = 4
        -- vim.opt_local.tabstop = 4
        -- vim.opt_local.softtabstop = 4
        -- vim.opt_local.expandtab = true
    end
})



-- Source the cscope maps configuration from a specific file
-- vim.cmd('source ~/.config/nvim/cscope/cscope_maps.vim')

-- Map the F1 key to escape in normal mode. F1 key is very annoying so we're just disabling it and having it have the same functionality as the key we meant to press (esc).
vim.api.nvim_set_keymap('n', '<F1>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F1>', '<Esc>', { noremap = true })

-- easy window navigation. C-h means go 1 window to left, etc.
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, expr = false, silent = true })

-- Remap ;w to save and escape in insert mode.
vim.api.nvim_set_keymap('i', ';;', ';<Esc>:w<Enter>', {noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap('i', ';w', '<Esc>:w<Enter>', {noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap('n', '<leader>w', '<Esc>:w<Enter>', {noremap = true, expr = false, silent = true })
-- remember things yanked in a special register, so we can delete at will without concerns
vim.api.nvim_set_keymap('n', '<leader>p', '"0p', {noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap('n', '<leader>P', '"0P', {noremap = true, expr = false, silent = true })
-- often I want to find the next _
vim.api.nvim_set_keymap('o', 'W', 'f_', {noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap('n', 'W', 'f_l', {noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap('v', 'W', 'f_l', {noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap('o', 'E', 't_', {noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap('n', 'E', 'lt_', {noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap('v', 'E', 'lt_', {noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap('o', 'B', 'T_', {noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap('n', 'B', 'hT_', {noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap('v', 'B', 'hT_', {noremap = true, expr = false, silent = true })
-- In my mind, p means parentheses
vim.api.nvim_set_keymap('n', 'n', 'nzz', {noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzz', {noremap = true, expr = false, silent = true })
-- In my mind, p means parentheses
vim.api.nvim_set_keymap('o', 'p', 'i(', {noremap = true, expr = false, silent = true })

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({higroup="IncSearch", timeout=150})
    end
})

-- Toggle folds with z-space.
-- vim.api.nvim_set_keymap('n', '<leader>z', 'za', {noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap('n', 'z<space>', 'za', {noremap = true, expr = false, silent = true })

-- Copy to system clipboard with leader + y
vim.api.nvim_set_keymap('v', '<leader>y', '"+y :let @*=@+<Enter>', {noremap = true, expr = false, silent = true })

-- Clear the highlighting
vim.api.nvim_set_keymap('n', '<Esc>', '<Esc>:noh<Enter>', {noremap = true, expr = false, silent = true })

-- leader-leader for commenting
vim.api.nvim_set_keymap('n', '<leader><leader>', 'gcc', {noremap = false, expr = false, silent = false })
vim.api.nvim_set_keymap('v', '<leader><leader>', 'gc', {noremap = false, expr = false, silent = false })
vim.api.nvim_set_keymap('n', 'q:', '<nop>', {noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap('n', 'Q', '<nop>', {noremap = true, expr = false, silent = true })

-- Don't comment next line when making a newline after a commented line.
-- Create an augroup to ensure the autocmd doesn't get duplicated
vim.api.nvim_create_augroup("MyAutoCmds", { clear = true })
-- Set formatoptions in an autocmd that runs after VimEnter
vim.api.nvim_create_autocmd("VimEnter", {
    group = "MyAutoCmds",
    pattern = "*",
    callback = function()
        vim.opt.formatoptions:remove('c')
        vim.opt.formatoptions:remove('o')
        vim.opt.formatoptions:remove('r')
    end
})

-- vim.api.nvim_set_keymap('c', '<M-Left>', '<Home>', {noremap = true})
-- vim.api.nvim_set_keymap('c', '<M-Right>', '<End>', {noremap = true})
-- vim.api.nvim_set_keymap('c', '<M-Left>', '<C-Left>', {noremap = true})
-- vim.api.nvim_set_keymap('c', '<M-Right>', '<C-Right>', {noremap = true})
-- vim.api.nvim_set_keymap('c', '<C-Left>', '<C-Left>', {noremap = true})
-- vim.api.nvim_set_keymap('c', '<C-Right>', '<C-Right>', {noremap = true})
vim.api.nvim_set_keymap('c', '<S-Left>', '<C-Left>', {noremap = true})
vim.api.nvim_set_keymap('c', '<S-Right>', '<C-Right>', {noremap = true})
-- vim.api.nvim_set_keymap('c', '<A-Left>', '<C-Left>', {noremap = true})
-- vim.api.nvim_set_keymap('c', '<A-Right>', '<C-Right>', {noremap = true})

-- Function to copy the relative file path to the clipboard
local function copy_relative_path()
  local file_path = vim.fn.expand('%')
  if file_path ~= '' then
    vim.fn.setreg('+', file_path)
    print('Copied relative file path: ' .. file_path)
  else
    print('No file path available')
  end
end

-- Create a command that calls the function
vim.api.nvim_create_user_command('CopyRelativePath', copy_relative_path, {})

-- Set up the keymap to copy the relative file path
vim.api.nvim_set_keymap('n', '<leader>cf', ':CopyRelativePath<CR>', { noremap = true, silent = true })


-- -- Define the function to insert print statements
-- local function insert_print_statement()
--     local filetype = vim.bo.filetype
--     local word = vim.fn.getreg('"')  -- Get the contents of the yank register
--
--     local print_statement = ""
--
--     if filetype == "rust" then
--         print_statement = string.format('println!("%s = {:?}", %s);', word, word)
--     elseif filetype == "python" then
--         print_statement = string.format('print(f"%s={}")', word)
--     elseif filetype == "c" or filetype == "cpp" then
--         print_statement = string.format('printf("%s = %%p\\n", %s);', word, word)
--     else
--         print("Unsupported file type for print macro")
--         return
--     end
--
--     -- Insert the print statement below the current line
--     vim.api.nvim_put({print_statement}, 'l', true, true)
-- end
--
-- -- create a command that calls the function
-- vim.api.nvim_create_user_command('InsertPrintStatement', insert_print_statement, {})
--
-- -- Set up the keymap to insert the print statement
-- vim.api.nvim_set_keymap('n', '<leader>cp', ':InsertPrintStatement<CR>', { noremap = true, silent = true })

-- Define the function to insert print statements
local function insert_print_statement()
    local filetype = vim.bo.filetype
    local word = vim.fn.getreg('"')  -- Get the contents of the yank register
    local print_statement = ""

    if filetype == "rust" then
        print_statement = string.format('println!("%s = {:?}", %s);', word, word)
    elseif filetype == "python" then
        print_statement = string.format('print(f"%s={}")', word)
    elseif filetype == "c" or filetype == "cpp" then
        print_statement = string.format('printf("%s = %%p\\n", %s);', word, word)
    else
        print("Unsupported file type for print macro")
        return
    end

    -- Get the current line's indentation
    local current_line = vim.fn.line('.')
    local current_indent = vim.fn.indent(current_line)

    -- Create the new line with the same indentation
    local indented_print_statement = string.rep(' ', current_indent) .. print_statement

    -- Insert the print statement below the current line
    vim.api.nvim_buf_set_lines(0, current_line, current_line, false, {indented_print_statement})
end

-- Create a command that calls the function
vim.api.nvim_create_user_command('InsertPrintStatement', insert_print_statement, {})

-- Set up the keymap to insert the print statement
vim.api.nvim_set_keymap('n', '<leader>cp', ':InsertPrintStatement<CR>', { noremap = true, silent = true })

