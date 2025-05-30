local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

add({
  source = "olimorris/codecompanion.nvim",
  depends = {
    'nvim-lua/plenary.nvim',
    "nvim-treesitter/nvim-treesitter",
    'MeanderingProgrammer/render-markdown.nvim',
  },
})

require('render-markdown').setup({
  file_types = { "markdown", "codecompanion" }
})

require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "gemini",
      -- slash_commands = {
      --   ["file"] = {
      --     -- Location to the slash command in CodeCompanion
      --     callback = "strategies.chat.slash_commands.file",
      --     description = "Select a file using Telescope",
      --     opts = {
      --       provider = "mini_pick", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks"
      --       contains_code = true,
      --     },
      --   },
      -- },
    },
    inline = {
      adapter = "gemini",
    },
    cmd = {
      adapter = "gemini"
    }
  },
  adapters = {},
  opts = {
    log_level = "debug"
  }
})

vim.keymap.set('n', '<leader>cc', '<cmd>CodeCompanionChat Toggle<cr>', {
  noremap = true,
  silent = true,
  desc = "Toggle Chat"
})
vim.keymap.set('n', '<leader>ca', '<cmd>CodeCompanionActions<cr>', {
  noremap = true,
  silent = true,
  desc = "Actions"
})

-- add({
--   source = 'saghen/blink.cmp',
--   depends = { 'rafamadriz/friendly-snippets' },
-- })
-- require('blink-cmp').setup({
--   -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
--   -- 'super-tab' for mappings similar to vscode (tab to accept)
--   -- 'enter' for enter to accept
--   -- 'none' for no mappings
--   --
--   -- All presets have the following mappings:
--   -- C-space: Open menu or open docs if already open
--   -- C-n/C-p or Up/Down: Select next/previous item
--   -- C-e: Hide menu
--   -- C-k: Toggle signature help (if signature.enabled = true)
--   --
--   -- See :h blink-cmp-config-keymap for defining your own keymap
--   keymap = { preset = 'default' },
--
--   appearance = {
--     -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
--     -- Adjusts spacing to ensure icons are aligned
--     nerd_font_variant = 'mono'
--   },
--
--   -- (Default) Only show the documentation popup when manually triggered
--   completion = { documentation = { auto_show = false } },
--
--   -- Default list of enabled providers defined so that you can extend it
--   -- elsewhere in your config, without redefining it, due to `opts_extend`
--   sources = {
--     default = { 'lsp', 'path', 'snippets', 'buffer' },
--   },
--
--   -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
--   -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
--   -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
--   --
--   -- See the fuzzy documentation for more information
--   fuzzy = { implementation = "prefer_rust_with_warning" }
-- })
--
