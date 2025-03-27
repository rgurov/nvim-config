local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Q to Nop --
keymap("n", "Q", "<nop>", opts)

-- Cool yank --
keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+Y', opts)

-- Cool paste --
keymap("v", "p", '"_dP', opts)

-- Telescope --
keymap("n", "<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>ps", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>pp", "<cmd>Telescope projects<cr>", opts)

-- Nvimtree --
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Formatting --
keymap("n", "<leader>f", "<cmd>vim.lsp.buf.format()<cr>", opts)

-- Nvim go --
keymap("n", "<leader>gat", ":GoAddTag<cr>", opts)
keymap("n", "<leader>grt", ":GoRmTag<cr>", opts)
keymap("n", "<leader>gfs", ":GoFillStruct<cr>", opts)

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

-- Restart LSP --
keymap("n", "<leader>r", ":LspRestart<CR>", opts)
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "go.mod", "go.sum" },
    callback = function()
        vim.cmd("LspRestart")
    end,
})

vim.cmd([[
    command W w
    command Q q
]])

-- GitCommit command
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

vim.keymap.set("n", "<leader>ga", ":G add .<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gc", ":GitCommit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gp", ":G push<CR>", { noremap = true, silent = true })
