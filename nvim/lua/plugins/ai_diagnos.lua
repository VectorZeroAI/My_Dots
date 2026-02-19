return {
    "VectorZeroAI/ai_diagnos.nvim",
    branch = "Update_Rewrite_V1",
    config = function()
        require("ai_diagnos").setup({
            api_key_openrouter = "",
            debounce_ms = 7000,
            model = "tngtech/deepseek-r1t2-chimera:free",
            timeout = 999999,
            api_key_gemini = "",
            api_key_groq = "",
        })
    end,
}
