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
		wk.register({
			f = { name = "Find" },
			t = { name = "Terminal" },
			c = { name = "Code" },
			d = { name = "Diff View" },
			s = { name = "Snippets" },
			n = { name = "Noice" },
			q = { name = "which_key_ignore" },
		}, { prefix = "<leader>" })
	end,
}
