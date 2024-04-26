return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		require("conform").setup({
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				javascript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 1000, lsp_fallback = false },
			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		})
		Keymap("n", "<leader>cf", function()
			require("conform").format({ async = true, lsp_fallback = false })
		end, { desc = "Conform: Format" })
	end,
}
