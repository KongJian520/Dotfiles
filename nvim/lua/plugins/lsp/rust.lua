return {
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		opts = {
			server = {
				on_attach = function(client, bufnr)
					-- 启用 inlay hints
					vim.lsp.inlay_hint.enable(bufnr, true)

					-- 键位绑定
					local opts = { noremap = true, silent = true, buffer = bufnr }
					vim.keymap.set("n", "<C-space>", "rust-tools.hover_actions.hover_actions", opts)
					vim.keymap.set("n", "<Leader>a", "rust-tools.code_action_group.code_action_group", opts)
				end,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			},
		},
	},
}
