local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
    return
end

gitsigns.setup({
    signs = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "-" },
        topdelete    = { text = "-" },
        changedelete = { text = "~" },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval = 1000,
        follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },
})

--[[ gitsigns: Ignoring invalid configuration field 'current_line_blame_formatter_opts' ]]
--[[ 'signs.add.hl' is now deprecated, please define highlight 'GitSignsAdd' e.g: ]]
--[[   vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitSignsAdd' }) ]]
--[[ 'signs.add.linehl' is now deprecated, please define highlight 'GitSignsAddLn' e.g: ]]
--[[   vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitSignsAddLn' }) ]]
--[[ 'signs.add.numhl' is now deprecated, please define highlight 'GitSignsAddNr' e.g: ]]
--[[   vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitSignsAddNr' }) ]]
--[[ 'signs.change.hl' is now deprecated, please define highlight 'GitSignsChange' e.g: ]]
--[[   vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitSignsChange' }) ]]
--[[ 'signs.change.linehl' is now deprecated, please define highlight 'GitSignsChangeLn' e.g: ]]
--[[   vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitSignsChangeLn' }) ]]
--[[ 'signs.change.numhl' is now deprecated, please define highlight 'GitSignsChangeNr' e.g: ]]
--[[   vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr' }) ]]
--[[ 'signs.changedelete.hl' is now deprecated, please define highlight 'GitSignsChangedelete' e.g: ]]
--[[   vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitSignsChange' }) ]]
--[[ 'signs.changedelete.linehl' is now deprecated, please define highlight 'GitSignsChangedeleteLn' e.g: ]]
--[[   vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { link = 'GitSignsChangeLn' }) ]]
--[[ 'signs.changedelete.numhl' is now deprecated, please define highlight 'GitSignsChangedeleteNr' e.g: ]]
--[[   vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' }) ]]
--[[ 'signs.delete.hl' is now deprecated, please define highlight 'GitSignsDelete' e.g: ]]
--[[   vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitSignsDelete' }) ]]
--[[ 'signs.delete.linehl' is now deprecated, please define highlight 'GitSignsDeleteLn' e.g: ]]
--[[   vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDeleteLn' }) ]]
--[[ 'signs.delete.numhl' is now deprecated, please define highlight 'GitSignsDeleteNr' e.g: ]]
--[[   vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDeleteNr' }) ]]
--[[ 'signs.topdelete.hl' is now deprecated, please define highlight 'GitSignsTopdelete' e.g: ]]
--[[   vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitSignsDelete' }) ]]
--[[ 'signs.topdelete.linehl' is now deprecated, please define highlight 'GitSignsTopdeleteLn' e.g: ]]
--[[   vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { link = 'GitSignsDeleteLn' }) ]]
--[[ 'signs.topdelete.numhl' is now deprecated, please define highlight 'GitSignsTopdeleteNr' e.g: ]]
--[[   vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDeleteNr' }) ]]
