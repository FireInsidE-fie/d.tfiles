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
			    mail = "your@email.com", -- Your mail.
			    -- add other options.
			  },
			config = function(_, opts)
		    	require("42header").setup(opts)
			end,
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
