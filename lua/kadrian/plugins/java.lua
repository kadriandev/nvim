return {
	{
		"mfussenegger/nvim-jdtls",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{
		"eatgrass/maven.nvim",
		cmd = { "Maven", "MavenExec" },
		dependencies = "nvim-lua/plenary.nvim",
		lazy = true,
		config = function()
			require("maven").setup({
				executable = "./mvnw", -- `mvn` should be in your `PATH`, or the path to the maven exectable, for example `./mvnw`
				cwd = nil, -- work directory, default to `vim.fn.getcwd()`
				settings = nil, -- specify the settings file or use the default settings
				commands = { -- add custom goals to the command list
					{ cmd = { "spotless:apply", "clean", "install" }, desc = "clean install" },
					{ cmd = { "spotless:check" }, desc = "Format:Check" },
					{ cmd = { "spotless:apply" }, desc = "Format:Apply" },
				},
			})
		end,
	},
}
