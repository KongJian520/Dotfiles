return {
	-- 导入 lazy.nvim 配置
	require("plugins.lazy"),
	-- 在这里导入所有插件模块
	require("plugins.lualine"),
	require("plugins.lsp"),
	require("plugins.lsp.python"),
	require("plugins.treesitter"),
	require("plugins.cmp"),
	require("plugins.telescope"),
	require("plugins.mini-icons"),
	require("plugins.neo-tree"),
	require("plugins.todo-comments"),
	require("plugins.mason"),
	require("plugins.null_ls"),
	require("plugins.which-key"),
	require("plugins.gitsigns"),
	require("plugins.nui"),
	require("plugins.noice"),
	require("plugins.snacks"),
}
