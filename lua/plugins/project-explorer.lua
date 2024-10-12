return {
  "Rics-Dev/project-explorer.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    paths = {
      "~/Projects",
    }, --custom paths set by user
    newProjectPath = "~/Projects", --custom path for new projects
    file_explorer = function(dir) --custom file explorer set by user
      vim.cmd("Neotree close")
      -- require("mini.files").open(dir, true)
      -- -- By default it uses neotree but I changed it for mini.files
      -- vim.cmd("Neotree " .. dir)
    end,
    -- Or for oil.nvim:
    -- file_explorer = function(dir)
    --   require("oil").open(dir)
    -- end,
  },
  config = function(_, opts)
    require("project_explorer").setup(opts)
  end,
  keys = {
    { "<leader>fP", "<cmd>ProjectExplorer<cr>", desc = "Project Explorer" },
  },
  lazy = false,
}