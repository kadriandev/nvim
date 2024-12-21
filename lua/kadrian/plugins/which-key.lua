return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		ignore_missing = true,
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>c", group = "Code" },
			{ "<leader>cs", group = "Snippets" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>q", group = "which_key_ignore" },
			{ "<leader>t", group = "Terminal" },
			{ "<leader>u", group = "Toggles" },
		})
	end,
}
