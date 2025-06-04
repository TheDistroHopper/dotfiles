-- local statusline = require 'mini.statusline'
-- statusline.setup { use_icons = true }

-- local statusline = require('mini.statusline')
--
-- statusline.setup({
--     use_icons = true,
--     content = {
--         active = function()
--             local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 150 })
--             -- local filename = MiniStatusline.section_filename({ trunc_width = 150 })
--             local git = MiniStatusline.section_git({ trunc_width = 40 })
--             local diff = MiniStatusline.section_diff({ trunc_width = 75 })
--             -- local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 150 })
--             local location = MiniStatusline.section_location({ trunc_width = 75 })
--
--             return MiniStatusline.combine_groups({
--                 { hl = mode_hl,                  strings = { mode } },
--                 '%<',
--                 -- { hl = 'MiniStatuslineFilename', strings = { filename } },
--                 { hl = 'MiniStatuslineFilename', strings = { git } },
--                 { hl = 'MiniStatuslineFilename', strings = { diff } },
--                 '%=',
--                 -- { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
--                 { hl = mode_hl, strings = { location } },
--             })
--         end
--     }
-- })

-- Animations --
-- require('mini.animate').setup { cursor = {
--     enable = false
-- } }

-- Highlight word under cursor
-- require('mini.cursorword').setup({})

-- Tabline --
-- require('mini.tabline').setup({})

-- require('mini.icons').setup()
-- require("buvvers").setup({
--     buvvers_buf_name = " 󰈙 Buffers",
--     buffer_handle_list_to_buffer_name_list = function(handle_l)
--         local name_l
--
--         local default_function = require("buvvers.buffer_handle_list_to_buffer_name_list")
--         name_l = default_function(handle_l)
--
--         for n, name in ipairs(name_l) do
--             local icon, hl = MiniIcons.get("file", name)
--             name_l[n] = {
--                 { " " .. icon .. " ", hl },
--                 name,
--             }
--         end
--
--         return name_l
--     end,
-- })
-- require("buvvers").open()

-- Surround --
-- require('mini.surround').setup({})

-- Autopairs --
require('mini.pairs').setup({})

-- Completion --
-- require('mini.completion').setup()

-- Files
-- require('mini.files').setup()
-- Hook into MiniFiles events
require('mini.files').setup({
  windows = {
    preview = false,
    width_preview = 100,
    width_focus = 100,
  },
  mappings = {
    -- close = '<Esc>'
    close = '<Esc>'
  },
})

vim.cmd [[
  highlight MiniFilesNormal guibg=None
  "highlight MiniFilesBorder guibg=#000000
  "highlight MiniFilesTitle guibg=#000000
  "highlight MiniFilesTitleFocused guibg=#000000
  "highlight MiniFilesCursorLine guibg=#000000
]]

-- Map
-- local map = require('mini.map')
-- map.setup({
--     integrations = {
--         -- map.gen_integration.builtin_search(),
--         map.gen_integration.diff(),
--         -- map.gen_integration.diagnostic(),
--     },
-- })

-- require("noice").setup({
--     lsp = {
--         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
--         override = {
--             ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--             ["vim.lsp.util.stylize_markdown"] = true,
--             ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
--         },
--     },
--     -- you can enable a preset for easier configuration
--     presets = {
--         bottom_search = true,         -- use a classic bottom cmdline for search
--         command_palette = true,       -- position the cmdline and popupmenu together
--         long_message_to_split = true, -- long messages will be sent to a split
--         inc_rename = false,           -- enables an input dialog for inc-rename.nvim
--         lsp_doc_border = false,       -- add a border to hover docs and signature help
--     },
-- })

-- Setup notify background
-- require("notify").setup({
--     background_colour = "#000000",
--     merge_duplicates = false,
-- })

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = {},
        lualine_x = { 'encoding', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
