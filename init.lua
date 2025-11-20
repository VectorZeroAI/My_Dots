-- init.lua - complete config (drop-in)

-- basic options
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.numberwidth = 4
vim.opt.cursorline = true

vim.o.ignorecase = true

vim.o.smoothscroll = true

-- tabs as 4 spaces
vim.opt.expandtab = true       -- use spaces instead of tabs
vim.opt.tabstop = 4            -- how many columns a tab counts for
vim.opt.shiftwidth = 4         -- indentation amount for >>, << and autoindent
vim.opt.softtabstop = 4        -- number of spaces a <Tab> counts for while editing

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

-- plugins and configs
require("lazy").setup({
    --------------------------------------------------------------------
    -- neoscroll - smooth scrolling
    --------------------------------------------------------------------
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup({
                -- optional settings; defaults are OK too
                easing_function = "cubic",
                hide_cursor = false,
                duration_multiplier = 1.5
            })

        end,
    },

    -------------------------------------
    -- indent-blankline 
    -------------------------------------

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },


    {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.pyright.setup({})
        lspconfig.ruff_lsp.setup({})
        end
    },

    --------------------------------------------------------------------
    -- neoscroll - smooth scrolling
    --------------------------------------------------------------------
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup({
                -- optional settings; defaults are OK too
                easing_function = "cubic",
                hide_cursor = false,
                duration_multiplier = 1.5
            })

        end,
    },



    --------------------------------------------------------------------
    -- Treesitter
    --------------------------------------------------------------------
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
    

    {
        "shaunsingh/nord.nvim",
        priority = 1000
    },






    --------------------------------------------------------------------
    -- LSP (Neovim 0.11 API)
    --------------------------------------------------------------------
	{
	    "neovim/nvim-lspconfig",
	    config = function()
		local util = require("lspconfig.util")

		-- Pyright
		vim.lsp.config["pyright"] = {
		    default_config = {
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
			root_dir = util.root_pattern(
			    "pyproject.toml",
			    "setup.py",
			    "setup.cfg",
			    ".git"
			),
		    },
		    settings = {},
		}

		-- Ruff LSP
		vim.lsp.config["ruff_lsp"] = {
		    default_config = {
			cmd = { "ruff-lsp" },
			filetypes = { "python" },
			root_dir = util.root_pattern(
			    "pyproject.toml",
			    "ruff.toml",
			    ".git"
			),
		    },
		    settings = {},
		}

		-- Enable them
		vim.lsp.enable("pyright")
		vim.lsp.enable("ruff_lsp")
	    end,
	},

    --------------------------------------------------------------------
    -- Autocompletion (nvim-cmp)
    --------------------------------------------------------------------
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


-- Theme
vim.cmd.colorscheme("nord")
