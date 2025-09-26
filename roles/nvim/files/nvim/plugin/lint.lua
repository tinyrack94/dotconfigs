local add = MiniDeps.add

add({
  source = "mfussenegger/nvim-lint",
})

require("lint").linters_by_ft = {
  html = { "prettierd" },
}
