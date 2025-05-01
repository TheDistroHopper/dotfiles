-- Define diagnostic signs
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Set up initial diagnostic configuration
vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    underline = true,
    update_in_insert = true,
    severity_sort = false,
})

-- diagflow setup
-- require('diagflow').setup()
require('diagflow').setup({
    enable = true,
    max_width = 60,     -- The maximum width of the diagnostic messages
    max_height = 10,    -- the maximum height per diagnostics
    severity_colors = { -- The highlight groups to use for each diagnostic severity level
        error = "DiagnosticFloatingError",
        warning = "DiagnosticFloatingWarn",
        info = "DiagnosticFloatingInfo",
        hint = "DiagnosticFloatingHint",
    },
    format = function(diagnostic)
        return diagnostic.message
    end,
    gap_size = 1,
    scope = 'line', -- 'cursor', 'line' this changes the scope, so instead of showing errors under the cursor, it shows errors on the entire line.
    padding_top = 0,
    padding_right = 0,
    text_align = 'right',                                  -- 'left', 'right'
    placement = 'top',                                     -- 'top', 'inline'
    inline_padding_left = 0,                               -- the padding left when the placement is inline
    update_event = { 'DiagnosticChanged', 'BufReadPost' }, -- the event that updates the diagnostics cache
    toggle_event = {},                                     -- if InsertEnter, can toggle the diagnostics on inserts
    show_sign = false,                                     -- set to true if you want to render the diagnostic sign before the diagnostic message
    render_event = { 'DiagnosticChanged', 'CursorMoved' },
    border_chars = {
        top_left = "┌",
        top_right = "┐",
        bottom_left = "└",
        bottom_right = "┘",
        horizontal = "─",
        vertical = "│"
    },
    show_borders = true,
})

-- Set up completion
-- local cmp = require('cmp')
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
--
-- cmp.setup({
--     sources = {
--         { name = 'path' },
--         { name = 'nvim_lsp' },
--         { name = 'nvim_lua' },
--         { name = 'luasnip', keyword_length = 2 },
--         { name = 'buffer',  keyword_length = 3 },
--     },
--     formatting = lsp_zero.cmp_format(),
--     mapping = cmp.mapping.preset.insert({
--         ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--         ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--         ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--         ['<C-Space>'] = cmp.mapping.complete(),
--     }),
-- })

-- Winbar
-- require("barbecue").setup({
--     theme = {
--         normal = { fg = "#c4a7e7", bg = "#2a273f" },
--         -- normal = { bg = "#2a273f" },
--         dirname = { fg = "#737aa2" },
--         basename = { bold = true },
--     },
-- })
