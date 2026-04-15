return {
    "VectorZeroAI/ai_diagnos.nvim",
    branch = "Update_Rewrite_V1",
    config = function()
        require("ai_diagnos").setup({
            api_key_openrouter = "",
            debounce_ms = 7000,
            model_openrouter = "qwen/qwen3-next-80b-a3b-instruct:free",
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
    build = function ()
        require("ai_diagnos").build(true, false)
    end
}
