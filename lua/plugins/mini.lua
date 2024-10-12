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

    -- require('mini.ai').setup {}

    require('mini.diff').setup {
      view = {
        style = 'sign',
      },
    }
    -- require('mini.pairs').setup() -- For auto-pairing brackets
  end,
}
