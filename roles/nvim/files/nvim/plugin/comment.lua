-- 주석 지원
local add = MiniDeps.add

add({
  source = "JoosepAlviste/nvim-ts-context-commentstring",
})

require("mini.comment").setup({
  -- jsx 파일에서 코드와 템플릿 주석 지원
  options = {
    custom_commentstring = function()
      return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
    end,
  },
})

--
--
-- add({
--   source = "numToStr/Comment.nvim",
-- })
--
-- require("Comment").setup({})
--
-- local add = MiniDeps.add
--
-- add({
--   source = "danymat/neogen",
-- })
--
-- require("neogen").setup({})
