return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "pyright",
            "jsonls",
            "gopls",
        },
    },
}
