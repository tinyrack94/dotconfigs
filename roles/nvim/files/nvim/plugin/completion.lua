local add = MiniDeps.add
--
-- add({
--   source = "saghen/blink.cmp",
--   depends = {
--     "rafamadriz/friendly-snippets",
--   },
--   checkout = "v1.7.0",
-- })
--
-- require("blink.cmp").setup({
--   completion = {
--     documentation = {
--       auto_show = true,
--     },
--     trigger = {
--       show_on_insert_on_trigger_character = true,
--     },
--   },
-- })

add({
  source = "rafamadriz/friendly-snippets",
})

require("mini.completion").setup({})
