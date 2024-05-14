return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { { "nvim-lua/plenary.nvim" } },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})

		Keymap("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add to Harpoon" })
		Keymap("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		Keymap("n", "<C-n>", function()
			harpoon:list():next()
		end)
		Keymap("n", "<C-p>", function()
			harpoon:list():prev()
		end)
	end,
}
