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

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			count = 5,
			dir = "git_dir",
			direction = "float",
			float_opts = {
				border = "double",
			},
			-- function to run on opening the terminal
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					"t",
					"<C-t>",
					"<cmd>close<CR>",
					{ noremap = true, silent = true }
				)
			end,
			-- function to run on closing the terminal
			on_close = function(_)
				vim.cmd("startinsert!")
			end,
			hidden = true,
		})

		function ToggleTerminal(term)
			if term == "lazygit" then
				lazygit:toggle()
			elseif term == "term" then
				-- floatTerm:toggle()
			end
		end

		Keymap("n", "<C-t>", function()
			if vim.v.count > 0 then
				return "<cmd>" .. vim.v.count .. "ToggleTerm<cr>"
			else
				return "<cmd>ToggleTermToggleAll<cr>"
			end
		end, { expr = true })
		Keymap("n", "<leader>gg", "<cmd>lua ToggleTerminal('lazygit')<cr>")
	end,
}
