-- Statusline --
-- local statusline = require 'mini.statusline'
-- statusline.setup { use_icons = true }

local statusline = require('mini.statusline')

statusline.setup({
  use_icons = true,
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 150 })
      local filename = MiniStatusline.section_filename({ trunc_width = 150 })
      local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 150 })
      local location = MiniStatusline.section_location({ trunc_width = 75 })

      return MiniStatusline.combine_groups({
        { hl = mode_hl, strings = { mode } },
        '%<',
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        '%=',
        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
        { hl = mode_hl, strings = { location } },
      })
    end
  }
})

-- Animations --
-- require('mini.animate').setup { cursor = {
--     enable = false
-- } }

-- Highlight word under cursor
require('mini.cursorword').setup({})

-- Tabline --
-- require('mini.tabline').setup({})

-- Surround --
require('mini.surround').setup({})

-- Autopairs --
require('mini.pairs').setup({})
