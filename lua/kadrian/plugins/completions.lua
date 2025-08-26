return {
	"saghen/blink.cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"nvim-tree/nvim-web-devicons",
		"onsails/lspkind.nvim",
	},
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "enter" },
		snippets = { preset = "luasnip" },
		signature = { enabled = true },
		completion = {
			ghost_text = {
				enabled = true,
				show_with_menu = false,
				show_with_selection = true,
				show_without_selection = false,
				show_without_menu = true,
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
			menu = {
				auto_show = true,
				border = "single",
				direction_priority = { "s", "n" },
				draw = {
					columns = { { "kind_icon" }, { "label", "label_description" }, { "kind" } },
					align_to = "kind_icon",
					components = {
						kind = {
							text = function(ctx)
								return " " .. ctx.kind
							end,
						},
						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										icon = dev_icon
									end
								else
									icon = require("lspkind").symbolic(ctx.kind, {
										mode = "symbol",
									})
								end
								return " " .. icon .. ctx.icon_gap .. " "
							end,
							highlight = function(ctx)
								local hl = ctx.kind_hl
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										hl = dev_hl
									end
								end
								return hl
							end,
						},
					},
				},
			},
		},
		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "buffer", "snippets", "path" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100, -- make lazydev completions top priority (see `:h blink.cmp`)
				},
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
