local add = MiniDeps.add

-- add({
--   source = "nvimtools/none-ls.nvim",
--   depends = {
--     "nvimtools/none-ls-extras.nvim",
--     "nvim-lua/plenary.nvim",
--   },
-- })
--
-- local null_ls = require("null-ls")
--
-- null_ls.setup({
--   sources = {
--     -- null_ls.builtins.formatting.stylua,
--     -- null_ls.builtins.completion.spell,
--     require("none-ls.formatting.eslint_d"),
--     require("none-ls.diagnostics.eslint_d"),
--     require("none-ls.code_actions.eslint_d"),
--   },
-- })

add({
  source = "stevearc/conform.nvim",
})

-- eslint -> prettier -> lsp 순으로 적용
local js_and_ts_common = {
  "eslint_d",
  "prettierd",
  lsp_format = "fallback",
  stop_after_first = true,
  timeout_ms = 1000,
}

require("conform").setup({
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
  formatters_by_ft = {
    lua = {
      "stylua",
    },
    javascript = js_and_ts_common,
    typescript = js_and_ts_common,
    typescriptreact = js_and_ts_common,
    html = {
      "pretterd",
      lsp_format = "fallback",
    },
  },
})
