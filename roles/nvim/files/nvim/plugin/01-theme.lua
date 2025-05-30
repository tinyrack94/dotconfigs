local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

add({
  source = "folke/tokyonight.nvim",
})
require("tokyonight").setup({})
vim.cmd.colorscheme "tokyonight-night"

