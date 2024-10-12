local opts = {
  ring = {
    history_length = 1000,
    storage = 'sqlite',
    storage_path = vim.fn.stdpath 'data' .. '/databases/yanky.db',
    sync_with_numbered_registers = true,
  },
  system_clipboard = {
    sync_with_ring = true,
  },
  highlight = {
    on_put = true,
    on_yank = true,
    timer = 500,
  },
  preserve_cursor_position = {
    enabled = true,
  },
}

return {
  'gbprod/yanky.nvim',
  dependencies = { 'kkharji/sqlite.lua' },
  opts = opts,
  keys = {
    { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' } },
    { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' } },
    { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' } },
    { '<c-p>', '<Plug>(YankyCycleForward)' },
    { '<c-n>', '<Plug>(YankyCycleBackward)' },
    { '<leader>pp', '<cmd>YankyRingHistory<cr>' },
  },
  event = 'BufReadPre',
}
