return {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
        enable = true,
        max_lines = 1,
        mode = 'topline',
        trim_scope = 'outer',
        patterns = {
            patterns = {
                default = {
                      "class",
                      "function",
                      "function_definition",
                      "class_definition",
                },
            },
        },
    }
}
