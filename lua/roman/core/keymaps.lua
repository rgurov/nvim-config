-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- KEYMAPS --------------------------------------------------------

-- ╭──────────────────────────────╮
-- │ Normal Mode Keymaps         │
-- ╰──────────────────────────────╯

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window", silent = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to lower window", silent = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to upper window", silent = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window", silent = true })

-- Resize windows
keymap("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize window up", silent = true })
keymap("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize window down", silent = true })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize window left", silent = true })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize window right", silent = true })

-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer", silent = true })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer", silent = true })

-- Disable Ex mode
keymap("n", "Q", "<nop>", { desc = "Disable Ex mode" })

-- Yank to system clipboard
keymap("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap("n", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })

-- Paste without yanking
keymap("v", "p", '"_dP', { desc = "Paste without copying" })

-- LSP diagnostic popup
keymap("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })

-- Restart LSP
keymap("n", "<leader>r", ":LspRestart<CR>", { desc = "Restart LSP" })

-- ╭──────────────────────────────╮
-- │ Insert Mode Keymaps         │
-- ╰──────────────────────────────╯

-- Exit insert mode quickly
keymap("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- ╭──────────────────────────────╮
-- │ Visual Mode Keymaps         │
-- ╰──────────────────────────────╯

-- Stay in indent mode
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

-- ╭──────────────────────────────╮
-- │ Visual Block Mode           │
-- ╰──────────────────────────────╯

-- Move selected text up/down
keymap("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move block down" })
keymap("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move block up" })

-- ╭──────────────────────────────╮
-- │ Go.nvim shortcuts           │
-- ╰──────────────────────────────╯

keymap("n", "<leader>gat", ":GoAddTag<cr>", { desc = "Add Go struct tags" })
keymap("n", "<leader>grt", ":GoRmTag<cr>", { desc = "Remove Go struct tags" })
keymap("n", "<leader>gfs", ":GoFillStruct<cr>", { desc = "Fill Go struct" })

-- ╭──────────────────────────────╮
-- │ Git commands                │
-- ╰──────────────────────────────╯

keymap("n", "<leader>ga", ":G add .<CR>", { desc = "Git add all" })
keymap("n", "<leader>gc", ":GitCommit<CR>", { desc = "Git commit with prompt" })
keymap("n", "<leader>gp", ":G push<CR>", { desc = "Git push" })

-- ╭──────────────────────────────╮
-- │ Autocommands & Commands     │
-- ╰──────────────────────────────╯

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "go.mod", "go.sum" },
	callback = function()
		vim.cmd("LspRestart")
	end,
})

-- Add :W and :Q as safer aliases
vim.cmd([[ command W w ]])
vim.cmd([[ command Q q ]])

-- Git commit popup
vim.api.nvim_create_user_command("GitCommit", function()
	vim.ui.input({ prompt = "Commit message: " }, function(msg)
		if msg and msg ~= "" then
			local result = vim.fn.system({ "git", "commit", "-m", msg })

			if vim.v.shell_error == 0 then
				vim.notify("Commit successful: " .. result, vim.log.levels.INFO, {
					title = "Git Commit",
					timeout = 3000,
				})
			else
				vim.notify("Commit failed: " .. result, vim.log.levels.ERROR, {
					title = "Git Commit",
					timeout = 5000,
				})
			end
		else
			vim.notify("Commit message is empty", vim.log.levels.WARN, { title = "Git Commit" })
		end
	end)
end, {})
