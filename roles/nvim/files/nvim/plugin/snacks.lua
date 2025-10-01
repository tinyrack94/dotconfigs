-- folke/snacks.nvim
--
local add = MiniDeps.add

add({
  source = "folke/snacks.nvim",
})

require("snacks").setup({
  explorer = {},
  picker = {
    sources = {
      explorer = {
        -- your explorer picker configuration comes here
        -- or leave it empty to use the default settings
      },
    },
  },
})
