-- Snacks Picker layouts
SELECT = {
    layout = {
        preset = "select",
        fullscreen = false,
    }
}

IVY = {
    layout = {
        preset = "ivy",
        fullscreen = true,
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', builtin.resume, {})
-- vim.keymap.set('n', '<leader><leader>', function() Snacks.picker.resume() end, {})
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>f', function() Snacks.picker.files(SELECT) end, {})
-- vim.keymap.set('n', '<leader>b', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>b', function() Snacks.picker.buffers(SELECT) end, {})
vim.keymap.set('n', '<leader>b', require("buvvers").toggle, {})
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
-- vim.keymap.set('n', '<leader>/', function() Snacks.picker.lines() end, {})
vim.keymap.set('n', '<leader>s', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>s', function() Snacks.picker.grep(IVY) end, {})
vim.keymap.set('n', '<leader>d', function()
    builtin.lsp_document_symbols({
        symbols = { "method", "function", "class" }
    })
end, {})
-- vim.keymap.set('n', '<leader>d', function() Snacks.picker.lsp_symbols(IVY) end, {})
vim.keymap.set('n', '<leader>ws', function()
    builtin.lsp_workspace_symbols({
        symbols = { "method", "function", "class" }
    })
end, {})
-- vim.keymap.set('n', '<leader>ws', function() Snacks.picker.lsp_workspace_symbols(IVY) end, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>gf', function() Snacks.picker.git_log_file(IVY) end, {})
-- vim.keymap.set('n', '<leader>gl', function() Snacks.picker.git_log_line(IVY) end, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
-- vim.keymap.set('n', '<leader>gs', function() Snacks.picker.git_status(IVY) end, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
-- vim.keymap.set('n', '<leader>gc', function() Snacks.picker.git_log(IVY) end, {})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
-- vim.keymap.set('n', 'gr', function() Snacks.picker.lsp_references(IVY) end, {})
vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
-- vim.keymap.set('n', 'gd', function() Snacks.picker.lsp_definitions(IVY) end, {})
-- vim.keymap.set('n', '<leader>s', function()
--     builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)

require('telescope').load_extension('fzf')

require("telescope").setup({
    defaults = {
        -- prompt_prefix        = " >  ",
        -- selection_caret      = " ",
        -- entry_prefix         = " ",
        layout_strategy      = "horizontal",
        sorting_strategy     = "ascending",
        file_ignore_patterns = {
            "^%.git/",
            "^%.git$",
            ".DS_Store",
        },
        path_display         = {
            "filename_first",
        },
        mappings             = {
            n = {
                ["<C-c>"] = require("telescope.actions").close,
            },
            i = {
                ["<C-s>"] = "select_horizontal"
            }
        },
        winblend             = 7,
        border               = {},
        borderchars          = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        color_devicons       = true,
        layout_config        = {
            horizontal = {
                prompt_position = "top",
                width = { padding = 0 },
                height = { padding = 0 },
                preview_width = 0.7,
            },
            vertical = {
                prompt_position = "top",
                mirror = true,
                width = { padding = 0 },
                height = { padding = 0 },
                preview_cutoff = 3
            },
            height = 0.9,
        },
    },
    pickers = {
        find_files = {
            -- theme = "ivy",
            -- layout_config = {
            --     height = 0.9,
            --     preview_width = 0.6,
            -- },
            layout_strategy = "center",
            previewer = false,
        },
        buffers = {
            -- theme = "ivy",
            -- layout_config = {
            --     height = 0.9,
            --     preview_width = 0.6,
            -- }
            layout_strategy = "center",
            previewer = false,
        },
        current_buffer_fuzzy_find = {
            -- theme = "ivy",
            -- layout_config = {
            --     height = 0.9,
            --     preview_width = 0.6,
            -- }
            layout_strategy = "center",
            previewer = false,
        },
        -- live_grep = {
        --     theme = "ivy",
        --     layout_config = {
        --         height = 0.9,
        --         preview_width = 0.6,
        --     }
        -- },
        -- lsp_document_symbols = {
        --     theme = "ivy",
        --     layout_config = {
        --         height = 0.9,
        --         preview_width = 0.6,
        --     }
        -- },
        -- lsp_dynamic_workspace_symbols = {
        --     theme = "ivy",
        --     layout_config = {
        --         height = 0.9,
        --         preview_width = 0.6,
        --     }
        -- },
        -- lsp_references = {
        --     theme = "ivy",
        --     layout_config = {
        --         height = 0.9,
        --         preview_width = 0.6,
        --     }
        -- },
        -- git_files = {
        --     theme = "ivy",
        --     layout_config = {
        --         height = 0.9,
        --         preview_width = 0.6,
        --     }
        -- },
        -- git_status = {
        --     theme = "ivy",
        --     layout_config = {
        --         height = 0.9,
        --         preview_width = 0.6,
        --     }
        -- },
        git_commits = {
            layout_strategy = "vertical",
            -- theme = "ivy",
            -- layout_config = {
            --     height = 0.9,
            --     preview_width = 0.6,
            -- }
        },
        colorscheme = {
            enable_preview = true,
        },
    },
    extensions = {
        fzf = {}
    }
})
