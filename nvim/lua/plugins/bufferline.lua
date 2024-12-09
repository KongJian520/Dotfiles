return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  keys = {
    -- 快捷键配置
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "切换固定状态" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "关闭未固定缓冲区" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "关闭右侧缓冲区" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "关闭左侧缓冲区" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "上一个缓冲区" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "下一个缓冲区" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "上一个缓冲区" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "下一个缓冲区" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "向左移动缓冲区" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "向右移动缓冲区" },
  },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      diagnostics_indicator = function(_, _, diag)
        local icons = {
          Error = " ",
          Warn = " ",
          Info = " ",
        }
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
} 