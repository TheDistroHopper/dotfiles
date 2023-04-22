function ColorMyPencils(color)
    color = color or "catppuccin-mocha"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()

require("nvim-highlight-colors").setup {
    render = 'background', -- or 'foreground' or 'first_column'
    enable_named_colors = true, -- or false
    enable_tailwind = true, -- or false
}
