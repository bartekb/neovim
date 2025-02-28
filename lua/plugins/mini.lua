return {
  'echasnovski/mini.nvim',
  version = false, -- Use the latest version
  config = function()
    require('mini.move').setup {
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = '<M-LEFT>',
        right = '<M-RIGHT>',
        down = '<M-DOWN>',
        up = '<M-UP>',

        -- Move current line in Normal mode
        line_left = '<M-LEFT>',
        line_right = '<M-RIGHT>',
        line_down = '<M-DOWN>',
        line_up = '<M-UP>',
      },
    }

    -- require('mini.cursorword').setup {}

    -- require('mini.starter').setup {}

    require('mini.icons').setup { style = 'glyph' }

    -- See :help MiniAi-textobject-builtin
    require('mini.ai').setup { n_lines = 500 }

    -- See :help MiniComment.config
    require('mini.comment').setup {}

    -- See :help MiniSurround.config
    require('mini.surround').setup {}

    -- See :help MiniNotify.config
    require('mini.notify').setup {
      lsp_progress = { enable = false },
    }

    -- See :help MiniNotify.make_notify()
    vim.notify = require('mini.notify').make_notify {}

    require('mini.bufremove').setup {}

    require('mini.git').setup {}

    require('mini.diff').setup {
      view = {
        style = 'sign',
      },
    }

    -- local mini_statusline = require 'mini.statusline'
    --
    -- local function statusline()
    --   local mode, mode_hl = mini_statusline.section_mode { trunc_width = 120 }
    --   local diagnostics = mini_statusline.section_diagnostics { trunc_width = 75 }
    --   local git = mini_statusline.section_git { trunc_width = 40 }
    --   local lsp = mini_statusline.section_lsp { icon = 'λ', trunc_width = 75 }
    --   local filename = mini_statusline.section_filename { trunc_width = 140 }
    --   local percent = '%2p%%'
    --   local location = '%3l:%-2c'
    --
    --   return mini_statusline.combine_groups {
    --     { hl = mode_hl, strings = { mode } },
    --     { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics, lsp } },
    --     '%<', -- Mark general truncate point
    --     { hl = 'MiniStatuslineFilename', strings = { filename } },
    --     '%=', -- End left alignment
    --     { hl = 'MiniStatuslineFilename', strings = { '%{&filetype}' } },
    --     { hl = 'MiniStatuslineFileinfo', strings = { percent } },
    --     { hl = mode_hl, strings = { location } },
    --   }
    -- end
    --
    -- -- See :help MiniStatusline.config
    -- mini_statusline.setup {
    --   content = { active = statusline },
    -- }
  end,
}
