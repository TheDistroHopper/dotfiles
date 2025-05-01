-- local statusline = require 'mini.statusline'
-- statusline.setup { use_icons = true }

local statusline = require('mini.statusline')

statusline.setup({
  use_icons = true,
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 150 })
      -- local filename = MiniStatusline.section_filename({ trunc_width = 150 })
      local git = MiniStatusline.section_git({ trunc_width = 40 })
      local diff = MiniStatusline.section_diff({ trunc_width = 75 })
      -- local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 150 })
      local location = MiniStatusline.section_location({ trunc_width = 75 })

      return MiniStatusline.combine_groups({
        { hl = mode_hl, strings = { mode } },
        '%<',
        -- { hl = 'MiniStatuslineFilename', strings = { filename } },
        { hl = 'MiniStatuslineFilename', strings = { git } },
        { hl = 'MiniStatuslineFilename', strings = { diff } },
        '%=',
        -- { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
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
-- require('mini.cursorword').setup({})

-- Tabline --
-- require('mini.tabline').setup({})

require('mini.icons').setup()
require("buvvers").setup({
    buvvers_buf_name = "Buffers",
	buffer_handle_list_to_buffer_name_list = function(handle_l)
		local name_l

		local default_function = require("buvvers.buffer_handle_list_to_buffer_name_list")
		name_l = default_function(handle_l)

		for n, name in ipairs(name_l) do
			local icon, hl = MiniIcons.get("file", name)
			name_l[n] = {
				{" " .. icon .. " ", hl},
				name,
			}
		end

		return name_l
	end,
})
require("buvvers").open()

-- Surround --
-- require('mini.surround').setup({})

-- Autopairs --
require('mini.pairs').setup({})

-- Completion --
require('mini.completion').setup()

-- Files
-- require('mini.files').setup()
