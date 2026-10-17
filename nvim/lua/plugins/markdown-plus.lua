return {
    {
        "OXY2DEV/markview.nvim",
        ft = { "markdown", "text", "txt" },
        opts = {
            preview = {
                enable = true,
                enable_hybrid_mode = false,
                icon_provider = "internal",
                splitview_winopts = {
                    split = "right",
                },
            },
        },

        config = function(_, opts)
            require("markview").setup(opts)

            -- <leader>mp: toggle split preview
            vim.keymap.set("n", "<leader>mp", "<cmd>Markview splitToggle<cr>", {
                desc = "Markdown: toggle split preview",
                silent = true,
            })
            
        end,
    },
}
