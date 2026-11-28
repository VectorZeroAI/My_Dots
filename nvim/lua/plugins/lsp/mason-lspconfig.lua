return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "basedpyright",
            "jsonls",
            "gopls",
            "ocamllsp",
            "html",
            "lua_ls",
            "ruff"
        },
    },
}
