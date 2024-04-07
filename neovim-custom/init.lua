local lazypath = vim.fn.stdpath("data") .. "/lazy"
if not vim.loop.fs_stat(lazypath) then
	vim.notify("[!] Lazy plugin not found")
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"tomasiser/vim-code-dark",
		lazy=false,
		priority=1000,
		config = function()
			vim.cmd([[colorscheme codedark]])
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
		  vim.o.timeout = true
		  vim.o.timeoutlen = 300
		end,
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
	},
	{
    		"nvim-neo-tree/neo-tree.nvim",
    		dependencies = {
      			"nvim-lua/plenary.nvim",
  			"nvim-tree/nvim-web-devicons",
      			"MunifTanjim/nui.nvim",
      		},
	},
	{
		"akinsho/toggleterm.nvim",

	},
	{
		'romgrk/barbar.nvim',
    		dependencies = {
            		'nvim-tree/nvim-web-devicons',
		},
    		init = function() vim.g.barbar_auto_setup = false end,
    		opts = {
			animation = true,
    		},

	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	{
		"neovim/nvim-lspconfig",
	},
}

local opts = {}

require("lazy").setup(plugins, opts)

require("nvim-web-devicons")
require("lspconfig").pyright.setup{}
require("toggleterm").setup()

vim.cmd(":set number")
vim.cmd(":set modifiable")
