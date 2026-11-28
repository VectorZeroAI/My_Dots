return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {'nvim-telescope/telescope-fzf-native.nvim', build = "make"},
        "nvim-telescope/telescope-ui-select.nvim"
    },
    cmd = 'Telescope',
    config = function ()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                layout_strategy = 'horizontal',
                layout_config = { prompt_position = 'top' },
                sorting_strategy = 'ascending',
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown()
                }
            }
        })

        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")
    end
}
