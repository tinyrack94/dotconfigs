-- 스마트 단축키 지원
local keymap = require("mini.keymap")

local map_multistep = keymap.map_multistep
map_multistep("i", "<Tab>", { "pmenu_next" })
map_multistep("i", "<S-Tab>", { "pmenu_prev" })
map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })
map_multistep("i", "<BS>", { "minipairs_bs" })

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
    -- { mode = 'n', keys = '<Leader>d',  desc = '+Debug' },
    { mode = "n", keys = "gro",       desc = "+Go to" },
    { mode = "n", keys = "<Leader>t", desc = "+Troubles" },
    { mode = "n", keys = "<Leader>c", desc = "+CodeCompanion" },
  },
})
