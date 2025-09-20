local use_snacks = true

-- Command to toggle between Snacks and Mini
vim.api.nvim_create_user_command("TogglePickers", function()
  use_snacks = not use_snacks
  if use_snacks then
    vim.notify("Switched to Snacks pickers", vim.log.levels.INFO)
  else
    vim.notify("Switched to Mini pickers", vim.log.levels.INFO)
  end
end, {})

-- Helper: wrapper to switch pickers
local function picker(fn_snacks, fn_mini)
  return function()
    if use_snacks then
      return fn_snacks()
    else
      return fn_mini()
    end
  end
end

-- Keymaps with toggleable pickers
DEFAULT = {
    layout = {
        preset = "default",
        preview = false
    }
}

VSCODE = {
    layout = {
        preset = "vscode",
    }
}

vim.keymap.set('n', '<leader><leader>', picker(
  function() Snacks.picker.resume() end,
  function() MiniPick.builtin.resume() end
), {})

vim.keymap.set('n', '<leader>f', picker(
  function() Snacks.picker.files(DEFAULT) end,
  function() MiniPick.builtin.files() end
), {})

vim.keymap.set('n', '<leader>b', picker(
  function() Snacks.picker.buffers(DEFAULT) end,
  function() MiniPick.builtin.buffers() end
), {})

vim.keymap.set('n', '<leader>/', picker(
  function() Snacks.picker.lines(VSCODE) end,
  function() MiniExtra.pickers.buf_lines({ scope = "current" }) end
), {})

vim.keymap.set('n', '<leader>s', picker(
  function() Snacks.picker.grep() end,
  function() MiniPick.builtin.grep_live() end
), {})

vim.keymap.set('n', '<leader>d', picker(
  function() Snacks.picker.lsp_symbols() end,
  function() MiniExtra.pickers.lsp({ scope = "document_symbol" }) end
), {})

vim.keymap.set('n', '<leader>D', picker(
  function() Snacks.picker.lsp_workspace_symbols() end,
  function() MiniExtra.pickers.lsp({ scope = "workspace_symbol" }) end
), {})

vim.keymap.set('n', '<leader>w', picker(
    function() Snacks.picker.grep_word() end,
    function()
        local word = vim.fn.expand('<cword>')
        vim.cmd("Pick grep pattern='" .. word .. "'")
    end
), {})

vim.keymap.set('n', '<leader>gf', picker(
  function() Snacks.picker.git_log_file(DEFAULT) end,
  function()
      vim.cmd("Pick git_commits path='%'")
  end
), {})

vim.keymap.set('n', '<leader>gl', picker(
  function() Snacks.picker.git_log_line(DEFAULT) end,
  function() Snacks.git.blame_line() end
), {})

vim.keymap.set('n', '<leader>gs', picker(
  function() Snacks.picker.git_status(DEFAULT) end,
  function()
      vim.cmd("Git | ZenMode")
  end
), {})

vim.keymap.set('n', '<leader>gc', picker(
  function() Snacks.picker.git_log(DEFAULT) end,
  function() MiniExtra.pickers.git_commits() end
), {})

vim.keymap.set('n', 'gr', picker(
  function() Snacks.picker.lsp_references() end,
  function()
      vim.cmd("Pick lsp scope='references'")
  end
), {})

vim.keymap.set('n', 'gd', picker(
  function() Snacks.picker.lsp_definitions() end,
  function()
      vim.cmd("Pick lsp scope='definition'")
  end
), {})

vim.keymap.set('n', '<leader>p', picker(
  function() Snacks.picker.projects() end,
  function() Snacks.picker.projects() end
), {})

