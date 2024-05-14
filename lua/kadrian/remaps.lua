Keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

Keymap("n", "<leader>x", "<cmd>x<cr>", { silent = true, desc = "which_key_ignore" })
Keymap("n", "<leader>X", "<cmd>tabclose<cr>", { silent = true, desc = "which_key_ignore" })
Keymap("n", "<leader>qq", "<cmd>wqa<cr>", { silent = true, desc = "which_key_ignore" })

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

-- Global LSP Keymaps
Keymap("n", "gl", vim.diagnostic.open_float)
Keymap("n", "[d", vim.diagnostic.goto_prev)
Keymap("n", "]d", vim.diagnostic.goto_next)
