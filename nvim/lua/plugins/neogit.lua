return {
    {
        "NeogitOrg/neogit",
        cmd = "Neogit",
        event = "BufReadPost",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        opts = {
            kind = "tab", -- "tab" | "split" | "floating"
            integrations = {
                diffview = true,
            },
            disable_signs = false,
            disable_hint = false,
            auto_refresh = true,
        },
    },
}
