return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconfig").clangd.setup({
                on_attach = function(client, bufnr)
                    -- 你的 on_attach 配置
                end,
                capabilities = vim.lsp.protocol.make_client_capabilities(),
            })
        end,
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "neovim/nvim-lspconfig",
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.diagnostics.ruff,
                    null_ls.builtins.formatting.ruff,
                },
            })
        end,
    },
    require("plugins.lsp.clangd")
}
