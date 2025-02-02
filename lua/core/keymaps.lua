-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- copy/paste
vim.keymap.set({'n', 'x', 'o'}, 'gy', '"+y', {desc = 'Copy to clipboard'})
vim.keymap.set({'n', 'x', 'o'}, 'gp', '"+p', {desc = 'Paste clipboard content before cursor'})
vim.keymap.set({'n', 'x', 'o'}, 'gP', '"+P', {desc = 'Paste clipboard content after cursor'})
vim.keymap.set({'n', 'x', 'o'}, 'c', '"_c', {desc = 'Change word'})
vim.keymap.set({'n', 'x', 'o'}, 'C', '"_C', {desc = 'Change from the cursor to the end of the line and enter Insert mode'})
vim.keymap.set({'n', 'x', 'o'}, 'd', '"_d', {desc = 'Delete word'})
vim.keymap.set({'n', 'x', 'o'}, 'dd', '"_dd', {desc = 'Delete line'})
vim.keymap.set({'n', 'x', 'o'}, 'D', '"_D', {desc = 'Delete from the cursor to the end of the line and enter Insert mode'})
vim.keymap.set({'n', 'x', 'o'}, '<leader>y', '^vg_y', { desc = 'Copy whole line without new line' })

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next match and center' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous match and center' })

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bc', '<cmd>lua pcall(MiniBufremove.delete)<cr>', {desc = 'Close buffer'})

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

-- Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic list' })

-- FZF
vim.keymap.set("n", "<c-P>", require('fzf-lua').files, { desc = "Fzf Files" })
vim.keymap.set("n", "<leader>bb", require('fzf-lua').buffers, { desc = "Fzf Buffers" })
vim.keymap.set("n", "<leader>ss", require('fzf-lua').live_grep, { desc = "Fzf Grep" })
vim.keymap.set("n", "<leader>sw", require('fzf-lua').grep_cword, { desc = "Search word under cursor" })
vim.keymap.set("v", "<leader>sv", require('fzf-lua').grep_visual, { desc = "Search selection" })
vim.keymap.set("n", "<leader>gs", require('fzf-lua').git_status, { desc = "Github Status" })
vim.keymap.set("n", "<leader>gb", require('fzf-lua').git_branches, { desc = "Github Branches" })
vim.keymap.set("n", "<leader>gc", require('fzf-lua').git_commits, { desc = "Github Commits" })

-- Diffview
vim.keymap.set('n', '<leader>gd', function()
  require('diffview').open()
end, { desc = 'Open Diffview' })

vim.keymap.set('n', '<leader>gD', function()
  require('diffview').close()
end, { desc = 'Close Diffview' })

vim.keymap.set("n", "<leader>o", "<cmd>lua require('oil').open_float('.')<CR>", { desc = "Open Oil in a floating popup" })
