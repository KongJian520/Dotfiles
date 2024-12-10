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

-- which-key 快捷键
map("n", "<leader>?", function()
	require("which-key").show({ global = false })
end, { desc = "Buffer Keymaps (which-key)" })

map("n", "<c-w><space>", function()
	require("which-key").show({ keys = "<c-w>", loop = true })
end, { desc = "Window Hydra Mode (which-key)" })

-- 自定义快捷键
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "浮动终端" })
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "水平终端" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "垂直终端" })

-- todo-comments 快捷键
map("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "下一个待办事项" })
map("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "上一个待办事项" })
map("n", "<leader>xt", "<cmd>TodoTrouble<cr>", { desc = "待办事项 (Trouble)" })
map("n", "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", { desc = "待办/修复/待修复 (Trouble)" })
map("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "待办事项" })
map("n", "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", { desc = "待办/修复/待修复" })

-- Telescope 快捷键
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })

-- Noice 快捷键
-- map("n", "<leader>sn", "", { desc = "+noice" })
-- map("c", "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, { desc = "Redirect Cmdline" })
-- map("n", "<leader>snl", function() require("noice").cmd("last") end, { desc = "Noice Last Message" })
-- map("n", "<leader>snh", function() require("noice").cmd("history") end, { desc = "Noice History" })
-- map("n", "<leader>sna", function() require("noice").cmd("all") end, { desc = "Noice All" })
-- map("n", "<leader>snd", function() require("noice").cmd("dismiss") end, { desc = "Dismiss All" })
-- map("n", "<leader>snt", function() require("noice").cmd("pick") end, { desc = "Noice Picker (Telescope/FzfLua)" })
-- map({ "i", "n", "s" }, "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, { silent = true, expr = true, desc = "Scroll Forward" })
-- map({ "i", "n", "s" }, "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, { silent = true, expr = true, desc = "Scroll Backward" })

-- Neo-tree 快捷键
map("n", "<leader>e", function()
	require("neo-tree.command").execute({ toggle = true })
end, { desc = "打开文件树" })

map("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Mason" })

-- BufferLine 快捷键
map("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "切换固定状态" })
map("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", { desc = "关闭未固定缓冲区" })
map("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { desc = "关闭右侧缓冲区" })
map("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "关闭左侧缓冲区" })
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "上一个缓冲区" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "下一个缓冲区" })
map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "上一个缓冲区" })
map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "下一个缓冲区" })
map("n", "[B", "<cmd>BufferLineMovePrev<cr>", { desc = "向左移动缓冲区" })
map("n", "]B", "<cmd>BufferLineMoveNext<cr>", { desc = "向右移动缓冲区" })
