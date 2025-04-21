return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Настройка самого линтера golangci-lint
		lint.linters.golangcilint = {
			cmd = "golangci-lint",
			args = { "run", "--out-format", "json" },
			ignore_exitcode = true, -- <--- это подавляет ошибку "exited with code 5"
			parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
				source = "golangci-lint",
				severity = vim.diagnostic.severity.WARN,
			}),
		}

		lint.linters_by_ft = {
			go = { "golangcilint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
