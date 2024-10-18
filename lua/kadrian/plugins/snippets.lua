return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	dependencies = {
		"nvim-telescope/telescope.nvim", -- optional
		"chrisgrieser/nvim-scissors",
	},
	config = function()
		require("scissors").setup({
			snippetDir = "~/.config/nvim/lua/kadrian/snippets",
			jsonFormatter = "jq",
			telescope = {
				alsoSearchSnippetBody = true,
			},
			editSnippetPopup = {
				height = 0.4, -- relative to the window, number between 0 and 1
				width = 0.6,
				border = "rounded",
				keymaps = {
					cancel = "q",
					saveChanges = "<CR>", -- alternatively, can also use `:w`
					duplicateSnippet = "<C-d>",
					goBackToSearch = "<BS>",
					deleteSnippet = "<C-x>",
					openInFile = "<C-o>",
					insertNextPlaceholder = "<C-t>", -- insert & normal mode
				},
			},
		})
		require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/lua/kadrian/snippets" } })
		-- When used in visual mode prefills the selection as body.
		Keymap({ "n", "x" }, "<leader>sa", function()
			require("scissors").addNewSnippet()
		end, { desc = "Add Snippet" })
		Keymap("n", "<leader>se", function()
			require("scissors").editSnippet()
		end, { desc = "Edit Snippet" })
	end,
}
