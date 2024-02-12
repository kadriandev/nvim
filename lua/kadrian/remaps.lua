Keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

Keymap("n", "<Esc>", "<cmd>noh<cr>", opts)
Keymap("n", "<leader>qq", "<cmd>qa<cr>", opts)
Keymap("n", "<leader>w", "<cmd>w!<cr>", opts)
Keymap("n", "<leader>x", "<cmd>x<cr>", opts)

Keymap("i", "<C-h>", "<Left>", opts)
Keymap("i", "<C-l>", "<Right>", opts)
Keymap("i", "<C-j>", "<Down>", opts)
Keymap("i", "<C-k>", "<Up>", opts)

Keymap("n", "<C-u>", "<C-u>zz", opts)
Keymap("n", "<C-d>", "<C-d>zz", opts)

Keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
Keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

Keymap("x", "p", [[ "_dP]])

Keymap("n", "J", "mzJ`z", opts)
Keymap("n", "n", "nzzzv", opts)
Keymap("n", "N", "Nzzzv", opts)
Keymap("n", "g*", "g*zz", opts)
Keymap("n", "g#", "g#zz", opts)

Keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
Keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

Keymap("v", ">", ">gv", opts)
Keymap("v", "<", "<gv", opts)

Keymap("n", "<s-h>", "^", opts)
Keymap("n", "<s-l>", "g_", opts)

Keymap("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end)
Keymap("x", "<leader>/", "gbc", opts)

-- Global LSP Keymaps
Keymap("n", "gl", vim.diagnostic.open_float)
Keymap("n", "[d", vim.diagnostic.goto_prev)
Keymap("n", "]d", vim.diagnostic.goto_next)
