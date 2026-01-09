return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',
    opts = {
        defaults = {
            layout_strategy = 'horizontal',
            layout_config = { prompt_position = 'top' },
            sorting_strategy = 'ascending',
        }
    }
}
