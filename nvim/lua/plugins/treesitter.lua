-- configuration of treesitter plugin. 
-- one of thevtemplate configuratilns. 
-- must be required from the lazy.lua file.
------ Version 1 (Broken ) ----------
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
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
}

-- Version 2 (Trying to fix )

-- return {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     lazy = false,
--     config = function ()
--         require("nvim-treesitter.config").setup({
--             ensure_installed = {
--                 "lua",
--                 "vim",
--                 "vimdoc",
--                 "bash",
--                 "python",
--                 "go",
--             },
--             highlight = { enable = true },
--             indent = { enable = true },
--       })
--     end,
-- }


-- Version 3 (Try 2)
-- return {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     lazy = false,
--     opts = {
--     },
--     config = function ()
--         require('nvim-treesitter.configs').setup({
--             ensure_installed = {
--                 "lua",
--                 "vim",
--                 "vimdoc",
--                 "bash",
--                 "python",
--                 "go",
--             },
--             highlight = {
--                 enable = true,
--             },
--             indent = {
--                 enable = true,
--             },
--         })
--     end
-- }
