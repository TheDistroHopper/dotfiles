require("tokyonight").setup({
    on_colors = function ()
    end,
    on_highlights = function(hl, c)
        local prompt = c.blue
        hl.SnacksTitle = {
            fg = c.bg_dark,
            bg = c.blue,
        }
        hl.SnacksPickerInputTitle = {
            bg = prompt,
            fg = c.bg_dark,
        }
        hl.SnacksPickerInput = {
            bg = c.bg_dark,
            fg = prompt,
        }
        hl.SnacksPickerInputBorder = {
            bg = c.bg_dark,
            fg = prompt,
        }
        hl.SnacksPickerBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
        }
        hl.SnacksPickerBoxBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
        }
        hl.SnacksPickerPreview = {
            bg = c.bg,
        }
        hl.SnacksPickerPreviewBorder = {
            bg = c.bg,
            fg = c.bg,
        }
        hl.SnacksPickerPreviewTitle = {
            fg = c.bg_dark,
            bg = prompt,
        }

        -- Mini
        hl.MiniFilesBorder          = { fg = prompt, bg = c.bg_dark }
        hl.MiniFilesTitle    = { fg = c.blue}
        hl.MiniFilesTitleFocused           = {fg=c.blue}
        hl.MiniPickBorder = {fg=c.blue}
        hl.MiniPickPrompt = {fg=c.blue}

    end,
})

function ColorMyPencils(color)
    color = color or "tokyonight-night"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
