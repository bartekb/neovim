return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('fzf-lua').setup {
      winopts = {
        height = 0.90,
        width = 0.90,
        row = 0.3,
        col = 0.5,
      },
      files = {
        formatter = 'path.filename_first',
        git_icons = true,
        prompt = 'files:',
        git = true,
        previewer = false,
        cmd = "rg --files --hidden --no-ignore --glob '!{.git,node_modules,coverage,log,tmp}/*'",
      },
      buffers = {
        formatter = 'path.filename_first',
        prompt = 'buffers:',
        previewer = false,
      },
      grep = {
        cmd = "rg --column --line-number  --color=always --hidden --smart-case --no-ignore --glob '!.git/**' --glob '!node_modules/**' --glob '!coverage/**' --glob '!tmp/**' --glob '!log/**'",
        previewer = false,
      },
    }
  end,
}
