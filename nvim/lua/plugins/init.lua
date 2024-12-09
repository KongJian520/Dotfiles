return {
  {
    "folke/lazy.nvim",
    dependencies = {
      "rcarriga/nvim-notify",
    },
  },
  -- 在这里导入所有插件模块
  require("plugins.lsp"),
  require("plugins.treesitter"),
  require("plugins.cmp"),
  require("plugins.telescope"),
  require("plugins.lualine"),
  require("plugins.mini-icons"),
  require("plugins.neo-tree"),
}
