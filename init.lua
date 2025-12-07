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

                -- GLOBAL FILTER: remove kind == 1 ("Text")
                entry_filter = function(entry)
                    local kind = entry:get_kind()
                    -- some sources return nil kinds; keep them
                    if kind == nil then
                        return true
                    end
                    -- 1 == Text
                    return kind ~= 1
                end,

                formatting = {
                    format = function(entry, item)
                        -- never return nil; this avoids crashes
                        if item == nil then
                            return {
                                abbr = "",
                                kind = "",
                                menu = "",
                            }
                        end

                        if item.kind == "Text" then
                            -- hide visually
                            item.kind = ""
                            item.abbr = ""
                        end

                        return item
                    end,
                },

                sources = {
                    { name = "nvim_lsp" },
                    { name = "path" },
                },
            })
        end
    },

    {
        "YousefHadder/markdown-plus.nvim",
        ft = { "markdown" },      
        config = function()
            require("markdown-plus").setup({
                enabled = true,
                filetypes = { "markdown", "md", "markdown.mdx" },
            features = {
                code_block = true, 
            },
            })
        end
    }


})


-- Theme

vim.g.nord_contrast = false           -- darker background for sidebar, split etc.
vim.g.nord_borders = true             -- module borders like VS Code
vim.g.nord_disable_background = false -- transparent background
vim.g.nord_cursorline_transparent = false
vim.g.nord_italic = false             -- disable italic everywhere
vim.g.nord_bold = true                -- enable bold for keywords

-- enaling the colortheme. specifically the:
vim.cmd.colorscheme("nord")

-- enable the pop up with explanation of what the fuck the error is, exept making me go to chatGPT. 

vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

