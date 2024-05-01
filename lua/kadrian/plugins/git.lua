return {
	{
		"tpope/vim-fugitive",
		config = function()
			Keymap("n", "<leader>gg", "<cmd>G<cr>", { desc = "Open Git" })
			Keymap("n", "<leader>gs", "<cmd>G status<cr>", { desc = "Status" })
			Keymap("n", "<leader>gp", "<cmd>G push<cr>", { desc = "Push" })
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
