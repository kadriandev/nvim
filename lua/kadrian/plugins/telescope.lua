return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				-- mappings = {
				-- 	["<C-q>"] = require("telescope.actions").smart_send_to_qflist,
				-- },
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
			},
		})
		require("telescope").load_extension("fzf")

		local builtin = require("telescope.builtin")
		Keymap("n", "<leader>ff", builtin.find_files, {})
		Keymap("n", "<leader>ft", builtin.live_grep, {})
		Keymap("n", "<leader>fg", builtin.git_files, {})
		Keymap("n", "<leader>fb", builtin.buffers, {})
		Keymap("n", "<leader>vh", builtin.help_tags, {})
		Keymap("n", "<C->", builtin.git_files)
		Keymap("n", "<leader>fs", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		Keymap("n", "<leader>fws", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
	end,
}
