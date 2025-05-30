local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later


add({ source = 'MeanderingProgrammer/render-markdown.nvim' })

require('render-markdown').setup({
  file_types = { "markdown", "codecompanion" }
})

add({
  source = "olimorris/codecompanion.nvim",
  depends = {
    'nvim-lua/plenary.nvim',
    "nvim-treesitter/nvim-treesitter",
  },
})

require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "openai",
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

add({
  source = "github/copilot.vim"
})

-- add({
--   source = "Exafunction/windsurf.nvim",
--   depends = {
--     "nvim-lua/plenary.nvim",
--     "hrsh7th/nvim-cmp",
--   }
-- })
--
-- require("codeium").setup({
--   -- Optionally disable cmp source if using virtual text only
--   enable_cmp_source = false,
--   virtual_text = {
--     enabled = true,
--     -- These are the defaults
--     -- Set to true if you never want completions to be shown automatically.
--     manual = false,
--     -- A mapping of filetype to true or false, to enable virtual text.
--     filetypes = {},
--     -- Whether to enable virtual text of not for filetypes not specifically listed above.
--     default_filetype_enabled = true,
--     -- How long to wait (in ms) before requesting completions after typing stops.
--     idle_delay = 75,
--     -- Priority of the virtual text. This usually ensures that the completions appear on top of
--     -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
--     -- desired.
--     virtual_text_priority = 65535,
--     -- Set to false to disable all key bindings for managing completions.
--     map_keys = true,
--     -- The key to press when hitting the accept keybinding but no completion is showing.
--     -- Defaults to \t normally or <c-n> when a popup is showing.
--     accept_fallback = nil,
--     -- Key bindings for managing completions in virtual text mode.
--     key_bindings = {
--       -- Accept the current completion.
--       accept = "<Tab>",
--       -- Accept the next word.
--       accept_word = false,
--       -- Accept the next line.
--       accept_line = false,
--       -- Clear the virtual text.
--       clear = false,
--       -- Cycle to the next completion.
--       next = "<M-]>",
--       -- Cycle to the previous completion.
--       prev = "<M-[>",
--     }
--   }
-- })


--- avante

-- add({
--   source = 'yetone/avante.nvim',
--   monitor = 'main',
--   depends = {
--     'nvim-treesitter/nvim-treesitter',
--     'stevearc/dressing.nvim',
--     'nvim-lua/plenary.nvim',
--     'MunifTanjim/nui.nvim',
--     'echasnovski/mini.icons'
--   },
--   hooks = {
--     post_checkout = function() vim.cmd('make') end
--   }
-- })
-- --- optional
-- add({ source = 'hrsh7th/nvim-cmp' })
-- add({ source = 'zbirenbaum/copilot.lua' })
-- add({ source = 'HakonHarnes/img-clip.nvim' })
-- add({ source = 'MeanderingProgrammer/render-markdown.nvim' })
--
-- later(function() require('render-markdown').setup({}) end)
-- later(function()
--   require('img-clip').setup({
--     default = {
--       embed_image_as_base64 = false,
--       prompt_for_file_name = false,
--       drag_and_drop = {
--         insert_mode = true,
--       },
--       -- required for Windows users
--       use_absolute_path = true,
--     },
--   })                           -- config img-clip
--   require("copilot").setup({}) -- setup copilot to your liking
--   require("avante").setup({
--     provider = "gemini"
--   })  -- config for avante.nvim
-- end)
