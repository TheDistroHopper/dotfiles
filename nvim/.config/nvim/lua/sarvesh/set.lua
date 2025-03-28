vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.cursorline = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 4
-- vim.opt.signcolumn = "yes"
-- vim.opt.signcolumn = "yes:1"
vim.opt.signcolumn = "number"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.g.mapleader = " "
