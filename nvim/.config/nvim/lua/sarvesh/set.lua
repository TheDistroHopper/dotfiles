vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.linespace = 15

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.cursorline = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- vim.opt.scrolloff = 4
-- vim.opt.signcolumn = "yes"
-- vim.opt.signcolumn = "yes:1"
vim.opt.signcolumn = "number"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.g.mapleader = " "


if vim.g.neovide then
    vim.opt.guifont = "Mononoki Nerd Font:h15"
    -- vim.opt.guifont = "Liga SFMono Nerd Font:h14"
    -- Put anything you want to happen only in Neovide here
    -- Helper function for transparency formatting
    -- local alpha = function()
    --     return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
    -- end
    -- vim.g.neovide_background_color = "#0f1117" .. alpha()
    -- g:neovide_opacity should be 0 if you want to unify transparency of content and title bar.
    vim.g.neovide_opacity = 1
    vim.g.transparency = 1
    vim.g.neovide_window_blurred = true
    vim.g.neovide_floating_shadow = false
    vim.g.neovide_floating_z_height = 10
    vim.g.neovide_light_angle_degrees = 45
    vim.g.neovide_light_radius = 5
    vim.g.neovide_show_border = false
    vim.g.neovide_fullscreen = true
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_animation_length = 0.0
    vim.g.neovide_input_macos_option_key_is_meta = "only_left"
    vim.g.neovide_underline_stroke_scale = 1.0
    vim.g.neovide_cursor_short_animation_length = 0.0
    vim.g.neovide_scroll_animation_length = 0.15
    vim.g.neovide_cursor_vfx_mode = ""
    vim.keymap.set("v", "<D-c>", '"+y')         -- Copy
    vim.keymap.set("n", "<D-v>", '"+P')         -- Paste normal mode
    vim.keymap.set("v", "<D-v>", '"+P')         -- Paste visual mode
    vim.keymap.set("c", "<D-v>", "<C-R>+")      -- Paste command mode
    vim.keymap.set("i", "<D-v>", '<ESC>"+p')    -- Paste insert mode"

    vim.g.neovide_scale_factor = 1.0
    local change_scale_factor = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-=>", function()
        change_scale_factor(1.25)
    end)
    vim.keymap.set("n", "<C-->", function()
        change_scale_factor(1 / 1.25)
    end)
end
