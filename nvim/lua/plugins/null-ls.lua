return {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
        local nls = require("null-ls")
        opts.sources = opts.sources or {}
        vim.list_extend(opts.sources, {
            nls.builtins.formatting.black,
            nls.builtins.formatting.ruff,
            nls.builtins.diagnostics.ruff,
        })
    end,
}
