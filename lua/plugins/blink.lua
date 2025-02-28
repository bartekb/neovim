return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',

  -- use a release tag to download pre-built binaries
  version = '*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = { preset = 'super-tab' },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
      },
    },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
  opts_extend = { 'sources.default' },
}

-- return {
--   'saghen/blink.cmp',
--   version = '*',
--   opts = {
--     keymap = { preset = 'enter' },
--     appearance = {
--       use_nvim_cmp_as_default = true,
--       nerd_font_variant = 'mono',
--     },
--     sources = {
--       default = { 'lsp', 'path', 'buffer' },
--     },
--     -- cmdline = {
--     --   sources = {},
--     -- },
--     signature = { enabled = true },
--     completion = {
--       auto_insert = true,
--       list = {
--         selection = {
--           preselect = function(ctx)
--             return ctx.mode ~= 'cmdline' and not require('blink.cmp').snippet_active { direction = 1 }
--           end,
--         },
--       },
--       documentation = {
--         auto_show = true,
--         auto_show_delay_ms = 500,
--       },
--     },
--   },
--   opts_extend = { 'sources.default' },
-- }
