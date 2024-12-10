-- 加载基础配置
require("config.options")
require("config.keymaps")
require("config.autocmds")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins", {
	performance = {
		rtp = {
			reset = false,
		},
	},
})
require("plugins.ui")
require("plugins")

