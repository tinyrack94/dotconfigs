local add = MiniDeps.add

add({
  source = "nvim-treesitter/nvim-treesitter"
})

require('nvim-treesitter').setup({});

require("nvim-treesitter.configs").setup({
  -- ensure_installed = 'all',
  auto_install = true,
  highlight = { enable = true },
})

