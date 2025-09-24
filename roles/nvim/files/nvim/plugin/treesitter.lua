vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter.git",
})

require('nvim-treesitter').setup({});

require("nvim-treesitter.configs").setup({
  -- ensure_installed = 'all',
  auto_install = true,
  highlight = { enable = true },
})

