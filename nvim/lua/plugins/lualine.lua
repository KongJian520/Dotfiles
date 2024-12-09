return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local colors = require("config.color").colors
    local mode_colors = require("config.color").mode_colors

    -- 自定义主题
    local custom_theme = {
      normal = {
        a = { fg = colors.dark, bg = colors.normal, gui = "bold" },
        b = { fg = colors.fg, bg = colors.gray },
        c = { fg = colors.fg, bg = colors.bg },
      },
      insert = {
        a = { fg = colors.dark, bg = colors.insert, gui = "bold" },
      },
      visual = {
        a = { fg = colors.dark, bg = colors.visual, gui = "bold" },
      },
      replace = {
        a = { fg = colors.dark, bg = colors.replace, gui = "bold" },
      },
      command = {
        a = { fg = colors.dark, bg = colors.command, gui = "bold" },
      },
      inactive = {
        a = { fg = colors.fg, bg = colors.bg },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
      },
    }

    local icons = {
      diagnostics = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
      },
      git = {
        added = "+",
        modified = "~",
        removed = "-",
      },
    }

    vim.o.laststatus = vim.g.lualine_laststatus

    local opts = {
      options = {
        theme = custom_theme,
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        component_separators = { left = "", right = " " },
        section_separators = { left = "", right = " " },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1 },
        },
        lualine_x = {
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
          },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
      extensions = { "neo-tree", "lazy" },
    }

    return opts
  end,
}