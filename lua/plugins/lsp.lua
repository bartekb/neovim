return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'saghen/blink.cmp',
    'j-hui/fidget.nvim',
    'folke/lazydev.nvim',
    'cordx56/rustowl',
    'ibhagwan/fzf-lua', -- Ensure fzf-lua is installed
  },

  opts = {
    servers = {
      gopls = {},
      rust_analyzer = {},
      rustowl = {},
      ruby_lsp = {},
      ts_ls = {},
      html = { filetypes = { 'html', 'twig', 'hbs' } },
      eslint = {},
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            completion = { callSnippet = 'Replace' },
            workspace = { checkThirdParty = false },
          },
        },
      },
    },
    diagnostics = {
      virtual_text = true,
      signs = true,
      float = { border = 'single' },
    },
  },

  config = function(_, opts)
    local lspconfig = require 'lspconfig'
    local blink_cmp = require 'blink.cmp'
    local fzf = require 'fzf-lua'

    -- Configure diagnostics globally
    vim.diagnostic.config(opts.diagnostics)

    -- Auto-commands for LSP attachment
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          if func then
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          else
            vim.notify('LSP keymap skipped: ' .. desc, vim.log.levels.WARN)
          end
        end

        map('gd', fzf.lsp_definitions, '[G]oto [D]efinition')
        map('gr', fzf.lsp_references, '[G]oto [R]eferences')
        map('gI', fzf.lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>ds', fzf.lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>ws', fzf.lsp_live_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      end,
    })

    -- Setup LSP servers
    for server, config in pairs(opts.servers) do
      config.capabilities = blink_cmp.get_lsp_capabilities(config.capabilities or {})
      lspconfig[server].setup(config)
    end

    -- Load LazyDev for Lua development
    require('lazydev').setup()

    -- Load Fidget for LSP progress UI
    require('fidget').setup {}
  end,
}
