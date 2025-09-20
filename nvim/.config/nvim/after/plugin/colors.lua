require("tokyonight").setup({
    on_colors = function ()
    end,
    on_highlights = function(hl, c)
        -- local prompt = "#2d3149"
        local prompt = c.blue
        hl.TelescopeNormal = {
            -- bg = c.bg_dark,
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
            bg = c.blue,
            -- fg = prompt,
        }
        hl.TelescopePreviewTitle = {
            -- bg = c.bg_dark,
            bg = c.blue,
            -- fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            -- bg = "#7aa2f7",
            -- fg = c.bg_dark,
        }
      hl.SnacksPicker = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }
      hl.SnacksPickerBorder = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.SnacksPickerInput = {
        -- bg = prompt,
        bg = c.bg_dark,
        -- fg = c.bg_dark,
      }
      hl.SnacksPickerInputTitle = {
        fg = c.bg_dark,
        bg = c.blue,
      }
      hl.SnacksPickerBoxTitle = {
        -- bg = prompt,
        -- fg = prompt
        fg = c.bg_dark,
        bg = c.blue,
      }
      hl.SnacksPickerBoxBorder = {
        bg = c.bg_dark,
        -- fg = c.bg_dark,
        fg = prompt,
      }
      hl.SnacksPickerPreviewBorder = {
        bg = c.bg_dark,
        -- fg = c.bg_dark,
        fg = prompt,
      }
      hl.SnacksPickerPreviewTitle = {
        fg = c.bg_dark,
        bg = c.blue,
      }
      hl.SnacksPickerInputBorder = {
        fg = prompt,
        bg = c.bg_dark,
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
