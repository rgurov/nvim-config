require("nvim-web-devicons").setup({
	override_by_filename = {
		[".gitignore"] = {
			icon = "",
			color = "#f1502f",
			name = "Gitignore",
		},
		["go.mod"] = {
			icon = "󰟓",
			color = "#f1502f",
			name = "gomod",
		},
		["go.sum"] = {
			icon = "󰟓",
			color = "#f1502f",
			name = "gosum",
		},
	},

	override_by_extension = {
		["log"] = {
			icon = "",
			color = "#81e043",
			name = "Log",
		},
	},
})
