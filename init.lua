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
  require 'plugins.neotree',
  require 'plugins.colortheme',
  require 'plugins.lualine',
  require 'plugins.fzf',
  -- require 'plugins.telescope',
  require 'plugins.autocompletion',
  require 'plugins.lint',
  require 'plugins.gitsigns',
  -- require 'plugins.alpha',
  require 'plugins.lsp',
  -- require 'plugins.lsp_saga',
  require 'plugins.indent-blankline',
  require 'plugins.misc',
  require 'plugins.mini',
  require 'plugins.project-explorer',
  require 'plugins.conform',
  require 'plugins.yanky',
  require 'plugins.copilot',
  require 'plugins.navigator',
  require 'plugins.surround',
  require 'plugins.textobj',
  require 'plugins.which_key',
}

require 'core.keymaps' -- Load general keymaps
require 'core.autocmd' -- Load general autocommands

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
