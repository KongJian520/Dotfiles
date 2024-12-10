return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		cmd = "Telescope",
		opts = {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
			},
		},
	},
}
