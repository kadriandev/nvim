local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<esc>", "<cmd>noh<cr>", { silent = true })
vim.keymap.set("n", "<C-c>", "<cmd>AvanteToggle<cr>", { silent = true })

vim.keymap.set("n", "<leader>x", "<cmd>x<cr>", { silent = true, desc = "which_key_ignore" })
vim.keymap.set("n", "<leader>X", "<cmd>tabclose<cr>", { silent = true, desc = "which_key_ignore" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { silent = true, desc = "which_key_ignore" })

vim.keymap.set("i", "<C-h>", "<Left>", opts)
vim.keymap.set("i", "<C-l>", "<Right>", opts)
vim.keymap.set("i", "<C-j>", "<Down>", opts)
vim.keymap.set("i", "<C-k>", "<Up>", opts)

vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("x", "p", [[ "_dP]])

vim.keymap.set("n", "J", "mzJ`z", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "g*", "g*zz", opts)
vim.keymap.set("n", "g#", "g#zz", opts)

vim.keymap.set({ "n", "o", "x" }, "<s-h>", "^", opts)
vim.keymap.set({ "n", "o", "x" }, "<s-l>", "g_", opts)

vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "<", "<gv", opts)

-- Global LSP vim.keymap.sets
vim.keymap.set("n", "gl", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
