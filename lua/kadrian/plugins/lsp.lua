return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"nvim-lspconfig",
		"pmizio/typescript-tools.nvim",
	},
	config = function()
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "rust_analyzer", "tsserver" },
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				["tsserver"] = function()
					require("typescript-tools").setup({
						settings = {
							expose_as_code_action = "all",
							separate_diagnostic_server = true,
							complete_function_calls = true,
							jsx_close_tag = { enable = true, filetypes = { "javascriptreact", "typescriptreact" } },
						},
					})
				end,
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			},
		})
	end,
}
