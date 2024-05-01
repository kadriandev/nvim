return {
	{
		"tpope/vim-fugitive",
		config = function()
			Keymap("n", "<leader>gg", "<cmd>Git<cr>", { desc = "Open Git" })
		end,
	},
	{
		"FabijanZulj/blame.nvim",
		config = function()
			require("blame").setup()
			Keymap("n", "<leader>gb", "<cmd>BlameToggle<cr>", { desc = "Toggle Git Blame" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			Keymap("n", "<leader>gdo", "<cmd>DiffviewOpen<cr>", { desc = "Open" })
			Keymap("n", "<leader>gdc", "<cmd>DiffviewClose<cr>", { desc = "Close" })
		end,
	},
}
