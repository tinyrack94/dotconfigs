local add = MiniDeps.add
-- 스마트 단축키 지원
local keymap = require("mini.keymap")

local mini_files = require("mini.files")
vim.keymap.set("n", "<leader>fo", mini_files.open, { desc = "Open Files" })
vim.keymap.set("n", "<leader>fc", function()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
  MiniFiles.open(path)
  MiniFiles.reveal_cwd()
end, { desc = "Open Files (Current Path)" })

local map_multistep = keymap.map_multistep
map_multistep("i", "<Tab>", { "pmenu_next" })
map_multistep("i", "<S-Tab>", { "pmenu_prev" })
map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })
map_multistep("i", "<BS>", { "minipairs_bs" })

vim.keymap.set("n", "<leader>pf", "<cmd>Pick files<cr>", { desc = "Files" })
vim.keymap.set("n", "<leader>pG", "<cmd>Pick grep_live<cr>", { desc = "Grep" })
vim.keymap.set("n", "<leader>pb", "<cmd>Pick buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>pl", "<cmd>Pick buf_lines<cr>", { desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>pc", "<cmd>Pick commands<cr>", { desc = "Commands" })
vim.keymap.set("n", "<leader>pk", "<cmd>Pick keymaps<cr>", { desc = "Keymaps" })
vim.keymap.set("n", "<leader>pgc", "<cmd>Pick git_commits<cr>", { desc = "Commits" })
vim.keymap.set("n", "<leader>pgb", "<cmd>Pick git_branches<cr>", { desc = "Branches" })
vim.keymap.set("n", "<leader>pgf", "<cmd>Pick git_files<cr>", { desc = "Files" })
vim.keymap.set("n", "<leader>pgf", "<cmd>Pick git_hunks<cr>", { desc = "Hunks" })
---

local map_combo = keymap.map_combo
-- Support most common modes. This can also contain 't', but would
-- only mean to press `<Esc>` inside terminal.
local mode = { "i", "c", "x", "s" }
map_combo(mode, "jk", "<BS><BS><Esc>")
-- To not have to worry about the order of keys, also map "kj"
map_combo(mode, "kj", "<BS><BS><Esc>")
-- Escape into Normal mode from Terminal mode
map_combo("t", "jk", "<BS><BS><C-\\><C-n>")
map_combo("t", "kj", "<BS><BS><C-\\><C-n>")

---

-- 명령어 도움말 제공
local miniclue = require("mini.clue")
miniclue.setup({
  window = {
    delay = 0,
  },
  triggers = {
    -- Leader triggers
    { mode = "n", keys = "<Leader>" },
    { mode = "x", keys = "<Leader>" },

    -- Built-in completion
    { mode = "i", keys = "<C-x>" },

    -- `g` key
    { mode = "n", keys = "g" },
    { mode = "x", keys = "g" },

    -- `[` and `]` keys
    { mode = "n", keys = "[" },
    { mode = "n", keys = "]" },

    -- Marks
    { mode = "n", keys = "'" },
    { mode = "n", keys = "`" },
    { mode = "x", keys = "'" },
    { mode = "x", keys = "`" },

    -- Registers
    { mode = "n", keys = '"' },
    { mode = "x", keys = '"' },
    { mode = "i", keys = "<C-r>" },
    { mode = "c", keys = "<C-r>" },

    -- Window commands
    { mode = "n", keys = "<C-w>" },

    -- `z` key
    { mode = "n", keys = "z" },
    { mode = "x", keys = "z" },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),

    -- 그룹명 지정
    -- { mode = 'n', keys = '<Leader>a',  desc = '+AI' },
    { mode = "n", keys = "<Leader>p", desc = "+Pick" },
    { mode = "n", keys = "<Leader>f", desc = "+Files" },
    { mode = "n", keys = "<Leader>x", desc = "+Troubles" },
    { mode = "n", keys = "<leader>pg", desc = "+Git" },
    { mode = "n", keys = "gro", desc = "+Go to" },
    -- { mode = "n", keys = "<Leader>t", desc = "+Troubles" },
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    vim.keymap.set("n", "grod", vim.diagnostic.open_float, {
      buffer = ev.buf,
      desc = "Open Diagnostics",
    })

    vim.keymap.set("n", "gri", vim.lsp.buf.declaration, {
      buffer = ev.buf,
      desc = "Implementation",
    })

    vim.keymap.set("n", "grd", vim.lsp.buf.definition, {
      buffer = ev.buf,
      desc = "Go to definition",
    })

    vim.keymap.set("n", "grD", vim.lsp.buf.declaration, {
      buffer = ev.buf,
      desc = "Go to declaration",
    })

    vim.keymap.set("n", "grn", vim.lsp.buf.rename, {
      buffer = ev.buf,
      desc = "Rename",
    })

    vim.keymap.set("n", "grf", require("conform").format, {
      buffer = ev.buf,
      desc = "Format Codes",
    })

    -- vim.keymap.set("n", "gre", "<cmd>LspEslintFixAll<CR>", {
    --   buffer = ev.buf,
    --   desc = "Eslint fix all",
    -- })

    vim.keymap.set("n", "gra", vim.lsp.buf.code_action, {
      buffer = ev.buf,
      desc = "Code Actions",
    })

    vim.keymap.set("n", "grr", vim.lsp.buf.references, {
      buffer = ev.buf,
      desc = "References",
    })

    vim.keymap.set("n", "grt", vim.lsp.buf.references, {
      buffer = ev.buf,
      desc = "Type Definition",
    })

    vim.keymap.set("n", "gros", vim.lsp.buf.signature_help, {
      buffer = ev.buf,
      desc = "Open Signature Help",
    })
  end,
})

-- add({
--   source = "folke/which-key.nvim",
-- })
--
-- require("which-key").setup({})
