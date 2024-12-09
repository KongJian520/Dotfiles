return {
  -- lualine 配置放在最前面
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,    -- 设置为 false 使其立即加载
    priority = 1000, -- 确保它比其他插件先加载
  },
  
  {
    "folke/lazy.nvim",
    dependencies = {
      "rcarriga/nvim-notify",
    },
  },
  -- 在这里导入所有插件模块
  require("plugins.lsp"),
  require("plugins.lsp.python"),
  require("plugins.treesitter"),
  require("plugins.cmp"),
  require("plugins.telescope"),
  require("plugins.mini-icons"),
  require("plugins.neo-tree"),
  require("plugins.todo-comments"),
  require("plugins.mason"),
  require("plugins.null-ls"),
}
