vim.keymap.set("n", "<M-\\>", function() Snacks.terminal.toggle() end)
vim.keymap.set("t", "<M-\\>", function() Snacks.terminal.toggle() end)
vim.keymap.set("n", "<C-\\>", function() Snacks.terminal.toggle() end)
vim.keymap.set("t", "<C-\\>", function() Snacks.terminal.toggle() end)

vim.keymap.set("n", "<C-`>", function() Snacks.terminal.toggle(false, { win = { style = 'help' } }) end)
vim.keymap.set("t", "<C-`>", function() Snacks.terminal.toggle(false, { win = { style = 'help' } }) end)
vim.keymap.set("n", "<M-`>", function() Snacks.terminal.toggle(false, { win = { style = 'help' } }) end)
vim.keymap.set("t", "<M-`>", function() Snacks.terminal.toggle(false, { win = { style = 'help' } }) end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tms<CR>")
-- vim.keymap.set("n", "M-f", vim.lsp.buf.format)
-- vim.keymap.set("n", "<leader>a", ":Alpha<CR>")
-- vim.keymap.set("n", "<leader>a", function() Snacks.dashboard() end)
vim.keymap.set("n", "<leader>q", ":bd<CR>")
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")
-- vim.keymap.set("n", "<Tab>", ":BufferNext<CR>")
-- vim.keymap.set("n", "<S-Tab>", ":BufferPrevious<CR>")
-- vim.keymap.set("n", "<M-Tab>", ":BufferPick<CR>")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>ca", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>x", ":q!<CR>")

-- copilot auto-completion
-- vim.keymap.set('i', '<C-d>', 'copilot#Accept("\\<CR>")', {
--     expr = true,
--     replace_keycodes = false
-- })
vim.keymap.set("n", "<leader>t", ":TogglePickers<CR>")
vim.keymap.set("n", "<leader>gg", function() MiniDiff.toggle_overlay() end)
-- vim.g.copilot_no_tab_map = true
