return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		-- Save initial working directory for repository search
		if not vim.g.repos_root then
			vim.g.repos_root = vim.fn.getcwd()
		end

		local telescope = require("telescope")
		local telescope_actions = require("telescope.actions")
		local telescope_actions_state = require("telescope.actions.state")
		local telescope_pickers = require("telescope.pickers")
		local telescope_config = require("telescope.config")
		local telescope_builtin = require("telescope.builtin")
		local telescope_finders = require("telescope.finders")
		local telescope_make_entry = require("telescope.make_entry")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				prompt_prefix = " ",
				selection_caret = " ",
				mappings = {
					i = {
						["<C-k>"] = telescope_actions.move_selection_previous, -- move to prev result
						["<C-j>"] = telescope_actions.move_selection_next, -- move to next result
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- Custom function to select repository and search in it
		local function find_in_repo()
			local root = vim.g.repos_root or vim.fn.getcwd()

			-- Find all .git directories at depth 1-2
			local git_dirs = vim.list_extend(
				vim.fn.glob(root .. "/*/.git", true, true),
				vim.fn.glob(root .. "/*/*/.git", true, true)
			)

			-- Convert to repo entries
			local repos = vim.tbl_map(function(git_path)
				local repo_path = vim.fn.fnamemodify(git_path, ":h")
				local display = vim.fn.fnamemodify(repo_path, ":h:t") .. "/" .. vim.fn.fnamemodify(repo_path, ":t")
				return { path = repo_path, display = display:gsub("^%./", "") }
			end, git_dirs)

			telescope_pickers
				.new({}, {
					prompt_title = "Select Repository",
					finder = telescope_finders.new_table({
						results = repos,
						entry_maker = function(e)
							return { value = e.path, display = e.display, ordinal = e.display }
						end,
					}),
					sorter = telescope_config.values.generic_sorter({}),
					attach_mappings = function(bufnr)
						telescope_actions.select_default:replace(function()
							local entry = telescope_actions_state.get_selected_entry()
							telescope_actions.close(bufnr)
							telescope_builtin.find_files({ cwd = entry.value })
						end)
						return true
					end,
				})
				:find()
		end

		local function find_git_conflicts()
			telescope_pickers
				.new({}, {
					prompt_title = "Merge Conflicts",

					finder = telescope_finders.new_oneshot_job({ "git", "diff", "--name-only", "--diff-filter=U" }, {
						entry_maker = telescope_make_entry.gen_from_file({}),
					}),

					sorter = telescope_config.values.file_sorter({}),

					previewer = telescope_config.values.file_previewer({}),

					attach_mappings = function(bufnr)
						telescope_actions.select_default:replace(function()
							local entry = telescope_actions_state.get_selected_entry()
							telescope_actions.close(bufnr)

							vim.cmd("edit " .. entry.value)
						end)

						return true
					end,
				})
				:find()
		end

		-- Keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader><Space>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>r", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>s", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>p", find_in_repo, { desc = "Find files in repository" })
		keymap.set("n", "<leader>f", find_git_conflicts, { desc = "Find files with git conflicts" })
	end,
}
