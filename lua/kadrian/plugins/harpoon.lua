return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	requires = { { "nvim-lua/plenary.nvim" } },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup({})
		-- REQUIRED

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():next()
		end)
		vim.keymap.set("n", "<C-p>", function()
			harpoon:list():prev()
		end)
		-- vim.keymap.set("n", "<C-2>", function()
		-- 	harpoon:list():select(2)
		-- end)
		-- vim.keymap.set("n", "<C-3>", function()
		-- 	harpoon:list():select(3)
		-- end)
		-- vim.keymap.set("n", "<C-4>", function()
		-- 	harpoon:list():select(4)
		-- end)
	end,
}
