-- Basic options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.numberwidth = 4
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smoothscroll = true
vim.opt.undofile = true
vim.opt.termguicolors = true

-- Tabs as 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- scrolloff
vim.opt.scrolloff = 4

-- Show diagnostics on hover
vim.opt.updatetime = 250
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end,
})

-- expolerer options
vim.g.newtrw_banner = 0 -- FIXME: This clearly doesnt remove the banner


-- Enable Tree-sitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Start with folds open
vim.opt.foldlevel = 99
vim.opt.foldenable = true
