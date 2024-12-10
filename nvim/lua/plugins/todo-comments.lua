return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "TodoTrouble", "TodoTelescope" },
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		-- 配置关键字
		keywords = {
			FIX = {
				icon = " ", -- 用于标识修复问题的图标
				color = "error", -- 可以是颜色名称或十六进制值
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- 同义词列表
			},
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
			TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
		},
		-- 配置颜色
		colors = {
			error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
			warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
			info = { "DiagnosticInfo", "#2563EB" },
			hint = { "DiagnosticHint", "#10B981" },
			default = { "Identifier", "#7C3AED" },
			test = { "Identifier", "#FF00FF" },
		},
	},
  -- stylua: ignore
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "下一个待办事项" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "上一个待办事项" },
    { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "待办事项 (Trouble)" },
    { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "待办/修复/待修复 (Trouble)" },
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "待办事项" },
    { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "待办/修复/待修复" },
  },
}
