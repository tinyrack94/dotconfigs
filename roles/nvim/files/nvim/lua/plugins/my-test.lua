-- ... existing configurations ...

-- Set netrw to tree style
vim.g.netrw_liststyle = 3

-- Set the width of the netrw window
vim.g.netrw_winsize = 25

-- Show hidden files
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]

-- Keep netrw window open and open files to the right
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_preview = 1

vim.o.ignorecase = true

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd('leftabove 30vsplit')
    vim.cmd('Explore')
  end
})

return {
  -- Configure LazyVim to load gruvbox
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v3.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --     -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  --   },
  --   lazy = false, -- neo-tree will lazily load itself
  --   ---@module "neo-tree"
  --   ---@type neotree.Config?
  --   opts = {
  --     -- fill any relevant options here
  --   },
  -- },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  }
}
