return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"nvim-lspconfig",
		"pmizio/typescript-tools.nvim",
		"mfussenegger/nvim-dap",
		"saghen/blink.cmp",
	},
	config = function()
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls", "biome", "jdtls@1.48.0" },
			handlers = {
				function(server_name)
					local capabilities = require("blink.cmp").get_lsp_capabilities()
					require("lspconfig")[server_name].setup({ capabilies = capabilities })
				end,
				["jdtls"] = function()
					-- jdtls initializion in ftplugin
				end,
				["groovyls"] = function()
					require("lspconfig").groovyls.setup({
						capabilies = require("blink.cmp").get_lsp_capabilities(),
						cmd = {
							"java",
							"-jar",
							"/Users/kmonteir/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar",
						},
					})
				end,
				["ts_ls"] = function()
					require("typescript-tools").setup({
						capabilies = require("blink.cmp").get_lsp_capabilities(),
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
						capabilies = require("blink.cmp").get_lsp_capabilities(),
						settings = {
							Lua = {
								runtime = {
									-- Tell the language server which version of Lua you're using
									-- (most likely LuaJIT in the case of Neovim)
									version = "LuaJIT",
								},
								diagnostics = {
									globals = { "vim", "require", "Snacks" },
								},
								workspace = {
									-- Make the server aware of Neovim runtime files
									library = vim.api.nvim_get_runtime_file("", true),
								},
								telemetry = {
									enable = false,
								},
							},
						},
					})
				end,
			},
		})
	end,
}
