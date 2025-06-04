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
-- vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<CR>', {})
-- vim.keymap.set('n', '<leader>f', function() Snacks.picker.files(SELECT) end, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>b', ':Barbecue toggle<CR>', {})
-- vim.keymap.set('n', '<leader>b', function() Snacks.picker.buffers() end, {})
-- vim.keymap.set('n', '<leader>b', require("buvvers").toggle, {})
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
-- vim.keymap.set('n', '<leader>/', function() Snacks.picker.lines() end, {})
vim.keymap.set('n', '<leader>s', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>s', function() Snacks.picker.grep(IVY) end, {})
vim.keymap.set('n', '<leader>d', function()
    builtin.lsp_document_symbols({
        symbols = { "method", "function", "class" },
    })
end, {})
-- vim.keymap.set('n', '<leader>d', function() Snacks.picker.lsp_symbols(IVY) end, {})
-- vim.keymap.set('n', '<leader>ws', function()
--     builtin.lsp_dynamic_workspace_symbols({
--         symbols = { "method", "function", "class" }
--     })
-- end, {})
-- vim.keymap.set('n', '<leader>ws', function() Snacks.picker.lsp_workspace_symbols(IVY) end, {})
vim.keymap.set('n', '<leader>w', builtin.grep_string, {})
-- vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_bcommits, {})
-- vim.keymap.set('n', '<leader>gf', function() Snacks.picker.git_log_file(IVY) end, {})
-- vim.keymap.set('n', '<leader>gl', function() Snacks.picker.git_log_line(IVY) end, {})
vim.keymap.set('n', '<leader>gb', builtin.git_bcommits_range, {})
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

-- vim.keymap.set('n', '<leader>pp', ":NeovimProjectDiscover<CR>", {})
vim.keymap.set('n', '<leader>p', ":Telescope project<CR>", {})

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('project')

require("telescope").setup({
    defaults = {
        prompt_prefix        = " ",
        selection_caret      = " ",
        entry_prefix         = " ",
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
        winblend             = 0,
        border               = {},
        borderchars          = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        color_devicons       = true,
        layout_config        = {
            horizontal = {
                prompt_position = "top",
                width = { padding = 5 },
                height = { padding = 5 },
                preview_width = 0.7,
            },
            vertical = {
                prompt_position = "top",
                mirror = false,
                width = { padding = 5 },
                height = { padding = 5 },
                preview_cutoff = 3
            },
            height = 0.9,
        },
    },
    pickers = {
        find_files = {
            -- theme = "dropdown",
            -- layout_config = {
            --     height = 0.7,
            --     -- preview_width = 0.7,
            -- },
            layout_strategy = "center",
            previewer = false,
            prompt_title = "󱔗 Find Files",
            preview_title = " Preview",
        },
        buffers = {
            -- theme = "dropdown",
            -- layout_config = {
            --     height = 0.7,
            --     -- preview_width = 0.7,
            -- },
            layout_strategy = "center",
            previewer = false,
            prompt_title = "󰷈 Buffers",
            preview_title = " Preview",
        },
        current_buffer_fuzzy_find = {
            -- theme = "dropdown",
            layout_config = {
                height = 0.9,
                -- preview_width = 0.7,
            },
            -- layout_strategy = "center",
            previewer = false,
            prompt_title = "󰱼 Current Buffer Search",
        },
        live_grep = {
            -- theme = "ivy",
            -- layout_config = {
            --     height = 0.9,
            --     preview_width = 0.7,
            -- }
            prompt_title = "󰥨 Live Grep",
            preview_title = " Preview",
        },
        grep_string = {
            -- theme = "ivy",
            -- layout_config = {
            --     height = 0.9,
            --     preview_width = 0.7,
            -- }
            -- prompt_title = "󰥨 Grep String",
            preview_title = " Preview",
        },
        lsp_document_symbols = {
            -- theme = "ivy",
            -- layout_config = {
            --     height = 0.9,
            --     preview_width = 0.7,
            -- }
            prompt_title = " Document Symbols",
            preview_title = " Preview",
        },
        lsp_dynamic_workspace_symbols = {
            -- theme = "ivy",
            -- layout_config = {
            --     height = 0.9,
            --     preview_width = 0.7,
            -- }
            prompt_title = " Workspace Symbols",
            preview_title = " Preview",
        },
        lsp_references = {
            -- theme = "ivy",
            -- layout_config = {
            --     height = 0.9,
            --     preview_width = 0.7,
            -- }
            prompt_title = " Symbol References",
            preview_title = " Preview",
        },
        git_files = {
            -- theme = "ivy",
            -- layout_config = {
            --     height = 0.9,
            --     preview_width = 0.7,
            -- }
            prompt_title = "󰊢 Git Files",
            preview_title = " Preview",
        },
        git_bcommits = {
            -- theme = "ivy",
            layout_strategy = "vertical",
            layout_config = {
                height = 0.9,
                -- preview_width = 0.7,
                preview_height = 0.6,
            },
            prompt_title = "󰊢 Git File Log",
            preview_title = " Preview",
        },
        git_bcommits_range = {
            -- theme = "ivy",
            layout_strategy = "vertical",
            layout_config = {
                height = 0.9,
                -- preview_width = 0.7,
                preview_height = 0.6,
            },
            prompt_title = "󰊢 Git Line Log",
            preview_title = " Preview",
        },
        git_status = {
            -- theme = "ivy",
            -- layout_strategy = "vertical",
            layout_config = {
                height = 0.9,
                preview_width = 0.7,
                -- preview_height = 0.6,
            },
            prompt_title = "󰊢 Git Status",
            preview_title = " Preview",
        },
        git_commits = {
            layout_strategy = "vertical",
            -- theme = "ivy",
            layout_config = {
                height = 0.9,
                -- preview_width = 0.7,
                preview_height = 0.6,
            },
            -- previewer = false,
            prompt_title = "󰊢 Git Log",
            preview_title = " Preview",
        },
        colorscheme = {
            enable_preview = true,
        }
    },
    extensions = {
        fzf = {},
        project = {
            base_dirs = {
                { path = "~/Code" },
                { path = "~/.config" }
            },
        },
    }
})

-- CONFIG
local blend = 50

vim.api.nvim_create_autocmd("FileType", {
    pattern = "TelescopePrompt",
    callback = function(ctx)
        local backdropName = "TelescopeBackdrop"
        local telescopeBufnr = ctx.buf

        -- `Telescope` does not set a zindex, so it uses the default value
        -- of `nvim_open_win`, which is 50: https://neovim.io/doc/user/api.html#nvim_open_win()
        local telescopeZindex = 50

        local backdropBufnr = vim.api.nvim_create_buf(false, true)
        local winnr = vim.api.nvim_open_win(backdropBufnr, false, {
            relative = "editor",
            border = "none",
            row = 0,
            col = 0,
            width = vim.o.columns,
            height = vim.o.lines,
            focusable = false,
            style = "minimal",
            zindex = telescopeZindex - 1, -- ensure it's below the reference window
        })

        vim.api.nvim_set_hl(0, backdropName, { bg = "#000000", default = true })
        vim.wo[winnr].winhighlight = "Normal:" .. backdropName
        vim.wo[winnr].winblend = blend
        vim.bo[backdropBufnr].buftype = "nofile"

        -- close backdrop when the reference buffer is closed
        vim.api.nvim_create_autocmd({ "WinClosed", "BufLeave" }, {
            once = true,
            buffer = telescopeBufnr,
            callback = function()
                if vim.api.nvim_win_is_valid(winnr) then vim.api.nvim_win_close(winnr, true) end
                if vim.api.nvim_buf_is_valid(backdropBufnr) then
                    vim.api.nvim_buf_delete(backdropBufnr, { force = true })
                end
            end,
        })
    end,
})
