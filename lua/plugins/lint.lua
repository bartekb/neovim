return {
  'mfussenegger/nvim-lint',
  config = function()
    require('lint').linters_by_ft = {
      ruby = { 'ruby' },
      go = { 'golangcilint' },
      -- lua = {'luacheck'},
    }
  end,
}
