return {
    {
      "nvim-tree/nvim-tree.lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "打开文件树" },
      },
      init = function()
        -- 在启动时自动打开文件树
        vim.api.nvim_create_autocmd({ "VimEnter" }, {
          callback = function()
            require("nvim-tree.api").tree.open()
          end
        })
      end,
      opts = {
        sort_by = "case_sensitive",
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true
        },
      },
    },
  }