local accept_and_add_str = function (str)
    return function (cmp)
        if not cmp.is_menu_visible() or cmp.get_selected_item() == nil then
            return false
        end

        return cmp.accept({
            callback = function ()
                vim.api.nvim_feedkeys(str, "n", false)
            end
        })
    end
end

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

            ["<CR>"] = { "accept", "fallback" },
            -- ["."] = {
            --     accept_and_add_str("."),
            --     "fallback"
            -- },
            -- ["::"] = {
            --     accept_and_add_str("::"),
            --     "fallback"
            -- },

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
                "snippets",
                "path",
            },
        },

        signature = { enabled = true },
    },

    opts_extend = { "sources.default" },
}
