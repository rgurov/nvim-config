return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		-- nvim-treesitter (main) does not support lazy-loading
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install({
				"go",
				"typescript",
				"tsx",
				"javascript",
				"jsdoc",
				"python",
				"markdown",
				"markdown_inline",
				"json",
				"csv",
			})

			-- highlighting and indentation are opt-in on the main branch:
			-- enable them for every buffer that has a parser available
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("roman_treesitter", { clear = true }),
				callback = function(ev)
					if not vim.treesitter.language.get_lang(ev.match) then
						return
					end
					if not pcall(vim.treesitter.start, ev.buf) then
						return
					end
					vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
}
