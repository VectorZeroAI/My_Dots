-- nord theme plugin setup. 
{
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
