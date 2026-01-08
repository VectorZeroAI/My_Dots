return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "pyright",
            "sqls",
            "jsonls",
            "gopls",
            "ruff",
        },
    },
}
