local add = MiniDeps.add

add({
  source = "saghen/blink.cmp",
  depends = {
    "rafamadriz/friendly-snippets",
  },
  checkout = "v1.7.0",
})

require("blink.cmp").setup({
  keymap = {
    -- ["<Enter>"] = { "select_and_accept", "fallback" },
  },

  completion = {
    documentation = {
      auto_show = true,
    },
  },
})
