local map = vim.keymap.set

-- 设置 leader 键
vim.g.mapleader = " "

-- 窗口控制快捷键
-- Ctrl + hjkl 切换窗口焦点
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })

-- Alt + hjkl 调整窗口位置
map("n", "<A-h>", "<C-w>H", { desc = "Move window to the left" })
map("n", "<A-l>", "<C-w>L", { desc = "Move window to the right" })
map("n", "<A-j>", "<C-w>J", { desc = "Move window to the bottom" })
map("n", "<A-k>", "<C-w>K", { desc = "Move window to the top" })

-- Ctrl + Shift + hjkl 调整窗口大小
map("n", "<C-S-h>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-S-l>", ":vertical resize +2<CR>", { desc = "Increase window width" })
map("n", "<C-S-j>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-S-k>", ":resize -2<CR>", { desc = "Decrease window height" })
-- 基础快捷键
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })