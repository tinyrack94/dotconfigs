local MasterKey = 'p'

return {
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    lazy = false,
    config = function()
      require('trouble').setup({})
      local wk = require('which-key')
      wk.add({
        { "<leader>" .. MasterKey, group = "Trouble" }
      })
    end,
    keys = {
      {
        "<leader>" .. MasterKey .. "t",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Toggle Diagnostics (Trouble)",
      },
      {
        "<leader>" .. MasterKey .. "X",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>" .. MasterKey .. "s",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>" .. MasterKey .. "l",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>" .. MasterKey .. "L",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>" .. MasterKey .. "Q",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  }
}
