local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
    },

    -------------------------------------------------
    -- Themes ---------------------------------------
    -------------------------------------------------
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    "sainnhe/gruvbox-material",
    -------------------------------------------------
    -------------------------------------------------

    "andweeb/presence.nvim",
    "ThePrimeagen/vim-be-good",

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    -- 'nvim-treesitter/nvim-treesitter-context',
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
        },
    },
    "theprimeagen/harpoon",
    "mbbill/undotree",
    { "akinsho/toggleterm.nvim",         version = "*",      config = true },
    -- { 'numirias/semshi',                 build = ':UpdateRemotePlugins' },

    -------------------------------------------------
    -- Git ---------------------------------------
    -------------------------------------------------
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    { "sindrets/diffview.nvim" },
    -------------------------------------------------
    -------------------------------------------------
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    },
    "folke/zen-mode.nvim",
    -- "github/copilot.vim",
    {
        "goolord/alpha-nvim",
        config = function()
            require("alpha").setup(require("alpha.themes.dashboard").config)
        end,
    },
    "ahmedkhalf/project.nvim",
    { "nvim-tree/nvim-web-devicons" },
    {
        "echasnovski/mini.icons",
        opts = {},
        lazy = true,
        specs = {
            { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
        },
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
    { "echasnovski/mini.nvim", version = "*" },
    "brenoprata10/nvim-highlight-colors",
    "nvzone/volt",
    "nvzone/showkeys",
    "nvzone/timerly",

    -- Diagnostics
    "dgagn/diagflow.nvim"
}

local opts = {}

require("lazy").setup(plugins, opts)
