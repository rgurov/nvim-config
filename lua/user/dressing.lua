require("dressing").setup({
    input = {
        relative = "editor", -- это ключевой параметр
        prefer_width = 40,
        min_width = 20,
        win_options = {
            winblend = 0,
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
        border = "rounded",
    },
})
