local add = MiniDeps.add

add({
  source = "nvim-neo-tree/neo-tree.nvim",
  checkout = "v3.x",
  depends = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
})

require("neo-tree").setup({
  -- options go here
  filesystem = {
    follow_current_file = {
      enabled = true,
    },
  },
  buffers = {
    follow_current_file = {
      enabled = true,
    },
  },
})
