local map = vim.keymap.set

-- 设置 leader 键
vim.g.mapleader = " "

-- 基础快捷键
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })