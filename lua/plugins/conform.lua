return {
  'stevearc/conform.nvim',
  config = function()
    require('conform').setup {
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
      formatters_by_ft = {
        css = { 'prettierd' },
        html = { 'prettierd' },
        htmlangular = { 'prettierd' },
        json = { 'prettierd' },
        jsonc = { 'prettierd' },
        scss = { 'prettierd' },
        typescript = { 'prettierd' },
        fish = { 'fish_indent' },
        sh = { 'shfmt', 'shellharden' },
        bash = { 'shfmt', 'shellharden' },
        markdown = { 'cbfmt', 'prettierd', 'markdownlint' },
        lua = { 'stylua' },
        python = { 'isort', 'black' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        go = { 'goimports', 'gofumpt' }, -- gofmt, gomodifytags
      },
    }
  end,
}
