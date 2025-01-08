return {
  'saghen/blink.cmp',
  version = '*',
  opts = {
    keymap = { preset = 'enter' },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },
    completion = {
      ghost_text = {
        enabled = true,
      },
    },
    sources = {
      default = { 'lsp', 'path', 'buffer' },
      cmdline = {},
    },
  },
  opts_extend = { 'sources.default' },
}
