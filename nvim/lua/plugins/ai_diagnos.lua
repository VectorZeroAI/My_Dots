-- return {
--     "VectorZeroAI/ai_diagnos.nvim",
--     config = function()
--         require("ai_diagnos").setup({
--             api_key = "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",
--             model = "tngtech/deepseek-r1t2-chimera:free",
--             timeout_ms = 9999999,
--         })
--     end,
-- }


return {
    "VectorZeroAI/ai_diagnos.nvim",
    branch = "Update_Rewrite_V1",
    config = function()
        require("ai_diagnos").setup({
            api_key_openrouter = "",
            debounce_ms = 7000,
            model_openrouter = "",
            timeout = 9999,
            api_key_gemini = "",
            api_key_groq = "",
            CrossFileAnalysis = {
                scope = { "work" },
                max_analysis_depth = nil,
                max_string_size_char = 30000
            },
            api_key_cerebras = "",
            api_key_huggingface = ""
        })
    end,
}
