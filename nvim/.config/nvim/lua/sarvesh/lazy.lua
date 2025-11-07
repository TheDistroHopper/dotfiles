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
    -------------------------------------------------
    -- Themes ---------------------------------------
    -------------------------------------------------
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    -------------------------------------------------
    -------------------------------------------------

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    'nvim-treesitter/nvim-treesitter-context',
    -------------------------------------------------
    -- Git ---------------------------------------
    -------------------------------------------------
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    -------------------------------------------------
    -------------------------------------------------
    "folke/zen-mode.nvim",
    -- "github/copilot.vim",
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
    { "echasnovski/mini.nvim",      version = "*" },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            styles = {
                float = {
                    -- title = " ",
                    -- border = "rounded",
                    position = "float",
                    backdrop = 60,
                    height = 0.9,
                    width = 0.9,
                    zindex = 50,
                },
                help = {
                    position = "float",
                    backdrop = false,
                    border = "top",
                    row = -1,
                    width = 0,
                    height = 0.9,
                    sidescrolloff = 1,
                }
            },
            layout = {
                -- your layout configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            },
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            -- bigfile = { enabled = true },
            -- chafa Pictures/7.jpg --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1
            dashboard = {
                sections = {
                    -- {
                    --     section = "terminal",
                    --     cmd = "ascii-image-converter ~/Pictures/neovide.png --color -d 60,20",
                    --     height = 20,
                    --     padding = 1,
                    -- },
                    {
                        -- pane = 2,
                        { section = "projects",   gap = 1, padding = 1 },
                        { section = "startup" },
                    },
                },
            },
            -- explorer = { enabled = true },
            terminal = {
                win = { style = "float" },
            },
            -- indent = { enabled = true },
            -- input = { enabled = true },
            -- picker = { enabled = true },
            picker = { layouts = {
                default = {
                    layout = {
                        backdrop = 90,
                        box = "horizontal",
                        width = 0.85,
                        min_width = 100,
                        height = 0.6,
                        {
                            box = "vertical",
                            border = "rounded",
                            title = "{title} {live} {flags}",
                            { win = "input", height = 1, border = "bottom" },
                            { win = "list", border = "none" },
                        },
                        { win = "preview", title = "{preview}", border = "rounded", width = 0.7 },
                    },
                },
                select = {
                    preview = false,
                    layout = {
                        backdrop = 90,
                        width = 0.5,
                        min_width = 80,
                        height = 0.4,
                        min_height = 3,
                        box = "vertical",
                        border = "rounded",
                        title = "{title}",
                        title_pos = "center",
                        { win = "input", height = 1, border = "bottom" },
                        { win = "list", border = "none" },
                        { win = "preview", title = "{preview}", height = 0.6, border = "top" },
                    },
                }
            } },
            git = { enabled = true },
            -- notifier = { enabled = true },
            -- quickfile = { enabled = true },
            -- scope = { enabled = true },
            -- scroll = { enabled = true },
            scratch = { enabled = true },
            statuscolumn = { enabled = true },
            zen = { enabled = true },
        },
        keys = {
            { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
            { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
        }
    },
    "nvzone/volt",
    "nvzone/showkeys",
    "nvzone/timerly",

    -- Diagnostics
    "dgagn/diagflow.nvim",

    -- LSP
    { 'williamboman/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },

        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = 'default' },

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono'
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = false } },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },
}

local opts = {}

require("lazy").setup(plugins, opts)
