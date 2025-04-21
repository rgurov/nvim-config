return {
	"ahmedkhalf/project.nvim",
	lazy = false,
	config = function()
		require("project_nvim").setup({
			patterns = { ".git", "go.mod" },
		})
	end,
}
