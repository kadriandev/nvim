local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<esc>", "<cmd>noh<cr>", { silent = true })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { silent = true, desc = "which_key_ignore" })
-- vim.keymap.set("n", "<C-c>", "<cmd>AvanteToggle<cr>", { silent = true })

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
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)

vim.keymap.set("n", "<leader>da", "<cmd>lua require('dapui').continue()<cr>", { desc = "Attach DAP" })
vim.keymap.set("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<cr>", { desc = "Open DAP Ui" })
vim.keymap.set("n", "<leader>dr", "<cmd>lua require('dapui').open({ reset = true })<cr>", { desc = "Reset DAP Ui" })

vim.keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Set breakpoint" })
vim.keymap.set(
	"n",
	"<leader>bc",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
	{ desc = "Set conditional breakpoint" }
)
vim.keymap.set(
	"n",
	"<leader>bl",
	"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
	{ desc = "Set log point" }
)
vim.keymap.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "Clear breakpoints" })
vim.keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "List breakpoints" })
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue" })
vim.keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step over" })
vim.keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step into" })
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step out" })
vim.keymap.set("n", "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", { desc = "Disconnect" })
vim.keymap.set("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", { desc = "Terminate" })
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Open REPL" })
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Run last" })
vim.keymap.set("n", "<leader>di", function()
	require("dap.ui.widgets").hover()
end, { desc = "Variables" })
vim.keymap.set("n", "<leader>d?", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end, { desc = "Scopes" })
