return {
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			{ "<leader>uo", "<cmd>Outline<CR>", desc = "Toggle Outline" },
		},
		opts = {
			-- Your setup opts here
		},
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({
				notification = {
					window = {
						winblend = 0,
					},
				},
			})
		end,
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = { -- set to setup table
		},
		config = function()
			require("colorizer").setup()
		end,
	},
	{ "MunifTanjim/nui.nvim" },
	{ "OlegGulevskyy/better-ts-errors.nvim" },
}
