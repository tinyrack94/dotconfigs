local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- later(function()
--   add({
--     source = 'MeanderingProgrammer/render-markdown.nvim',
--   })
--
--   require('render-markdown').setup({
--     file_types = { "markdown", "codecompanion" }
--   })
--
--   add({
--     source = "olimorris/codecompanion.nvim",
--     depends = {
--       'nvim-lua/plenary.nvim',
--       "nvim-treesitter/nvim-treesitter",
--     },
--   })
--
--   require("codecompanion").setup({
--     strategies = {
--       chat = {
--         adapter = "gemini",
--       },
--       inline = {
--         adapter = "gemini",
--       },
--       cmd = {
--         adapter = "gemini"
--       }
--     },
--     adapters = {},
--     opts = {
--       log_level = "debug"
--     }
--   })
--
--   vim.keymap.set('n', '<leader>cc', '<cmd>CodeCompanionChat Toggle<cr>', {
--     noremap = true,
--     silent = true,
--     desc = "Toggle Chat"
--   })
--
--   vim.keymap.set('n', '<leader>ca', '<cmd>CodeCompanionActions<cr>', {
--     noremap = true,
--     silent = true,
--     desc = "Actions"
--   })
-- end)

add({
  source = "github/copilot.vim"
})
