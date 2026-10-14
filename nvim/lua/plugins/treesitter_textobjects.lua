return {
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("nvim-treesitter-textobjects").setup({
                move = {
                    set_jumps = true,
                },
            })

            local select = require(
                "nvim-treesitter-textobjects.select"
            ).select_textobject

            local move = require(
                "nvim-treesitter-textobjects.move"
            )

            local swap = require(
                "nvim-treesitter-textobjects.swap"
            )

            vim.keymap.set("n", "<leader>sr", function ()
                swap.swap_next("@parameter.inner")
            end, {desc = "[s]wap [r]ight -> left"})

            vim.keymap.set("n", "<leader>sl", function ()
                swap.swap_previous("@parameter.inner")
            end, {desc = "[s]wap [l]eft -> right"})

            -- Text objects: visual mode and operator-pending mode
            -- Examples: vaf, vif, daf, yac
            vim.keymap.set({ "x", "o" }, "af", function()
                select("@function.outer", "textobjects")
            end, { desc = "[a]round [f]unction" })

            vim.keymap.set({ "x", "o" }, "if", function()
                select("@function.inner", "textobjects")
            end, { desc = "[i]nside [f]unction" })

            vim.keymap.set({ "x", "o" }, "ac", function()
                select("@class.outer", "textobjects")
            end, { desc = "[a]round [c]lass" })

            vim.keymap.set({ "x", "o" }, "ic", function()
                select("@class.inner", "textobjects")
            end, { desc = "[i]nside [c]lass" })

            -- Navigate to function starts and ends
            vim.keymap.set({ "n", "x", "o" }, "]f", function()
                move.goto_next_start("@function.outer", "textobjects")
            end, { desc = "Next [f]unction start" })

            vim.keymap.set({ "n", "x", "o" }, "[f", function()
                move.goto_previous_start("@function.outer", "textobjects")
            end, { desc = "Previous [f]unction start" })

            vim.keymap.set({ "n", "x", "o" }, "]F", function()
                move.goto_next_end("@function.outer", "textobjects")
            end, { desc = "Next [f]unction end" })

            vim.keymap.set({ "n", "x", "o" }, "[F", function()
                move.goto_previous_end("@function.outer", "textobjects")
            end, { desc = "Previous [f]unction end" })

            -- Navigate to class starts and ends
            vim.keymap.set({ "n", "x", "o" }, "]c", function()
                move.goto_next_start("@class.outer", "textobjects")
            end, { desc = "Next [c]lass start" })

            vim.keymap.set({ "n", "x", "o" }, "[c", function()
                move.goto_previous_start("@class.outer", "textobjects")
            end, { desc = "Previous [c]lass start" })

            vim.keymap.set({ "n", "x", "o" }, "]C", function()
                move.goto_next_end("@class.outer", "textobjects")
            end, { desc = "Next [c]lass end" })

            vim.keymap.set({ "n", "x", "o" }, "[C", function()
                move.goto_previous_end("@class.outer", "textobjects")
            end, { desc = "Previous [c]lass end" })

            -- Navigate scopes using the locals query group
            vim.keymap.set({ "n", "x", "o" }, "]s", function()
                move.goto_next_start("@local.scope", "locals")
            end, { desc = "Next [s]cope" })

            vim.keymap.set({ "n", "x", "o" }, "[s", function()
                move.goto_previous_start("@local.scope", "locals")
            end, { desc = "Previous [s]cope" })
        end,
    },
}

