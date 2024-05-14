return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local width = 80
		local height = 30
		require("oil").setup({
			float = {
				padding = 0,
				max_width = width,
				max_height = height,
			},
			use_default_keymaps = false,
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<esc>"] = "actions.close",
				["<C-s>"] = "actions.select_vsplit",
				["<C-l>"] = "actions.refresh",
				["."] = "actions.parent",
				["/"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["gh"] = "actions.toggle_hidden",
			},
			view_options = {
				is_hidden_file = function(name, bufnr)
					return vim.startswith(name, ".") and not string.match(name, ".env*")
				end,
				is_always_hidden = function(name, _)
					return name == ".DS_Store"
				end,
			},
		})

		Keymap("n", "<leader>e", "<cmd>Oil<cr>", { desc = "which_key_ignore" })
	end,
}
