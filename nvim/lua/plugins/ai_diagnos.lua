return {
    "VectorZeroAI/ai_diagnos.nvim",
    config = function()
        require("ai_diagnos").setup({
            api_key = "",
            model = "tngtech/deepseek-r1t2-chimera:free",
            timeout_ms = 9999999,
        })
    end,
}
