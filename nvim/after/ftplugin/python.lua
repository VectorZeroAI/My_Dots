-- python config

-- Python auto format
vim.api.nvim_create_autocmd("BufWritePre", {
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
