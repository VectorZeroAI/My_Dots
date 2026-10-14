return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    opts = {
        ensure_installed = { "python", "lua", "json", "sql", "markdown", "go" },
        auto_install = true,
    }
}
