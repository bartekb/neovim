return {
  "wtfox/jellybeans.nvim",
    priority = 1000,
    config = function()
        require("jellybeans").setup()
        vim.cmd.colorscheme("jellybeans")
    end,
}

-- return {
--   'projekt0n/github-nvim-theme',
--   name = 'github-theme',
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require('github-theme').setup {}

--     vim.cmd 'colorscheme github_dark_default'
--   end,
-- }

-- return {
--   '0xstepit/flow.nvim',
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     require('flow').setup {
--       dark_theme = true,
--       transparent = false,
--       high_contrast = false,
--       fluo_color = 'pink',
--       mode = 'desaturate',
--       aggressive_spell = false,
--     }
--     vim.cmd 'colorscheme flow'
--   end,
-- }

-- return {
--   'rebelot/kanagawa.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd 'colorscheme kanagawa'
--   end,
-- }
