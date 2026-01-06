return {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    opts = {
        keymap = {
            preset = 'default',
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<CR>'] = { 'accept', 'fallback' },
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },
        sources = {
            default = { 'lsp', 'path' },
        },
        signature = { enabled = true }
    },
    opts_extend = { "sources.default" }
}
