return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"debugloop/telescope-undo.nvim",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "^./.git/", "^node_modules/" },
			},
			pickers = {
				buffers = {
					show_all_buffers = true,
					sort_mru = true,
					mappings = {
						i = {
							["<C-d>"] = "delete_buffer",
						},
					},
				},
			},
			extentions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
				},
				undo = {},
			},
		})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("undo")

		local builtin = require("telescope.builtin")
		Keymap("n", "<leader>ff", builtin.find_files, { desc = "Files" })
		Keymap("n", "<leader>ft", builtin.live_grep, { desc = "Text" })
		Keymap("n", "<leader>fu", "<cmd>Telescope undo<cr>", { desc = "Undo" })
		Keymap("n", "<leader>fg", builtin.git_files, { desc = "Git Files" })
		Keymap("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
		Keymap("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
		Keymap("n", "<leader>fn", "<cmd>Noice telescope<cr>", { desc = "Notifications" })
		Keymap("n", "<leader>fw", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end, { desc = "Word" })
		-- Keymap("n", "<leader>fS", function()
		-- 	local word = vim.fn.expand("<cWORD>")
		-- 	builtin.grep_string({ search = word })
		-- end, { desc = "String Below (Backwords)" })
	end,
}
