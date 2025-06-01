local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

add({
  source = "folke/tokyonight.nvim",
})
require("tokyonight").setup({})
-- vim.cmd.colorscheme "tokyonight-night"


add({
  source = "projekt0n/github-nvim-theme"
})
require('github-theme').setup({})
vim.cmd.colorscheme "github_dark_default"
