local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
    vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
end

require("nvim-tree").setup({
    on_attach = my_on_attach,
    git = {
        ignore = false,
    },
    filters = {
        custom = { '__pycache__', '*.meta', '.vscode', '*.csproj', '*.sln' }
    }
})
