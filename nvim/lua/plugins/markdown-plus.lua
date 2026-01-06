return {
    "yousefhadder/markdown-plus.nvim",
    ft = { "markdown", "text", "txt" },
    config = function()
        require("markdown-plus").setup({
            filetypes = { "markdown", "md" },
            features = {
                list_management = true,
                text_formatting = true,
            },
        })
    end,
},
