-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- Yank and return to position after paste
-- vim.keymap.set({'n', 'x', 'o'}, 'gy', '"+ygv<Esc>', { desc = 'Copy to clipboard' })
-- vim.keymap.set({'n', 'x', 'o'}, 'gp', '"+p', { desc = 'Paste clipboard text' })

-- Save file
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save file', silent = true })

-- Save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w<CR>', { desc = 'Save file without formatting' })

-- Quit file
vim.keymap.set('n', '<C-q>', '<cmd>q<CR>', { desc = 'Quit file', silent = true })

-- Delete single character without copying into register
vim.keymap.set({ 'n', 'v' }, 'x', '"_x', { desc = 'Delete without copying' })

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next match and center' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous match and center' })

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>x', ':bdelete<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>b', '<cmd>enew<CR>', { desc = 'New buffer' })

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>h', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Equalize split windows' })
vim.keymap.set('n', '<leader>xs', ':close<CR>', { desc = 'Close split window' })

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { desc = 'Focus split above' })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { desc = 'Focus split below' })
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { desc = 'Focus split left' })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { desc = 'Focus split right' })

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', { desc = 'Open new tab' })
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', { desc = 'Previous tab' })

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', { desc = 'Toggle line wrapping' })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and stay' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and stay' })

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste without overwriting yank' })

-- Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic list' })

-- mini files

vim.keymap.set('n', '<leader>ff', ':lua MiniFiles.open()<CR>', { desc = 'Open files' })

-- FZF
vim.keymap.set('n', '<leader>sf', function()
  require('fzf-lua').files { hidden = true, previewer = false, file_icons = false }
end, { desc = 'Find files' })

vim.keymap.set('n', '<leader>fg', function()
  require('fzf-lua').live_grep()
end, { desc = 'Live grep' })

vim.keymap.set('n', '<leader>sw', function()
  require('fzf-lua').grep_cword()
end, { desc = 'Search word under cursor' })

vim.keymap.set('n', '<leader>fb', function()
  require('fzf-lua').buffers()
end, { desc = 'Find buffers' })

vim.keymap.set('n', '<leader>fh', function()
  require('fzf-lua').help_tags()
end, { desc = 'Search help tags' })

vim.keymap.set('n', '<leader>fo', function()
  require('fzf-lua').oldfiles()
end, { desc = 'Recent files' })

vim.keymap.set('n', '<leader>gs', function()
  require('fzf-lua').git_status()
end, { desc = 'Git status' })

vim.keymap.set('n', '<leader>gc', function()
  require('fzf-lua').git_commits()
end, { desc = 'Git commits' })

vim.keymap.set('n', '<leader>gb', function()
  require('fzf-lua').git_branches()
end, { desc = 'Git branches' })

-- Diffview
vim.keymap.set('n', '<leader>gd', function()
  require('diffview').open()
end, { desc = 'Open Diffview' })

vim.keymap.set('n', '<leader>gD', function()
  require('diffview').close()
end, { desc = 'Close Diffview' })
