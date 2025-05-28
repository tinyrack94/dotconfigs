return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })

    -- LSP 관련 Telescope 키맵
    -- vim.keymap.set('n', 'gD', builtin.lsp_definitions, { desc = '[G]o to [D]efinition (Telescope)' })
    -- vim.keymap.set('n', 'gI', builtin.lsp_implementations, { desc = '[G]o to [I]mplementation (Telescope)' })
    -- vim.keymap.set('n', 'gR', builtin.lsp_references, { desc = '[G]o to [R]eferences (Telescope)' })
    -- vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, { desc = '[G]o to [T]ype Definition (Telescope)' })
    -- vim.keymap.set('n', 'gs', builtin.lsp_document_symbols, { desc = '[G]o to [S]ymbols in Document (Telescope)' })
    -- vim.keymap.set('n', 'gws', builtin.lsp_workspace_symbols, { desc = '[G]o to [W]orkspace [S]ymbols (Telescope)' })
  end,
}