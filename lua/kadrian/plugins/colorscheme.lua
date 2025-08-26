return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				term_colors = true,
				transparent_background = true,
				integrations = {
					alpha = true,
					blink_cmp = true,
					diffview = true,
					nvimtree = true,
					cmp = true,
					mason = true,
					harpoon = true,
					gitsigns = true,
					fidget = true,
					telescope = true,
					lsp_trouble = true,
					which_key = true,
					treesitter = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
							ok = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
							ok = { "underline" },
						},
						inlay_hints = {
							background = true,
						},
					},
					indent_blankline = {
						enabled = true,
						scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
						colored_indent_levels = false,
					},
				},
				custom_highlights = function(C)
					return {
						BlinkCmpKind = { fg = C.base, bg = C.mauve },
					}
				end,
			})
			vim.cmd("colorscheme catppuccin")
		end,
	},
}
