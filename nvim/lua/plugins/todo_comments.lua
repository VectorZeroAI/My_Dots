return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        keywords = {
            TODO    = { icon = " ", color = "info" },
            FIXME = { icon = " ", color = "error" },
            NOTE    = { icon = " ", color = "hint" },
        },
    },
},
