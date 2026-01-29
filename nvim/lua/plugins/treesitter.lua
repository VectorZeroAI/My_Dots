-- configuration of treesitter plugin. 
-- one of thevtemplate configuratilns. 
-- must be required from the lazy.lua file.
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    Lazy = false,
    opts = {
        ensure_installed = { "python", "lua", "json", "sql", "markdown", "go" },
        auto_install = true,
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },

        -- Textobjects: structural editing
        textobjects = {
            select = {
                enable = true,
                lookahead = true,

                keymaps = {
                    -- Functions
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",

                    -- Classes
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",

                    -- Arguments/parameters
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                },
            },

            move = {
                enable = true,
                set_jumps = true,

                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },

                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
            },

            swap = {
                enable = true,

                swap_next = {
                    ["<leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                },
            },
        },

        -- Incremental selection
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                node_decremental = "grm",
            },
        },
    },
    {"nvim-treesitter/nvim-treesitter-textobjects", lazy = true  },
}
