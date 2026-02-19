-- nord theme plugin setup. 
return {
    "shaunsingh/nord.nvim",
    priority = 1000,
    config = function()
        vim.g.nord_contrast = true
        vim.g.nord_borders = true
        vim.g.nord_disable_background = false
        vim.g.nord_cursorline_transparent = false
        vim.g.nord_italic = false
        vim.g.nord_bold = true
        vim.cmd.colorscheme("nord")
    end,
}


-- return { 
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--         require("catppuccin").setup({
--             styles = {
--                 comments = {},
--                 conditionals = {},
--                 loops = {},
--                 functions = {},
--                 keywords = {},
--                 strings = {},
--                 variables = {},
--                 numbers = {},
--                 booleans = {},
--                 properties = {},
--                 types = {},
--                 operators = {},
--             }
--         })
--         vim.cmd.colorscheme("catppuccin")
--         vim.g.capuchin_disable_italics = true
--     end
-- }
