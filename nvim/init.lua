-- 基础设置
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

-- 加载基础配置
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- 禁用内置的文件浏览器
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 初始化 lazy.nvim
require("lazy").setup("plugins", {
  performance = {
    rtp = {
      reset = false,
    },
  },
})
