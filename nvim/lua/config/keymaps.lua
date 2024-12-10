local map = vim.keymap.set
-- 设置 leader 键
vim.g.mapleader = " "
-- 禁用 q: 快捷键
map("n", "q:", "<nop>", { silent = true })
-- 禁用命令行窗口中的 Ctrl-F
map("c", "<C-f>", "<nop>", { silent = true })
-- 窗口控制快捷键
-- Ctrl + 方向键切换窗口焦点
map("n", "<C-Left>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-Right>", "<C-w>l", { desc = "Go to right window" })
map("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window" })

-- Alt + 方向键调整窗口位置
map("n", "<A-Left>", "<C-w>H", { desc = "Move window to the left" })
map("n", "<A-Right>", "<C-w>L", { desc = "Move window to the right" })
map("n", "<A-Down>", "<C-w>J", { desc = "Move window to the bottom" })
map("n", "<A-Up>", "<C-w>K", { desc = "Move window to the top" })

-- Ctrl + Shift + 方向键调整窗口大小
map("n", "<A-S-Right>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<A-S-Left>", ":vertical resize +2<CR>", { desc = "Increase window width" })
map("n", "<A-S-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<A-S-Down>", ":resize -2<CR>", { desc = "Decrease window height" })

-- 基础快捷键
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- LSP 按键绑定
local lsp_opts = { noremap = true, silent = true }
map("n", "gD", vim.lsp.buf.declaration, lsp_opts)
map("n", "gd", vim.lsp.buf.definition, lsp_opts)
map("n", "K", vim.lsp.buf.hover, lsp_opts)
map("n", "gi", vim.lsp.buf.implementation, lsp_opts)
map("n", "<C-k>", vim.lsp.buf.signature_help, lsp_opts)
map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, lsp_opts)
map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, lsp_opts)
map("n", "<space>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, lsp_opts)
map("n", "<space>D", vim.lsp.buf.type_definition, lsp_opts)
map("n", "<space>rn", vim.lsp.buf.rename, lsp_opts)
map("n", "<space>ca", vim.lsp.buf.code_action, lsp_opts)
map("n", "gr", vim.lsp.buf.references, lsp_opts)
