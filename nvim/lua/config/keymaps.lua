local map = vim.keymap.set

-- 设置 leader 键
vim.g.mapleader = " "

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
