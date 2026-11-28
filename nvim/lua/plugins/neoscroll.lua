return {
    "karb94/neoscroll.nvim",
    config = function()
        require("neoscroll").setup({
            easing_function = "linear",
            hide_cursor = false,
            duration_multiplier = 0.7,
        })
    end,
}
