local add = MiniDeps.add

add({
  source = "folke/lazydev.nvim",
})

require("lazydev").setup({
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    { path = "MiniDeps", words = { "MiniDeps" } },
  },
})

add({
  source = "mason-org/mason.nvim",
  depends = {
    "neovim/nvim-lspconfig",
    "mason-org/mason-lspconfig.nvim",
  },
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
  source = "WhoIsSethDaniel/mason-tool-installer",
})

require("mason-tool-installer").setup({
  ensure_installed = {
    "eslint",
    "prettierd",
    "stylua",
    "stylelint",
    "ansible-lint",
    "jsonlint",
    "markdownlint",
  },
})

-- kubernetes
--
-- add({
--   source = "diogo464/kubernetes.nvim",
-- })
--
-- require("kubernetes").setup({
--   -- this can help with autocomplete. it sets the `additionalProperties` field on type definitions to false if it is not already present.
--   schema_strict = true,
--   -- true:  generate the schema every time the plugin starts
--   -- false: only generate the schema if the files don't already exists. run `:KubernetesGenerateSchema` manually to generate the schema if needed.
--   schema_generate_always = true,
--   -- Patch yaml-language-server's validation.js file.
--   patch = true,
--   -- root path of the yamlls language server. by default it is assumed you are using mason but if not this option allows changing that path.
--   yamlls_root = function()
--     return vim.fs.joinpath(vim.fn.stdpath("data"), "/mason/packages/yaml-language-server/")
--   end,
-- })
--
-- vim.lsp.config("yamlls", {
--   settings = {
--     yaml = {
--       schemas = {
--         -- use this if you want to match all '*.yaml' files
--         [require("kubernetes").yamlls_schema()] = "*.yaml",
--         -- or this to only match '*.<resource>.yaml' files. ex: 'app.deployment.yaml', 'app.argocd.yaml', ...
--         -- [require("kubernetes").yamlls_schema()] = require("kubernetes").yamlls_filetypes(),
--       },
--     },
--   },
-- })
