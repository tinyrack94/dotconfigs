vim.pack.add({
  "https://github.com/folke/lazydev.nvim.git",
})

require("lazydev").setup({
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    { path = "MiniDeps",           words = { "MiniDeps" } },
  },
})

vim.pack.add({
  "https://github.com/mason-org/mason.nvim.git",
})

vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig.git",
})

vim.pack.add({
  "https://github.com/mason-org/mason-lspconfig.nvim.git",
})

require("mason").setup({})
require("mason-lspconfig").setup({
  automatic_enable = true,
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

    vim.keymap.set("n", "grD", vim.lsp.buf.declaration, {
      buffer = ev.buf,
      desc = "Go to declaration",
    })

    vim.keymap.set("n", "grd", vim.lsp.buf.definition, {
      buffer = ev.buf,
      desc = "Go to definition",
    })

    vim.keymap.set("n", "grn", vim.lsp.buf.rename, {
      buffer = ev.buf,
      desc = "Rename",
    })

    vim.keymap.set("n", "grf", vim.lsp.buf.format, {
      buffer = ev.buf,
      desc = "Format Codes",
    })

    vim.keymap.set("n", "gre", "<cmd>LspEslintFixAll<CR>", {
      buffer = ev.buf,
      desc = "Eslint fix all",
    })

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
