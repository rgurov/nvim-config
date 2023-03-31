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
keymap("n", "<leader>gat", ":GoAddTags<cr>", opts)
keymap("n", "<leader>gif", ":GoIfErr<cr>", opts)

vim.cmd([[
    command W w
    command Q q
]])
