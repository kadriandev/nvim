return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { { "nvim-lua/plenary.nvim" } },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "which_key_ignore" })
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end)

		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():next()
		end)
		vim.keymap.set("n", "<C-p>", function()
			harpoon:list():prev()
		end)
	end,
}
