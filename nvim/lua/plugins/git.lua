-- git integration into neovim

return {
    -- Git gutter signs + hunk operations
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
                current_line_blame = true, -- optional but nice
        },
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "NeogitOrg/neogit",
        cmd = "Neogit",
    }
}
