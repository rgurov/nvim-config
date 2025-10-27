return {
	"nvim-mini/mini.files",
	lazy = false,
	version = false,
	keys = {
		{ "<leader>e", "<cmd>lua MiniFiles.open()<CR>", desc = "Open Mini Files" },
	},
	opts = {
		options = {
			use_as_default_explorer = false,
		},
	},
}
