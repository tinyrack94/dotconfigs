if true then return {} end

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

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd('leftabove 30vsplit')
    vim.cmd('Explore')
  end
})

return {}
