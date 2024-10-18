return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons", "nvim-telescope/telescope.nvim" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			"███████████████████████████████▀▀╬▀▀███████▒▒╠╠╣▀▓▓█████████████████████████████████████████████████",
			"███████████████████████▓▓▓╬╚╚╚╚░░φ░╠╠╣╠╠╠▀███╣╠▓▓██████▓▓▓▓▓▓▓▓▓▓▓██████████████████████████████████",
			"███████████████▓██▓▓▓▓▓╣╩░░░░░░╔▄██╣╠╠╠╠╠╠╣╠╠▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████████████████████████████████",
			"███████████████▓▓▓╝╝╩╚░░░φ░░░░╠███▒╠╠╠╠╠╠╣╣▓▓▓▓▓▓▓╣╣╣╣╣╣▒╣╣╣╣╣║╣╣▓▓╣▓▓██████████████████▀██╩╠███████",
			"████████████▓▓▓▒╚╙╙░░░░░φφ░░░░░░╙░╠╠╠╠╠║▓╣▓╣╣╬╝╩╚╠╠╠╠╠╠╠╠╠╠╠╠░░░░╠╠╚╩▓██████▀▀██╣╣╬╝╩╙╙░░╓▄█████████",
			'███████████▓▓▓▒▒░ⁿⁿ-░░░φ░░░░░░φφφ░╠╚░≥║╣╩╩╚░░░╠╠╠╠╠╠╠╠╠╠φφφδ╝╠≥φφ▄▄╣▓╬╣▀╬╝╢╠╠╠╙╙╙└"»:≤╔█████████████',
			'██████████▓▓▓▒▒░` ,«▄█████████████╠░""└└╙░░σφ╠╠╠╠╠╠╠▄▄▓▓▓▒╢▀▓▓▓▓▓╝╣╣╬▒╠╠╠╚╙╙└~..,,«╓▄███████████████',
			"████████║▓▓▓▒▒░' ,╓▓██████████████▒░'.,;╓φ▄▄╣╣▓▓▓▓▓▓▓╣▒▒╣▒╝▒╬║╬╠▒╠╚╚╙╙╙\"   '  ,╓▄██████████████████▓",
			"▓▓▓▓▓▓▓╣▓▓▓▒╠░' .╓████████████▀▀╠╠φφφ▓▓╬╣╣╣╣▒╣╣╣╬╬╠╬╬╠╝▒╠╠╠╝╚╠╠╚╙^         ▄▄██████████████▓▓▓▓▓▓▓▓▓",
			"╣╣╣╣╣╬▓▓▓▓▒╠░' .á▓▓████▀▀╚░░░╠▒╣╝╝╠╠▒▒╠╚╚╚╚░╚╚╚╚╚╚╙╙╚╩╚╙╙╙\"└'              ╙██████████▓▓▓▓▓▓▓▓╣▒▒╣▒▒",
			'░░φ░░░░╚╙╝╠▒\'  ]╝╩╙░»»░░""░ⁿ""\'\'               .,ε,,%╗▓▓▓▓φ≥%φµ.╣▒  @╙ε   «▄▄███████▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒',
			"╚░░░\"'  ^░╠\"   \"\"^`       ''         ▒≈ε    ,▄Æ▓▓▒░»╙▓▓▓▓▓▓▓▓▓▒▒▒╙'⌐'.φ  ▄▄▄▓██████▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒",
			'░░"\'     ║"\' .▒▒▒╠╬▒▒φ╗▄σφφ╗╗Æ@▓▓▓▒▄ ε",-]▓▄▓▓▓▓▒▒▄░╔▓▓▓▓▓▓▓▓▓▒▒░ε..[╓╗▓▄▓████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓',
			'░░-   φ»░░ⁿⁿ````\'╙║▒▒▒▒▒▒▒▒╝░²""└╙╣▓εµQ~~╩▓▓▓▓▓▓▓▓▓▓▓▓▓╝╝╝╣▓▓▒▒╚░<,╓@║▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓',
			"░░'  ╔░░░\"       ╣╣╣▒▓▓▓▓▓▒▒'     `^└╙▀δ╗▄║▓▓▓▓▓▓╬▒╣▓╣╝╝╣▓▓▓▓▒▒╚⌐ ╙╠▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╣▒▒",
			'░"   ░░"\'      ╓║╠╠╣╣╣╣╣╣▒▒▒             ╙└╙╣╬╣▓▓▓▓▒▄φφ▄▓▓▓▒▒╠└    ▓▓▓▓▓▓▓▓▓▓▓▓▓╩╝╝╣▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒',
			"»`  φ░\"'        ╚╠╠╠╠╠╠╠╣▒▒⌐                 ╙╙╣╣▓▓▓▓▓▓╣▒╬╠╚└   -╘▀▀▀╙╙╙╙╙╙└┘ⁿ^`'   ╙╣▓▓▓▓▓▓▒▒▓▒▒▒▒▒",
			"^   ░░^        «╠╚╠╠╠╠╠╠╠╬▒⌐                  ,`\"╙╙╚╝╝╩╚╙└.'.             ''         ║╣▒▒▒▒▒▒▒▒▒▒▒▒▒",
			"'  ░░\"             `╚╠╠╠╝╝╝⌐                  φ░-'      -\"--`'                       ║╣▒▒▒▒▒▒▒▒▒▒▒▒▒",
			'  φ░"        "≥,     ""                       ╣▒▒σε..  .-";»;ε                       ║╣▒▒▒▒▒▒▒▒▒▒▒▒▒',
			" 'ⁿ~           \"░                             ║▓▒╝▒▒φσ▄µφ▄@▓▒╠~                      ║║▒▒▒▒▒▒▒▒▒╣▒╣▒",
			'"~        ,      -                            ║▒▒▒║╣▒▒▒▒▒▒▒╠▒╠ε                      ]╠╬╣▒▒▒▒▒▒▒▒▒╬╬',
			"          == -==                             ª╝╝╝╩╩╚╝╝╝╝╩╩╩╩╚╩╝-                      ╚╩╝╝╝╝╝╝╝╩╩╩╩╩",
		}
		dashboard.section.buttons.val = {
			dashboard.button("f", "Find file", ":Telescope find_files hidden=true<cr>"),
			dashboard.button("r", "Recently used files", ":Telescope oldfiles <CR>"),
			dashboard.button("l", "Lazy", ":Lazy<CR>"),
			dashboard.button("m", "Mason", ":Mason<CR>"),
			dashboard.button("q", "Quit", ":qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
	end,
}
