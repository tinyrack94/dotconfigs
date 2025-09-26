local add = MiniDeps.add

add({
  source = "folke/lazydev.nvim"
})

require("lazydev").setup({
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    { path = "MiniDeps",           words = { "MiniDeps" } },
  },
})

add({
  source = "mason-org/mason.nvim",
  depends = {
    "neovim/nvim-lspconfig",
    "mason-org/mason-lspconfig.nvim"
  }
})

require("mason").setup({})
require("mason-lspconfig").setup({
  automatic_enable = true,
  ensure_installed = {
    -- common
    "yamlls",
    "bashls",
    "jsonls",
    "yamlls",
    "gh_actions_ls",
    "copilot",
    "ansiblels",
    "lua_ls",
    "dockerls",
    "docker_language_server",
    "docker_compose_language_service",

    -- web
    "html",
    "ts_ls",
    "tailwindcss",
    "cssls",
    "astro",
    "eslint",
    "emmet_language_server",
  },
})

add({
  source = "WhoIsSethDaniel/mason-tool-installer"
})

require('mason-tool-installer').setup({
  ensure_installed = {
    "eslint_d",
    "prettierd",
    "stylua",
    "stylelint",
    "ansible-lint",
    "jsonlint",
    "markdownlint"
  }
})
