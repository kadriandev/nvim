return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			term_colors = true,
			transparent_background = true,
			color_overrides = {
				mocha = {
					base = "#000000",
					mantle = "#000000",
					crust = "#000000",
				},
			},
			integrations = {
				alpha = true,
				nvimtree = true,
				cmp = true,
				mason = true,
				harpoon = true,
				telescope = true,
				lsp_trouble = true,
				which_key = true,
				treesitter = true,
				indent_blankline = {
					enabled = true,
					scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
					colored_indent_levels = false,
				},
			},
		})
	end,
}
