return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = function()
			require("neogit").setup()
			Keymap("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit" })
			Keymap("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
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
			local gitsigns = require("gitsigns")
			gitsigns.setup()
			-- Keymap("n", "<leader>hb", function()
			-- 	gitsigns.blame_line({ full = true })
			-- end)
			-- Keymap("n", "<leader>tb", gitsigns.toggle_current_line_blame)
		end,
	},
}
