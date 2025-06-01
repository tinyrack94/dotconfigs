local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

add({ source = "catppuccin/nvim", name = "catppuccin" })

vim.cmd.colorscheme "catppuccin-mocha"
