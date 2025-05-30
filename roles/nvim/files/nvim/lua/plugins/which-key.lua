return {
  {
    "folke/which-key.nvim",
    lazy = false,
    config = function()
      local wk = require('which-key')
      wk.setup({
        plugins = { spelling = true },
        preset = 'helix'
      })

      wk.add({
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
      })
    end,
    --  keys = {
    --    {
    --      "<leader>?",
    --      function()
    --        require("which-key").show({ global = false })
    --      end,
    --      desc = "Buffer Local Keymaps (which-key)",
    --    },
    --  }
  }
}
