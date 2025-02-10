require 'core.options' -- Load general options

-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set up plugins
require('lazy').setup {
  require 'plugins.colortheme',
  require 'plugins.treesitter',
  require 'plugins.oil',
  require 'plugins.whichkey',
  -- require 'plugins.lualine',
  require 'plugins.fzf',
  require 'plugins.lint',
  require 'plugins.lsp',
  -- require 'plugins.misc',
  require 'plugins.mini',
  require 'plugins.conform',
  require 'plugins.diff',
  require 'plugins.blink',
  require 'plugins.git',
  require 'plugins.kulala',
}

require 'core.keymaps'
require 'core.autocmd'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
