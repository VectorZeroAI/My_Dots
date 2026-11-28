-- a centralised way to keep all the remaps in place
--
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local set = vim.keymap.set

---------- misc -------
set('n', '<Esc>', '<cmd>nohlsearch<CR>', {desc = "Stop highlighting when pressing Esc, and it has nothing else to do . "})

set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

set("n", "p", "]p", {desc="Remapped reindent paste to normal paste"})
set("n", "<leader>p", "p", {desc="Remapped normal paste to leader paste."})
set("v", "p", '"_p', {desc="Remap paste in visual to not overwrite the paste register cause I like it that way"})
set("v", "<leader>p", 'p')

set("n", "<leader>cc", ":cclose<CR>", {desc="[c]quickfix [c]lose command"})

set("n", "n", "nzz", {desc="[n]ext and center"})
set("n", "N", "Nzz", {desc="[N]ext invert and center"})

------- Undotree -------------

set("n", "<leader>u", ":Undotree<CR>")
vim.cmd("packadd nvim.undotree") -- activate the undotree so it works

------- telescope ----------
local telescope = require('telescope.builtin')

set('n', '<leader>sf', function ()
    local _, err = pcall(telescope.git_files)
    if err ~= nil then
        telescope.find_files()
    end
end, { desc = "[S]earch [F]iles , only in your current repo, but thats the default, if doesnt work fall back to all files."})

set('n', '<leader>saf', function ()
    telescope.find_files()
end, { desc = "[S]earch [a]ll [f]iles" })

set('n', '<leader>sw', function ()
    telescope.live_grep()
end, { desc = " [s]earch for [w]ord across everything"})

set('n', '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { desc = 'Search buffer' })

-------- LSP -----------

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function ()
        set('n', "<leader>d", function ()
            require('telescope.builtin').diagnostics()
        end, {desc = " show [d]agnostics "})

        set('n', '<leader>gi', function ()
            telescope.lsp_implementations()
        end, {desc = " [g]oto [i]mplementation "})

        set('n', '<leader>rn', function ()
            vim.lsp.buf.rename()
        end, {desc = "[r]e[n]ame the thing"})

        set({'n', 'v'}, '<leader>ca', function ()
            vim.lsp.buf.code_action()
        end, {desc = "[c]ode [a]ctions"})

        set('n', 'gd', function ()
            vim.lsp.buf.definition()
        end, { desc = " [G]oto [d]efinition "})

        set("n", "<leader>ss", function ()
            telescope.lsp_dynamic_workspace_symbols()
        end, {desc = "[s]earch [s]ymbols"})

        set('n', 'K', function ()
            vim.lsp.buf.hover()
        end, { desc = " hover do[k]s "})
    end
})

-------- Harpoon ---------

local harpoon = require('harpoon')

harpoon:setup()

set('n', '<leader>ex', '<cmd>ex<CR>', {desc = "Open [ex]plorer"})

set('n', '<leader>a', function ()
    harpoon:list():add()
end, {desc = "add current file to harpoon"})

set('n', '<leader>1', function ()
    harpoon:list():select(1)
end)

set('n', '<leader>2', function ()
    harpoon:list():select(2)
end)

set('n', '<leader>3', function ()
    harpoon:list():select(3)
end)

set('n', '<leader>4', function ()
    harpoon:list():select(4)
end)

set('n', '<leader>5', function ()
    harpoon:list():select(5)
end)

vim.api.nvim_create_user_command('Harpoon', function ()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, {})

vim.api.nvim_create_user_command('ClearHarpoon', function ()
    harpoon:list():clear()
end, {})

set("n", "<leader>H", ":Harpoon<CR>", {desc="Faster way to open Harpoon"})



------ folds -----------

-- Smart fold toggle on <CR>
set("n", "<CR>", function()
    local line = vim.fn.line(".")
    if vim.fn.foldlevel(line) > 0 then
        vim.cmd("normal! za")
    else
        vim.cmd("normal! <CR>")
    end
end, { silent = true })


----- Quick fix list ------

set('n', '<leader>j', ':cn<CR>', {desc="Move down through quickfix list"})
set('n', '<leader>k', ':cp<CR>', {desc="Move up through quickfix list"})

----- Neogit -------

set('n', '<leader>gn', ':Neogit<CR>', {desc="Open Neogit window shorter keybind."})
