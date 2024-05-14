function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<C-t>]],
			dir = "git_dir",
			size = 80,
			direction = "vertical",
			shade_terminals = false,
			start_in_insert = true,
			highlights = {
				Normal = {
					guibg = "black",
				},
			},
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					"t",
					"<C-t>",
					"<cmd>ToggleTermToggleAll<cr>",
					{ noremap = true, silent = true }
				)
			end,
			-- function to run on closing the terminal
			on_close = function(_)
				vim.cmd("startinsert!")
			end,
		})

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		Keymap("n", "<leader>tt", function()
			if vim.v.count == 0 then
				return "<cmd>1ToggleTerm<cr>"
			elseif vim.v.count > 0 then
				return "<cmd>" .. vim.v.count .. "ToggleTerm<cr>"
			end
		end, { expr = true, desc = "Toggle" })
		Keymap("n", "<C-t>", "<cmd>ToggleTermToggleAll<cr>")
	end,
}
