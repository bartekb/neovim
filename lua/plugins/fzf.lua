return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('fzf-lua').setup {
        files = {
            fd_opts = "--no-ignore --hidden --exclude .git --exclude .node_modules --exclude '*.log'",
        }
      -- -- Global settings for all pickers
      -- global_resume = true,
      -- global_resume_query = true,
    }
  end,
}
