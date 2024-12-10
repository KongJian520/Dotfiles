return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				pyright = {
					settings = {
						python = {
							analysis = {
								typeCheckingMode = "basic",
								diagnosticMode = "workspace",
								inlayHints = {
									variableTypes = true,
									functionReturnTypes = true,
								},
							},
						},
					},
				},
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "python" })
			end
		end,
	},
	{
		"mfussenegger/nvim-dap",
		optional = true,
		dependencies = {
			"mfussenegger/nvim-dap-python",
			config = function()
				require("dap-python").setup("python")
			end,
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = { "pyright", "black", "ruff" },
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "pyright" },
		},
	},
}
