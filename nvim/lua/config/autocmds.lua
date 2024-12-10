local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- 自动命令配置
augroup("FileTypeSpecific", { clear = true })
autocmd("FileType", {
	group = "FileTypeSpecific",
	pattern = { "lua", "rust" },
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.shiftwidth = 2
	end,
})
