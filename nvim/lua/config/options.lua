local opt = vim.opt

-- 关闭相对行号，使用绝对行号
opt.number = true
opt.relativenumber = false

-- 确保每次切换缓冲区时重新应用设置
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
	callback = function() end,
})

-- 禁用默认状态栏
vim.o.laststatus = 3 -- 使用全局状态栏
vim.o.showmode = false -- 禁用默认模式显示
vim.o.ruler = false -- 禁用默认的位置显示
vim.o.showcmd = false -- 禁用默认的命令显示
-- 禁用内置的文件浏览器
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- 配置诊断信息在插入模式下也显示
vim.diagnostic.config({
	update_in_insert = true,
})
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0