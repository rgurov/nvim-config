return {
	"ahmedkhalf/project.nvim",
	lazy = false,
	config = function()
		require("project_nvim").setup({
			active = true,

			on_config_done = nil,

			manual_mode = false,

			detection_methods = { "pattern" },

			patterns = { ".git", "go.mod" },

			show_hidden = false,

			silent_chdir = true,

			ignore_lsp = {},

			datapath = vim.fn.stdpath("data"),
		})
	end,
}
