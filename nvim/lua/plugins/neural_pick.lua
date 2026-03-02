return {
    "VectorZeroAI/neural-open.nvim",
    dependencies = {
        "folke/snacks.nvim",
    },

    lazy=false,

    keys = {
        { "<leader><leader>", "<Plug>(NeuralOpen)", desc = "Neural Open Files" },
    },

    opts = {},
}
