-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		requires = {
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
			{'nvim-lua/plenary.nvim'},
			{'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
		},
		extensions = {
			fzf = {
				fuzzy = true,                    -- false will only do exact matching
				override_generic_sorter = true,  -- override the generic sorter
				override_file_sorter = true,     -- override the file sorter
				case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			}
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
		end
	}
	-- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use 'navarasu/onedark.nvim'
	use 'nvim-treesitter/playground'
	use 'theprimeagen/harpoon'
	use 'mbbill/undotree'
	use "ggandor/leap.nvim"
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			-- Uncomment these if you want to manage LSP servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-path'},
			{'L3MON4D3/LuaSnip'},
		}
	}
	use {
		"AckslD/nvim-neoclip.lua",
		requires = {
			{'nvim-telescope/telescope.nvim'},
		},
		config = function()
			require('neoclip').setup({
				history = 100,
				enable_persistent_history = false,
				length_limit = 1048576,
				continuous_sync = false,
				db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
				filter = nil,
				preview = true,
				prompt = nil,
				default_register = '"', 'plus',
				default_register_macros = 'q',
				enable_macro_history = true,
				content_spec_column = false,
				disable_keycodes_parsing = false,
				on_select = {
					move_to_front = false,
					close_telescope = true,
				},
				on_paste = {
					set_reg = false,
					move_to_front = false,
					close_telescope = true,
				},
				on_replay = {
					set_reg = false,
					move_to_front = false,
					close_telescope = true,
				},
				on_custom_action = {
					close_telescope = true,
				},
				keys = {
					telescope = {
						i = {
							select = '<cr>',
							paste = '<c-p>',
							paste_behind = '<c-k>',
							replay = '<c-q>',  -- replay a macro
							delete = '<c-d>',  -- delete an entry
							edit = '<c-e>',  -- edit an entry
							custom = {},
						},
						n = {
							select = '<cr>',
							paste = 'p',
							--- It is possible to map to more than one key.
							-- paste = { 'p', '<c-p>' },
							paste_behind = 'P',
							replay = 'q',
							delete = 'd',
							edit = 'e',
							custom = {},
						},
					},
					fzf = {
						select = 'default',
						paste = 'ctrl-p',
						paste_behind = 'ctrl-k',
						custom = {},
					},
				},
			})
		end,	
	}
	use 'tpope/vim-fugitive'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
end)
