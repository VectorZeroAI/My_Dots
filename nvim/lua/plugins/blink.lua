return {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },
    opts = {
        keymap = {
            preset = "default",

            ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<CR>"] = { "accept", "fallback" },

            -- snippet navigation
            ["<Tab>"] = {
                "snippet_forward",
                "select_next",
                "fallback",
            },
            ["<S-Tab>"] = {
                "snippet_backward",
                "select_prev",
                "fallback",
            },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },

        sources = {
            default = {
                "lsp",
                "snippets", -- 🔥 THIS is what you were missing
                "path",
            },
        },

        signature = { enabled = true },
    },

    opts_extend = { "sources.default" },
}
