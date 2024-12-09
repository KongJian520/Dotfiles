return {
  {
    "hrsh7th/nvim-cmp",
    version = false, -- 最新版本
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",    -- LSP 补全源
      "hrsh7th/cmp-buffer",      -- 缓冲区补全源
      "hrsh7th/cmp-path",        -- 路径补全源
      "L3MON4D3/LuaSnip",        -- 片段引擎
      "saadparwaiz1/cmp_luasnip" -- LuaSnip 的补全源
    },
    opts = function()
      -- 添加高亮设置
      local highlights = {
        PmenuSel = { bg = "#282C34", fg = "NONE" },
        Pmenu = { fg = "#C5CDD9", bg = "#22252A" },
        CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", strikethrough = true },
        CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", bold = true },
        CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", bold = true },
        CmpItemMenu = { fg = "#C792EA", bg = "NONE", italic = true },
        CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
        CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
        CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },
        CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
        CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
        CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },
        CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
        CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
        CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },
        CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
        CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
        CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
        CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
        CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },
        CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
        CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },
        CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
        CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
        CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },
        CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
        CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
        CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },
        CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
        CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
        CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
      }

      -- 应用高亮设置
      for group, hl in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, hl)
      end

      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      local auto_select = true

      return {
        auto_brackets = { "python" }, -- 在 Python 中启用自动括号补全
        completion = {
          completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
        },
        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = auto_select }),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
          ["<tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, item)
            local icons = {
              Text = '  ',
              Method = '  ',
              Function = '  ',
              Constructor = '  ',
              Field = '  ',
              Variable = '  ',
              Class = '  ',
              Interface = '  ',
              Module = '  ',
              Property = '  ',
              Unit = '  ',
              Value = '  ',
              Enum = '  ',
              Keyword = '  ',
              Snippet = '  ',
              Color = '  ',
              File = '  ',
              Reference = '  ',
              Folder = '  ',
              EnumMember = '  ',
              Constant = '  ',
              Struct = '  ',
              Event = '  ',
              Operator = '  ',
              TypeParameter = '  ',
            }
            local kind_text = item.kind
            item.kind = (icons[item.kind] or '')
            item.menu = "    (" .. kind_text .. ")"
            return item
          end,
        },
        experimental = {
          ghost_text = vim.g.ai_cmp and {
            hl_group = "CmpGhostText",
          } or false,
        },
        sorting = defaults.sorting,
        window = {
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
          },
        },
        view = {
          entries = { name = 'custom', selection_order = 'near_cursor' }
        },
      }
    end,
  },
}