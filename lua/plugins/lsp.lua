return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },
  config = function()
    -- vim.diagnostic.config {
    --   virtual_text = false,
    --   signs = true,
    --   float = { border = 'single' },
    -- }

    -- vim.api.nvim_create_autocmd('LspAttach', {
    --   group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    --   callback = function(event)
    --     local map = function(keys, func, desc, mode)
    --       mode = mode or 'n'
    --       vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    --     end

    --     -- map('gr', require('fzf-lua').lsp_references, '[G]oto [R]eferences')
    --     -- map('gI', require('fzf-lua').lsp_implementations, '[G]oto [I]mplementation')
    --     -- map('<leader>D', require('fzf-lua').lsp_type_definitions, 'Type [D]efinition')
    --     -- map('<leader>ds', require('fzf-lua').lsp_document_symbols, '[D]ocument [S]ymbols')
    --     -- map('<leader>ws', require('fzf-lua').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    --     map('gd', require('fzf-lua').lsp_definitions, '[G]oto [D]efinition')
    --     map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    --     map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
    --     map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    --   end,
    -- })

    local servers = {
      gopls = {},
      rust_analyzer = {},
      ts_ls = {},
      html = { filetypes = { 'html', 'twig', 'hbs' } },
      eslint = {},
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      },
    }

    for server, config in pairs(servers) do
      local opts = {
        -- on_attach = require('fidget').on_attach,
        -- capabilities = require('fidget').capabilities,
        capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities),
      }

      if config.settings then
        opts.settings = config.settings
      end

      if config.filetypes then
        opts.filetypes = config.filetypes
      end

      require('lspconfig')[server].setup(opts)
    end
  end,
}
