-- mason
return {
    "williamboman/mason-lspconfig.nvim",
    dependancies = {
        {"williamboman/mason.nvim"},
        {"neovim/nvim-lspconfig"},
    },
    opts = {
        ensure_installed = {
            "pyright",
            "sqls",
            "jsonls",
            "gopls",
            "ruff",
        }
    }
}
