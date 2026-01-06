{
    "karb94/neoscroll.nvim",
    config = function()
        require("neoscroll").setup({
            easing_function = "cubic",
            hide_cursor = false,
            duration_multiplier = 1.5,
        })
    end,
}
