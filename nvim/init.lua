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

-- 设置当打开目录时自动打开 nvim-tree
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    local arg = vim.api.nvim_get_vvar("argv")
    if vim.fn.isdirectory(arg[1]) == 1 then
      vim.cmd("cd " .. arg[1])
      require("nvim-tree.api").tree.open()
    end
  end
})

-- 初始化 lazy.nvim
require("lazy").setup("plugins", {
  performance = {
    rtp = {
      reset = false,
    },
  },
})