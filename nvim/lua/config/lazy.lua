-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
			-- import your plugins
		{
			'tpope/vim-sleuth'
		},
		{ -- Useful plugin to show you pending keybinds.
			'folke/which-key.nvim',
			event = 'VimEnter', -- Sets the loading event to 'VimEnter'
			opts = {
			  icons = {
				-- set icon mappings to true if you have a Nerd Font
				mappings = vim.g.have_nerd_font,
				-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
				-- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
				keys = vim.g.have_nerd_font and {} or {
				  Up = '<Up> ',
				  Down = '<Down> ',
				  Left = '<Left> ',
				  Right = '<Right> ',
				  C = '<C-…> ',
				  M = '<M-…> ',
				  D = '<D-…> ',
				  S = '<S-…> ',
				  CR = '<CR> ',
				  Esc = '<Esc> ',
				  ScrollWheelDown = '<ScrollWheelDown> ',
				  ScrollWheelUp = '<ScrollWheelUp> ',
				  NL = '<NL> ',
				  BS = '<BS> ',
				  Space = '<Space> ',
				  Tab = '<Tab> ',
				  F1 = '<F1>',
				  F2 = '<F2>',
				  F3 = '<F3>',
				  F4 = '<F4>',
					  F5 = '<F5>',
					  F6 = '<F6>',
					  F7 = '<F7>',
					  F8 = '<F8>',
					  F9 = '<F9>',
					  F10 = '<F10>',
					  F11 = '<F11>',
					  F12 = '<F12>',
					},
				  },
			  -- Document existing key chains
			  spec = {
				{ '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
				{ '<leader>d', group = '[D]ocument' },
				{ '<leader>r', group = '[R]ename' },
				{ '<leader>s', group = '[S]earch' },
				{ '<leader>w', group = '[W]orkspace' },
				{ '<leader>t', group = '[T]oggle' },
				{ '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
			  },
			},
		},
		{
			"nvim-lua/plenary.nvim",
		},
		{
			"nvim-tree/nvim-web-devicons",
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
		},
		{
			'nvim-lualine/lualine.nvim',
			dependencies = { 'nvim-tree/nvim-web-devicons' }
		},
		{
			"catppuccin/nvim", name = "catppuccin", priority = 1000
		},
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
				-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		}
		},
		{
			'nvim-telescope/telescope.nvim', branch = '0.1.x',
			dependencies = { 'nvim-lua/plenary.nvim' }

		},
		{
			"lewis6991/gitsigns.nvim",
			dependencies = {
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
		},
		},
		{
			"hrsh7th/nvim-cmp"
		},
		{
        	"xiyaowong/transparent.nvim"
		},
		{
			"Diogo-ss/42-header.nvim",
			cmd = { "Stdheader" },
  			keys = { "<F1>" },
			  opts = {
			    default_map = true, -- Default mapping <F1> in normal mode.
			    auto_update = true, -- Update header when saving.
			    user = "estettle", -- Your user.
			    mail = "estettle@student.42lausanne.ch", -- Your mail.
			    -- add other options.
			  },
			config = function(_, opts)
		    	require("42header").setup(opts)
			end,
		},
		{'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},
		{'neovim/nvim-lspconfig'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/nvim-cmp'},
		{"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
		},
		{ "sitiom/nvim-numbertoggle" },
		{
			"danymat/neogen",
			config = true,
			-- Uncomment next line if you want to follow only stable versions
			-- version = "*"
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
