-- markdown specific rules here
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

vim.keymap.set("n", "<leader>b", "ebi**<esc>ea**<esc>", { desc = "[b]old the markdown text" })

-- spellcheck
vim.opt_local.spell = true
vim.opt_local.spelllang = { "en_us", "de" }
vim.opt_local.spellfile = vim.fn.stdpath("data") .. "/spell/any.utf-8.add"

vim.keymap.set("n", "<leader>tc",
    [=[:s/\v(^|\s)["'([{“‘]*\zs\w/\u&/ge<CR>]=],
    { desc = "Title case line" })

vim.keymap.set("x", "<leader>tc",
    [=[:s/\v(^|\s)["'([{“‘]*\zs%V\w/\u&/ge<CR>]=],
    { desc = "Title case selection" })
