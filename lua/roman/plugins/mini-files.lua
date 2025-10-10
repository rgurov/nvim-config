return {
	"nvim-mini/mini.files",
	lazy = false,
	version = false,
	keys = {
		{ "<leader>e", "<cmd>lua MiniFiles.open()<CR>", desc = "Open Mini Files" },
	},
	config = function()
		require("mini.files").setup({})
	end,
}
