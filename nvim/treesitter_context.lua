return {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
        enable = true,
        max_lines = 2,
        trim_scope = 'inner',
        patterns = {
            default = {
                'class',
                'function',
                'method',
            },
        },
        mode = 'cursor',
    }
}
