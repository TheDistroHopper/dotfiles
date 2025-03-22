local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', builtin.resume, {})
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>s', builtin.live_grep, {})
vim.keymap.set('n', '<leader>d', function()
    builtin.lsp_document_symbols({
        symbols = { "method", "function", "class" }
    })
end, {})
vim.keymap.set('n', '<leader>ws', function()
    builtin.lsp_workspace_symbols({
        symbols = { "method", "function", "class" }
    })
end, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
-- vim.keymap.set('n', 'gr', builtin.lsp_references, {})
-- vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
-- vim.keymap.set('n', '<leader>s', function()
--     builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)

require('telescope').load_extension('fzf')

require("telescope").setup({
    defaults = {
        prompt_prefix        = "   ",
        selection_caret      = " ",
        entry_prefix         = " ",
        sorting_strategy     = "ascending",
        file_ignore_patterns = {
            "^%.git/",
            "^%.git$",
            ".DS_Store",
        },
        mappings             = {
            n = {
                ["<C-c>"] = require("telescope.actions").close,
            },
            i = {
                ["<C-s>"] = "select_horizontal"
            }
        },
        winblend             = 10,
        border               = {},
        borderchars          = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        color_devicons       = true,
    },
    pickers = {
        find_files = {
            theme = "ivy",
            layout_config = {
                height = 0.9,
                preview_width = 0.6,
            },
        },
        buffers = {
            theme = "ivy",
            layout_config = {
                height = 0.9,
                preview_width = 0.6,
            }
        },
        current_buffer_fuzzy_find = {
            theme = "ivy",
            layout_config = {
                height = 0.9,
                preview_width = 0.6,
            }
        },
        live_grep = {
            theme = "ivy",
            layout_config = {
                height = 0.9,
                preview_width = 0.6,
            }
        },
        lsp_document_symbols = {
            theme = "ivy",
            layout_config = {
                height = 0.9,
                preview_width = 0.6,
            }
        },
        lsp_dynamic_workspace_symbols = {
            theme = "ivy",
            layout_config = {
                height = 0.9,
                preview_width = 0.6,
            }
        },
        lsp_references = {
            theme = "ivy",
            layout_config = {
                height = 0.9,
                preview_width = 0.6,
            }
        },
        git_files = {
            theme = "ivy",
            layout_config = {
                height = 0.9,
                preview_width = 0.6,
            }
        },
        git_status = {
            theme = "ivy",
            layout_config = {
                height = 0.9,
                preview_width = 0.6,
            }
        },
        git_commits = {
            theme = "ivy",
            layout_config = {
                height = 0.9,
                preview_width = 0.6,
            }
        },
    },
    extensions = {
        fzf = {}
    }
})
