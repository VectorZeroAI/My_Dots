-- Markdown-specific stuff
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true

        vim.keymap.set("n", "<leader>b", "ebi**<esc>ea**<esc>", { desc = "[b]old the markdown text" })

        -- spellcheck
        vim.opt_local.spell = true
        vim.opt_local.spelllang = { "en_us", "de" }
        vim.opt_local.spellfile = vim.fn.stdpath("config") .. "/spell/any.utf-8.add"
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
        vim.lsp.buf.format({
            bufnr = args.buf,
            timeout_ms = 3000,
            filter = function (client)
                return client.name == "ruff"
            end
        })
    end
})


-- Typst specific keymap
vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    callback = function ()
        vim.keymap.set("n", "<leader>vp", "<cmd>TypstPreviewToggle<CR>", {desc = "[t]ypst [p]review"})
    end
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight on yank",
    callback = function ()
        vim.highlight.on_yank()
    end
})
