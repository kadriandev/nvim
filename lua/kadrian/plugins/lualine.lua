return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"letieu/harpoon-lualine",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
			},
			sections = {
				lualine_x = {
					{
						"harpoon2",
						indicators = { "1", "2", "3", "4" },
						color_active = { fg = "#00ff00" },
						_separator = " ",
						no_harpoon = "Harpoon not loaded",
					},
				},
			},
			extentions = { "oil", "trouble" },
		})
	end,
}
