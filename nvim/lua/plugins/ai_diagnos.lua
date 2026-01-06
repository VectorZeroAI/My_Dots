return {
    "VectorZeroAI/ai_diagnos.nvim",
    config = function()
        require("ai_diagnos").setup({
            api_key = "nope, didnt forget",
            model = "tngtech/deepseek-r1t2-chimera:free",
            timeout_ms = 30000,
        })
    end,
}
