return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',
    keys = {
        { '<leader>sf', '<cmd>Telescope find_files<cr>', desc = '[S]earch [F]iles' },
        { '<leader>sg', '<cmd>Telescope live_grep<cr>', desc = '[S]earch by [G]rep' },

        -- Override / to use Telescope
        { '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Search buffer' },
    },
    config = function()
        require('telescope').setup({
            defaults = {
                layout_strategy = 'horizontal',
                layout_config = { prompt_position = 'top' },
                sorting_strategy = 'ascending',
            },
        })
    end,
},
