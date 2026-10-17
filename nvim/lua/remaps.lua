-- a centralised way to keep all the remaps in place
--
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

---------- misc -------
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', {desc = "Stop highlighting when pressing Esc, and it has nothing else to do . "})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

vim.keymap.set("n", "p", "]p", {desc="Remapped reindent paste to normal paste"})
vim.keymap.set("n", "<leader>p", "p", {desc="Remapped normal paste to leader paste."})

vim.keymap.set("n", "cc", ":cclose<CR>", {desc="[c][c]lose command"})

vim.keymap.set("n", "n", "nzz", {desc="[n]ext and center"})
vim.keymap.set("n", "N", "Nzz", {desc="[N]ext invert and center"})

vim.keymap.set("n", "<leader>u", ":Undotree<CR>")
vim.cmd("packadd nvim.undotree") -- activate the undotree so it works


------- telescope ----------
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>sf', function ()
    local _, err = pcall(telescope.git_files)
    if err ~= nil then
        telescope.find_files()
    end
end, { desc = "[S]earch [F]iles , only in your current repo, but thats the default, if doesnt work fall back to all files."})

vim.keymap.set('n', '<leader>saf', function ()
    telescope.find_files()
end, { desc = "[S]earch [a]ll [f]iles" })

vim.keymap.set('n', '<leader>sw', function ()
    telescope.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = " [s]earch for [w]ord across everything"})

vim.keymap.set('n', '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { desc = 'Search buffer' })

-------- LSP -----------

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

        vim.keymap.set({'n', 'v'}, '<leader>ca', function ()
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

-------- Harpoon ---------

local harpoon = require('harpoon')

harpoon:setup()

vim.keymap.set('n', '<S-h>', '<cmd>bn<CR>', {desc = "Go to [b]uffer [n]ext"})

vim.keymap.set('n', '<S-l>', '<cmd>bp<CR>', {desc = "Go to [b]uffer [p]revious"})

vim.keymap.set('n', '<leader>ex', '<cmd>Ex<CR>', {desc = "Open [Ex]plorer"})

vim.keymap.set('n', '<leader>a', function ()
    harpoon:list():add()
end, {desc = "add current file to harpoon"})

vim.keymap.set('n', '<leader>1', function ()
    harpoon:list():select(1)
end)

vim.keymap.set('n', '<leader>2', function ()
    harpoon:list():select(2)
end)

vim.keymap.set('n', '<leader>3', function ()
    harpoon:list():select(3)
end)

vim.keymap.set('n', '<leader>4', function ()
    harpoon:list():select(4)
end)

vim.keymap.set('n', '<leader>5', function ()
    harpoon:list():select(5)
end)

vim.api.nvim_create_user_command('Harpoon', function ()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, {})

vim.api.nvim_create_user_command('ClearHarpoon', function ()
    harpoon:list():clear()
end, {})

vim.keymap.set("n", "<leader>H", ":Harpoon<CR>", {desc="Faster way to open Harpoon"})



------ folds -----------

-- Smart fold toggle on <CR>
vim.keymap.set("n", "<CR>", function()
  local line = vim.fn.line(".")
  if vim.fn.foldlevel(line) > 0 then
    vim.cmd("normal! za")
  else
    vim.cmd("normal! <CR>")
  end
end, { silent = true })


----- Quick fix list ------

vim.keymap.set('n', '<leader>j', ':cn<CR>', {desc="Move down through quickfix list"})
vim.keymap.set('n', '<leader>k', ':cp<CR>', {desc="Move up through quickfix list"})

----- Neogit -------

vim.keymap.set('n', '<leader>gn', ':Neogit<CR>', {desc="Open Neogit window shorter keybind."})
