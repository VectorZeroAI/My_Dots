-- Markdown-specific stuff
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true

        vim.keymap.set("n", "<leader>b", "ebi**<esc>ea**<esc>", { desc = "[b]old the markdown text" })
    end,
})


-- Fixing some bugs with treesitter
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

-- Python auto format
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "python",
    callback = function (args)
        vim.system({"ruff", "format", vim.api.nvim_buf_get_name(args.buf)})
    end
})

-- Typst specific keymap
vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    callback = function ()
        vim.keymap.set("n", "<leader>tp", "<cmd>TypstPreviewToggle<CR>", {desc = "[t]ypst [p]review"})
    end
})
