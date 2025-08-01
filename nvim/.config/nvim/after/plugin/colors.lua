require("tokyonight").setup({
    on_highlights = function(hl, c)
        local prompt = "#2d3149"
        hl.TelescopeNormal = {
            bg = c.bg_dark,
            fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
            bg = prompt,
        }
        hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt,
        }
        hl.TelescopePromptTitle = {
            -- bg = prompt,
            bg = "#7aa2f7",
            -- fg = prompt,
        }
        hl.TelescopePreviewTitle = {
            -- bg = c.bg_dark,
            bg = "#7aa2f7",
            -- fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            -- bg = "#7aa2f7",
            -- fg = c.bg_dark,
        }
    end,
})

function ColorMyPencils(color)
    color = color or "tokyonight-night"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()

require("nvim-highlight-colors").setup {
    render = 'background',      -- or 'foreground' or 'first_column'
    enable_named_colors = true, -- or false
    enable_tailwind = true,     -- or false
}
