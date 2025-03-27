local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")

    -- Telescope --
    use("stevearc/dressing.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use("nvim-telescope/telescope-media-files.nvim")

    -- Colorscheme --
    use({ "ellisonleao/gruvbox.nvim" })
    use("navarasu/onedark.nvim")
    use({ "projekt0n/github-nvim-theme", tag = "v0.0.7" })
    use({ "sainnhe/sonokai" })
    use({ "shaunsingh/nord.nvim" })
    use({ "AlexvZyl/nordic.nvim" })
    use({ "folke/tokyonight.nvim" })
    use({ "rebelot/kanagawa.nvim" })
    use({ "rmehri01/onenord.nvim" })
    use({ "Shatur/neovim-ayu" })
    use({ "Yazeed1s/minimal.nvim" })


    -- Treesitter --
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

    -- Undo tree --
    use("mbbill/undotree")

    -- Surround --
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    })

    -- CMP --
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")

    -- LSP --
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("jose-elias-alvarez/null-ls.nvim")

    -- Snippets --
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")

    -- Autopairs --
    use("windwp/nvim-autopairs")

    -- Comments --
    use("numToStr/Comment.nvim")
    use("JoosepAlviste/nvim-ts-context-commentstring")

    -- Git --
    use("lewis6991/gitsigns.nvim")
    use("tpope/vim-fugitive")

    -- Neovim Tree --
    use("kyazdani42/nvim-web-devicons")

    -- Dev icons --
    use("kyazdani42/nvim-tree.lua")

    -- Lualine --
    use("nvim-lualine/lualine.nvim")

    -- Projects --
    use("ahmedkhalf/project.nvim")

    -- Nvim go --
    use("ray-x/go.nvim")

    -- Floating window support --
    use("ray-x/guihua.lua")

    -- LaTex --
    use("lervag/vimtex")

    -- Split Join --
    use("AndrewRadev/splitjoin.vim")

    -- Git Blame --
    use("APZelos/blamer.nvim")

    -- Noice --
    use({
        "folke/noice.nvim",
        requires = { { "MunifTanjim/nui.nvim" }, { "rcarriga/nvim-notify" } }
    })


    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
