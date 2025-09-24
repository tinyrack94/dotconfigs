local add, later = MiniDeps.add, MiniDeps.later

vim.pack.add({
  "https://github.com/folke/trouble.nvim.git",
})

require("trouble").setup({})
-- 키맵 설정
local opts = { noremap = true, silent = true }

vim.keymap.set(
  "n",
  "<leader>tx",
  "<cmd>Trouble diagnostics toggle<cr>",
  vim.tbl_extend("force", opts, { desc = "Diagnostics (Trouble)" })
)

vim.keymap.set(
  "n",
  "<leader>tX",
  "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  vim.tbl_extend("force", opts, { desc = "Buffer Diagnostics (Trouble)" })
)

vim.keymap.set(
  "n",
  "<leader>ts",
  "<cmd>Trouble symbols toggle focus=false<cr>",
  vim.tbl_extend("force", opts, { desc = "Symbols (Trouble)" })
)

vim.keymap.set(
  "n",
  "<leader>tl",
  "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  vim.tbl_extend("force", opts, { desc = "LSP Definitions / references / ... (Trouble)" })
)

vim.keymap.set(
  "n",
  "<leader>tL",
  "<cmd>Trouble loclist toggle<cr>",
  vim.tbl_extend("force", opts, { desc = "Location List (Trouble)" })
)

vim.keymap.set(
  "n",
  "<leader>tQ",
  "<cmd>Trouble qflist toggle<cr>",
  vim.tbl_extend("force", opts, { desc = "Quickfix List (Trouble)" })
)
