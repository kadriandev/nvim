return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		Keymap("n", "<leader>ct", require("trouble").toggle, { desc = "Trouble" })
	end,
}
