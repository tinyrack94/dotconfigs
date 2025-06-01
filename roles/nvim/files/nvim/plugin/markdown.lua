local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

later(function()
  add({ source = 'MeanderingProgrammer/render-markdown.nvim' })
  require('render-markdown').setup({
    file_types = { "markdown", "codecompanion" }
  })
end)

