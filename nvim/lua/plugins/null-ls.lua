return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local null_ls = require("null-ls")
      return {
        autostart = true,
        sources = {
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.ruff,
          null_ls.builtins.diagnostics.ruff,
        },
      }
    end,
  }
} 