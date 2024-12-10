return {
	-- 导入 lazy.nvim 配置
	require("plugins.lazy"),
	-- 在这里导入所有插件模块
	require("plugins.noice"),
	require("plugins.which-key"),
	require("plugins.todo-comments"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.cmp"),
	require("plugins.lsp"),
	require("plugins.mason"),
	require("plugins.none-ls"),
	require("plugins.null-ls")
}
