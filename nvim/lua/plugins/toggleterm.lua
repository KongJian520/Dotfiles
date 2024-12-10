return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      -- 设置终端的默认配置
      size = 20,
      open_mapping = [[<c-\>]], -- 使用 Ctrl+\ 打开终端
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float", -- 可选值: vertical | horizontal | tab | float
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
    keys = {
      -- 自定义快捷键
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "浮动终端" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "水平终端" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "垂直终端" },
    },
  }
}
