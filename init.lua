-- basic options

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.numberwidth = 4
vim.opt.cursorline = true

vim.o.ignorecase = true

-- auto center stuff

vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {
	callback = funktion()
		local win = 0
		local view = vim.fn.winsaveview()

		-- compute new topline so cursor stays centeered vertically
		local height = vim.api.nvim_win_get_height(win)
		local cursor_line = view.lnum
		local new_top = cursor_line - math.floor(height / 2)
				
		if new_top < 1 then new_top = 1 end

		view.topline = new_top
		vim.fn.winrestview(view)
	end, 

})

-- bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
				"git",
				"clone",
				"--filter=blob:none",
				"https://github.com/folke/lazy.nvim.git",
				lazypath,
		})
end

vim.opt.rtp:prepend(lazypath)

-- ========= LSP CONFIGURATION =========

require("lazy").setup({
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },

    -- LSP config
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.pyright.setup({})
        end,
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                },
            })
        end,
    },
})