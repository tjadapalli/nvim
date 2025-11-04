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

require("lazy").setup({
	spec = {
		-- Add new plugins here...
		-- XXX: Remore /after and move all plugins to config/plugin and
		-- import them here
		-- XXXX: Reformat all the lua files.
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"folke/tokyonight.nvim",
		{
			"rose-pine/neovim",
			name = "rose-pine",
			config = function()
				vim.cmd("colorscheme rose-pine")
			end
		},
		{
			"nvim-treesitter/nvim-treesitter", 
			branch = 'master',
			lazy = false, 
			build = ":TSUpdate"
		},
		"ThePrimeagen/vim-be-good",
		"ThePrimeagen/harpoon",
		"mbbill/undotree",
		"tpope/vim-fugitive",
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		-- lazy = false,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	install = {},
	checker = {
		enabled = true, -- check for plugin updates periodically
		notify = true, -- notify on update
	}, -- automatically check for plugin updates
	performance = {
		-- Learn about this later
	},
})

