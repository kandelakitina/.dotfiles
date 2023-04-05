-- Bootstrapping Packer (self install if not installed)
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Package managers
	use("wbthomason/packer.nvim")
	use("williamboman/mason.nvim")

	-- Color themes
	-- use 'ellisonleao/gruvbox.nvim'
	use("rebelot/kanagawa.nvim")

	-- remove background
	use("xiyaowong/transparent.nvim")

	-- File explorer
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})
	use("airblade/vim-rooter") -- autochange project root if there's git

	-- zk lsp plugin
	use("mickael-menu/zk-nvim")

	-- Windows picker
	use({
		"s1n7ax/nvim-window-picker",
		tag = "v1.*",
	})

	-- -- Auto resize windows
	-- use({
	-- 	"anuvyklack/windows.nvim",
	-- 	requires = {
	--
	-- 		"anuvyklack/animation.nvim",
	-- 	},
	-- 	config = function()
	-- 		vim.o.winwidth = 10
	-- 		vim.o.winminwidth = 10
	-- 		vim.o.equalalways = false
	-- 		require("windows").setup()
	-- 	end,
	-- })

	-- Git
	use("kdheepak/lazygit.nvim")
	use("lewis6991/gitsigns.nvim")

	-- Usability
	use("nvim-lualine/lualine.nvim")
	use("tpope/vim-unimpaired")
	use("tpope/vim-sleuth")
	use("tpope/vim-repeat")
	use("kylechui/nvim-surround")
	use("fedepujol/move.nvim")
	use({ "phaazon/hop.nvim", branch = "v2" })
	use("famiu/bufdelete.nvim")

	-- Colorizer and color picker
	use("uga-rosa/ccc.nvim")

	-- Highlights range, entered into command line
	use({
		"winston0410/range-highlight.nvim",
		requires = "winston0410/cmd-parser.nvim",
		config = function()
			require("range-highlight").setup()
		end,
	})

	-- Firenvim (Nvim in the Browser)
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	-- Registers menu
	use("tversteeg/registers.nvim")

	-- Comment
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Web server
	use({
		"turbio/bracey.vim",
		run = "npm install --prefix server",
	})

	-- Autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})

	-- Visuals
	use("nvim-tree/nvim-web-devicons")
	use({
		"akinsho/bufferline.nvim",
		tag = "v3.*",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup()
		end,
	})

	-- LSP and grammar
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	})
	use({ "glepnir/lspsaga.nvim", branch = "main" })

	-- Formatting and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	use("nvim-treesitter/nvim-treesitter")
	use({
		-- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	})

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-buffer")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- use {
	--   'nvim-telescope/telescope-fzf-native.nvim',
	--   run = "make"
	-- }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
