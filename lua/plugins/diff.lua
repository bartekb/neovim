return {
  'sindrets/diffview.nvim',
  config = function()
    require('diffview').setup {
      diff_binaries = false,
      view = {
        merge_tool = {
          layout = 'diff3_mixed',
        },
      },
    }
  end,
}
