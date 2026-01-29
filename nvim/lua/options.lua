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

-- Markdown-specific wrapping
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true
    end,
})

-- expolerer options

vim.g.newtrw_banner = 0

-- Fixing some bugs with treesitter

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
               
    end,
})
