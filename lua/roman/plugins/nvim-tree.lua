return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
	},
	opts = {
		git = {
			ignore = false,
		},
		filters = {
			custom = { "__pycache__", "*.meta", ".vscode", "*.csproj", "*.sln" },
		},
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return {
					desc = "nvim-tree: " .. desc,
					buffer = bufnr,
					noremap = true,
					silent = true,
					nowait = true,
				}
			end

			-- Default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- Custom mappings
			local keymap = vim.keymap.set
			keymap("n", "l", api.node.open.edit, opts("Open"))
			keymap("n", "<CR>", api.node.open.edit, opts("Open"))
			keymap("n", "o", api.node.open.edit, opts("Open"))
			keymap("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
			keymap("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
		end,
	},
}
