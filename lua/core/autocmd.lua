vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-when-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    -- These keymaps will become defaults after Neovim v0.11
    -- I've added them here for backwards compatibility
    vim.keymap.set('n', 'grr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gri', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set('n', 'gra', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', 'gO', '<cmd>lua vim.lsp.buf.document_symbol()<cr>', opts)
    vim.keymap.set({'i', 's'}, '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set({'n', 'x'}, 'gq', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)

    -- These are custom keymaps
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'grt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'grd', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)

    local client_id = vim.tbl_get(event, 'data', 'client_id')
    local client = client_id and vim.lsp.get_client_by_id(client_id)

    -- enable completion side effects (if possible)
    -- note is only available in neovim v0.11 or greater
    if is_v11 and client and client.supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client_id, event.buf, {})
    end
  end,
})


-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
--   callback = function()
--     require('lint').try_lint()
--   end,
-- })

-- vim.api.nvim_create_autocmd({ 'CursorHold' }, {
--   pattern = '*',
--   callback = function()
--     for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
--       if vim.api.nvim_win_get_config(winid).zindex then
--         return
--       end
--     end
--     vim.diagnostic.open_float {
--       scope = 'cursor',
--       focusable = true,
--       close_events = {
--         'CursorMoved',
--         'CursorMovedI',
--         'BufHidden',
--         'InsertCharPre',
--         'WinLeave',
--       },
--     }
--   end,
-- })
