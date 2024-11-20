return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- LSP completion source
    'hrsh7th/cmp-buffer', -- Buffer completion source
    'hrsh7th/cmp-path', -- Path completion source
  },
  config = function()
    local cmp = require 'cmp'

    cmp.setup {
      snippet = {
        -- Disable snippet support by setting expand to a no-op function
        expand = function() end,
      },
      mapping = {
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-e>'] = cmp.mapping.abort(), -- Abort completion
        ['<C-Space>'] = cmp.mapping.complete(), -- Trigger completion
      },
      sources = {
        { name = 'nvim_lsp' }, -- LSP completion
        { name = 'buffer' }, -- Buffer completion
        { name = 'path' }, -- Path completion
        -- { name = 'supermaven' }, -- Supermaven completion
      },
      formatting = {
        format = function(entry, item)
          item.menu = ({
            nvim_lsp = '[LSP]',
            buffer = '[Buffer]',
            path = '[Path]',
          })[entry.source.name]
          return item
        end,
      },
    }
  end,
}
