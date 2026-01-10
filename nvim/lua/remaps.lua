-- a centralised way to keep all the remaps in place
--
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

---------- misc -------
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', {desc = "Stop highlighting when pressing Esc, and it has nothing else to do . "})

----- inter file movement -------

vim.keymap.set('n', '<S-h>', '<cmd>bn<CR>', {desc = "Go to [b]uffer [n]ext"})

vim.keymap.set('n', '<S-l>', '<cmd>bp<CR>', {desc = "Go to [b]uffer [p]revious"})

vim.keymap.set('n', '<leader>ex', '<cmd>Ex<CR>', {desc = "Open [Ex]plorer"})

------- telescope ----------
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>sf', function ()
    telescope.git_files()
end, { desc = "[S]earch [F]iles , only in your current repo, but thats the default. "})

vim.keymap.set('n', '<leader>saf', function ()
    telescope.find_files()
end, { desc = "[S]earch [a]ll [f]iles" })

vim.keymap.set('n', '<leader>sw', function ()
    telescope.grep_string()
end, { desc = " [s]earch for [w]ord across everything"})

vim.keymap.set('n', '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { desc = 'Search buffer' })

-------- LSP -----------
--- The LSP on attach keymap creation
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function ()
        vim.keymap.set('n', "<leader>d", function ()
            require('telescope.builtin').diagnostics()
        end, {desc = " show [d]agnostics "})

        vim.keymap.set('n', '<leader>gi', function ()
            telescope.lsp_implementations()
        end, {desc = " [g]oto [i]mplementation "})

        vim.keymap.set('n', '<leader>rn', function ()
            vim.lsp.buf.rename()
        end, {desc = "[r]e[n]ame the thing"})

        vim.keymap.set('n', '<leader>ca', function ()
            vim.lsp.buf.code_action()
        end, {desc = "[c]ode [a]ctions"})

        vim.keymap.set('n', 'gd', function ()
            vim.lsp.buf.definition()
        end, { desc = " [G]oto [d]efinition "})

        vim.keymap.set('n', 'K', function ()
            vim.lsp.buf.hover()
        end, { desc = " hover do[k]s "})
    end
})
----------------- git ---------------------

vim.keymap.set('n', '<leader>go', '<cmd>Git<CR>', {desc = "[g]it [o]pen"})
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>')

