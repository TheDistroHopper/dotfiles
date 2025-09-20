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
    -- 'nvim-treesitter/nvim-treesitter-context',
    -- {
    --     "utilyre/barbecue.nvim",
    --     name = "barbecue",
    --     version = "*",
    --     dependencies = {
    --         "SmiteshP/nvim-navic",
    --         "nvim-tree/nvim-web-devicons", -- optional dependency
    --     },
    --     opts = {
    --         -- configurations go here
    --     },
    -- },
    -------------------------------------------------
    -- Git ---------------------------------------
    -------------------------------------------------
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    -------------------------------------------------
    -------------------------------------------------
    "folke/zen-mode.nvim",
    "github/copilot.vim",
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
    -- LSP Plugins
    {
        -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
        -- used for completion, annotations and signatures of Neovim apis
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },
    {
        -- Main LSP Configuration
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs and related tools to stdpath for Neovim
            -- Mason must be loaded before its dependents so we need to set it up here.
            -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
            { 'williamboman/mason.nvim', opts = {} },
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',

            -- Useful status updates for LSP.
            { 'j-hui/fidget.nvim',       opts = {} },

            -- Allows extra capabilities provided by nvim-cmp
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            -- Brief aside: **What is LSP?**
            --
            -- LSP is an initialism you've probably heard, but might not understand what it is.
            --
            -- LSP stands for Language Server Protocol. It's a protocol that helps editors
            -- and language tooling communicate in a standardized fashion.
            --
            -- In general, you have a "server" which is some tool built to understand a particular
            -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
            -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
            -- processes that communicate with some "client" - in this case, Neovim!
            --
            -- LSP provides Neovim with features like:
            --  - Go to definition
            --  - Find references
            --  - Autocompletion
            --  - Symbol Search
            --  - and more!
            --
            -- Thus, Language Servers are external tools that must be installed separately from
            -- Neovim. This is where `mason` and related plugins come into play.
            --
            -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
            -- and elegantly composed help section, `:help lsp-vs-treesitter`

            --  This function gets run when an LSP attaches to a particular buffer.
            --    That is to say, every time a new file is opened that is associated with
            --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
            --    function will be executed to configure the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
                callback = function(event)
                    -- NOTE: Remember that Lua is a real programming language, and as such it is possible
                    -- to define small helper and utility functions so you don't have to repeat yourself.
                    --
                    -- In this case, we create a function that lets us more easily define mappings specific
                    -- for LSP related items. It sets the mode, buffer and description for us each time.
                    local map = function(keys, func, desc, mode)
                        mode = mode or 'n'
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                    end

                    -- -- Jump to the definition of the word under your cursor.
                    -- --  This is where a variable was first declared, or where a function is defined, etc.
                    -- --  To jump back, press <C-t>.
                    -- map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

                    -- -- Find references for the word under your cursor.
                    -- map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

                    -- -- Jump to the implementation of the word under your cursor.
                    -- --  Useful when your language has ways of declaring types without an actual implementation.
                    -- map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

                    -- -- Jump to the type of the word under your cursor.
                    -- --  Useful when you're not sure what type a variable is and you want to see
                    -- --  the definition of its *type*, not where it was *defined*.
                    -- map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

                    -- -- Fuzzy find all the symbols in your current document.
                    -- --  Symbols are things like variables, functions, types, etc.
                    -- map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

                    -- -- Fuzzy find all the symbols in your current workspace.
                    -- --  Similar to document symbols, except searches over your entire project.
                    -- map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

                    -- -- Rename the variable under your cursor.
                    -- --  Most Language Servers support renaming across files, etc.
                    -- map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

                    -- -- Execute a code action, usually your cursor needs to be on top of an error
                    -- -- or a suggestion from your LSP for this to activate.
                    -- map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

                    -- -- WARN: This is not Goto Definition, this is Goto Declaration.
                    -- --  For example, in C this would take you to the header.
                    -- map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                    -- The following two autocommands are used to highlight references of the
                    -- word under your cursor when your cursor rests there for a little while.
                    --    See `:help CursorHold` for information about when this is executed
                    --
                    -- When you move your cursor, the highlights will be cleared (the second autocommand).
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                        local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight',
                            { clear = false })
                        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd('LspDetach', {
                            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                            end,
                        })
                    end

                    -- The following code creates a keymap to toggle inlay hints in your
                    -- code, if the language server you are using supports them
                    --
                    -- This may be unwanted, since they displace some of your code
                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                        map('<leader>th', function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
                        end, '[T]oggle Inlay [H]ints')
                    end
                end,
            })

            -- Change diagnostic symbols in the sign column (gutter)
            -- if vim.g.have_nerd_font then
            --   local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
            --   local diagnostic_signs = {}
            --   for type, icon in pairs(signs) do
            --     diagnostic_signs[vim.diagnostic.severity[type]] = icon
            --   end
            --   vim.diagnostic.config { signs = { text = diagnostic_signs } }
            -- end

            -- LSP servers and clients are able to communicate to each other what features they support.
            --  By default, Neovim doesn't support everything that is in the LSP specification.
            --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
            --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

            -- Enable the following language servers
            --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
            --
            --  Add any additional override configuration in the following tables. Available keys are:
            --  - cmd (table): Override the default command used to start the server
            --  - filetypes (table): Override the default list of associated filetypes for the server
            --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
            --  - settings (table): Override the default settings passed when initializing the server.
            --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
            local servers = {
                -- clangd = {},
                -- gopls = {},
                -- pyright = {},
                -- rust_analyzer = {},
                -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
                --
                -- Some languages (like typescript) have entire language plugins that can be useful:
                --    https://github.com/pmizio/typescript-tools.nvim
                --
                -- But for many setups, the LSP (`ts_ls`) will work just fine
                -- ts_ls = {},
                --

                lua_ls = {
                    -- cmd = { ... },
                    -- filetypes = { ... },
                    -- capabilities = {},
                    settings = {
                        Lua = {
                            completion = {
                                callSnippet = 'Replace',
                            },
                            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                            -- diagnostics = { disable = { 'missing-fields' } },
                        },
                    },
                },
            }

            -- Ensure the servers and tools above are installed
            --
            -- To check the current status of installed tools and/or manually install
            -- other tools, you can run
            --    :Mason
            --
            -- You can press `g?` for help in this menu.
            --
            -- `mason` had to be setup earlier: to configure its options see the
            -- `dependencies` table for `nvim-lspconfig` above.
            --
            -- You can add other tools here that you want Mason to install
            -- for you, so that they are available from within Neovim.
            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                'stylua', -- Used to format Lua code
            })
            require('mason-tool-installer').setup { ensure_installed = ensure_installed }

            require('mason-lspconfig').setup {
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        -- This handles overriding only values explicitly passed
                        -- by the server configuration above. Useful when disabling
                        -- certain features of an LSP (for example, turning off formatting for ts_ls)
                        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                        require('lspconfig')[server_name].setup(server)
                    end,
                },
            }
        end,
    },
    { -- Autocompletion
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            {
                'L3MON4D3/LuaSnip',
                build = (function()
                    -- Build Step is needed for regex support in snippets.
                    -- This step is not supported in many windows environments.
                    -- Remove the below condition to re-enable on windows.
                    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                        return
                    end
                    return 'make install_jsregexp'
                end)(),
                dependencies = {
                    -- `friendly-snippets` contains a variety of premade snippets.
                    --    See the README about individual language/framework/plugin snippets:
                    --    https://github.com/rafamadriz/friendly-snippets
                    -- {
                    --   'rafamadriz/friendly-snippets',
                    --   config = function()
                    --     require('luasnip.loaders.from_vscode').lazy_load()
                    --   end,
                    -- },
                },
            },
            'saadparwaiz1/cmp_luasnip',

            -- Adds other completion capabilities.
            --  nvim-cmp does not ship with all sources by default. They are split
            --  into multiple repos for maintenance purposes.
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'aidancz/buvvers.nvim',
        },
        config = function()
            -- See `:help cmp`
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            luasnip.config.setup {}

            -- cmp.setup {
            --     snippet = {
            --         expand = function(args)
            --             luasnip.lsp_expand(args.body)
            --         end,
            --     },
            --     completion = { completeopt = 'menu,menuone,noinsert' },
            --
            --     -- For an understanding of why these mappings were
            --     -- chosen, you will need to read `:help ins-completion`
            --     --
            --     -- No, but seriously. Please read `:help ins-completion`, it is really good!
            --     mapping = cmp.mapping.preset.insert {
            --         -- Select the [n]ext item
            --         ['<C-n>'] = cmp.mapping.select_next_item(),
            --         -- Select the [p]revious item
            --         ['<C-p>'] = cmp.mapping.select_prev_item(),
            --
            --         -- Scroll the documentation window [b]ack / [f]orward
            --         ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            --         ['<C-f>'] = cmp.mapping.scroll_docs(4),
            --
            --         -- Accept ([y]es) the completion.
            --         --  This will auto-import if your LSP supports it.
            --         --  This will expand snippets if the LSP sent a snippet.
            --         ['<C-y>'] = cmp.mapping.confirm { select = true },
            --
            --         -- If you prefer more traditional completion keymaps,
            --         -- you can uncomment the following lines
            --         --['<CR>'] = cmp.mapping.confirm { select = true },
            --         --['<Tab>'] = cmp.mapping.select_next_item(),
            --         --['<S-Tab>'] = cmp.mapping.select_prev_item(),
            --
            --         -- Manually trigger a completion from nvim-cmp.
            --         --  Generally you don't need this, because nvim-cmp will display
            --         --  completions whenever it has completion options available.
            --         ['<C-Space>'] = cmp.mapping.complete {},
            --
            --         -- Think of <c-l> as moving to the right of your snippet expansion.
            --         --  So if you have a snippet that's like:
            --         --  function $name($args)
            --         --    $body
            --         --  end
            --         --
            --         -- <c-l> will move you to the right of each of the expansion locations.
            --         -- <c-h> is similar, except moving you backwards.
            --         ['<C-l>'] = cmp.mapping(function()
            --             if luasnip.expand_or_locally_jumpable() then
            --                 luasnip.expand_or_jump()
            --             end
            --         end, { 'i', 's' }),
            --         ['<C-h>'] = cmp.mapping(function()
            --             if luasnip.locally_jumpable(-1) then
            --                 luasnip.jump(-1)
            --             end
            --         end, { 'i', 's' }),
            --
            --         -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
            --         --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
            --     },
            --     sources = {
            --         {
            --             name = 'lazydev',
            --             -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            --             group_index = 0,
            --         },
            --         { name = 'nvim_lsp' },
            --         { name = 'luasnip' },
            --         { name = 'path' },
            --     },
            -- }
        end,
    },
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
