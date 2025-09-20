local statusline = require('mini.statusline')
local function section_location_lines(args)
  local line = vim.fn.line('.')
  local total = vim.fn.line('$')

  -- Handle truncation if window is too narrow
  if vim.api.nvim_win_get_width(0) < (args.trunc_width or 80) then
    return string.format('%d│%d', line, total)
  end

  -- Normal form can still be full if you want
  return string.format('%d|%d│%d|%d',
    line, total,
    vim.fn.col('.'), vim.fn.col('$') - 1
  )
end

statusline.setup({
    use_icons = true,
    content = {
        active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 150 })
            -- local filename = MiniStatusline.section_filename({ trunc_width = 150 })
            local git = MiniStatusline.section_git({ trunc_width = 40 })
            local diff = MiniStatusline.section_diff({ trunc_width = 75 })

            return MiniStatusline.combine_groups({
                { hl = mode_hl,                  strings = { mode } },
                -- { hl = "MiniStatuslineFilename",                  strings = { filename } },
                '%<',
                { hl = 'MiniStatuslineFilename', strings = { git } },
                { hl = 'MiniStatuslineFilename', strings = { diff } },
                '%=',
                { hl = mode_hl, strings = { section_location_lines({trunc_width = 150}) } },
            })
        end
    }
})

-- Highlight word under cursor
-- require('mini.cursorword').setup({})

-- Tabline --
require('mini.tabline').setup({})

require('mini.icons').setup()
require('mini.starter').setup()
require('mini.diff').setup()

local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

-- Surround --
-- require('mini.surround').setup({})

-- Autopairs --
require('mini.pairs').setup({})

-- Completion --
-- require('mini.completion').setup()

-- Picker --
require('mini.pick').setup()

require('mini.extra').setup()

-- Files
-- require('mini.files').setup()
-- Hook into MiniFiles events
-- require('mini.files').setup({
--   windows = {
--     preview = false,
--     width_preview = 100,
--     width_focus = 100,
--   },
--   mappings = {
--     -- close = '<Esc>'
--     close = '<Esc>'
--   },
-- })

