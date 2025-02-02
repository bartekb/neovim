return {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    vim.cmd 'colorscheme rose-pine'
  end,
}

-- catppuccin theme
-- return {
--   'catppuccin/nvim',
--   name = 'catppuccin',
--   priority = 1000,
--   lazy = false,
--   config = function()
--     require('catppuccin').setup {
--       flavour = 'mocha', -- latte, frappe, macchiato, mocha
--       no_italic = true, -- Force no italic
--       no_bold = false, -- Force no bold
--       no_underline = false, -- Force no underline
--     }
--
--     vim.cmd 'colorscheme catppuccin-mocha'
--   end,
-- }

-- return {
--   'craftzdog/solarized-osaka.nvim',
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     require('solarized-osaka').setup {}
--     vim.cmd 'colorscheme solarized-osaka'
--   end,
-- }

-- return {
--   'projekt0n/github-nvim-theme',
--   name = 'github-theme',
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require('github-theme').setup {}
--
--     vim.cmd 'colorscheme github_dark_default'
--   end,
-- }
--
-- return {
--   'sainnhe/gruvbox-material',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Optionally configure and load the colorscheme
--     -- directly inside the plugin declaration.
--     vim.g.gruvbox_material_enable_italic = true
--     vim.cmd.colorscheme 'gruvbox-material'
--   end,
-- }
