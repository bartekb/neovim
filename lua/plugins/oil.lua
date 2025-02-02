return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    float = {
      -- Enables floating window
      max_width = 80,
      max_height = 30,
      border = "rounded",
      win_options = {
        winblend = 10, -- Adds transparency
      },
    },
    keymaps = {
      ["q"] = "actions.close",
    },
  },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
}
