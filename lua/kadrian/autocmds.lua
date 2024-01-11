-- Autocommand
vim.api.nvim_create_autocmd("TextYankPost", {
    	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 40 })
	end,
})

vim.api.nvim_create_augroup("AutoFormat", {})
vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        group = "AutoFormat",
        callback = function()
          vim.lsp.buf.format();
        end,
    }
)
