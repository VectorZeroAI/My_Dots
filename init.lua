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

    {
        "VectorZeroAI/ai_diagnos.nvim",
        config = function ()
            require("ai_diagnos").setup({
                api_key = "nope, didnt forget",
                model = "tngtech/deepseek-r1t2-chimera:free",
                timeout_ms = 999999
            })
            
        end
    },

    -- markdown +, for markdown files. 
    {
        "yousefhadder/markdown-plus.nvim",
        ft = { "markdown", "text", "txt" },
        config = function()
            require("markdown-plus").setup({
                -- (you can omit this table if defaults are fine)
                filetypes = { "markdown", "md"},
                -- and you can customize features if you like, e.g.:
                features = { list_management = true, text_formatting = true,}
            })
        end,
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
                    { name = "path" },
                },
            })
        end
    },

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

-- enable to see the error instdead of just seeing that the error is there. 
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.opt_local.wrap = false

-- Enable wrapping only for markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
  end,
})


-- Enabling 3 nore LSPs, specifically LUA, JSON and SQL, 
-- specifically jsonls , sqls , lua_ls . 

-- place this in your init.lua or lua/config/lsp.lua (or similar)
-- Neovim 0.11+ native LSP style

local tbl_extend = vim.tbl_deep_extend

-- ----------------
-- JSON (no special overrides needed)
-- ----------------
-- If you don't need custom settings you can just enable the server;
-- nvim-lspconfig already provides sane defaults for jsonls.
vim.lsp.enable('jsonls')

-- ----------------
-- SQL (we want to set `settings.sqls.connections = {}`)
-- ----------------
vim.lsp.config['sqls'] = tbl_extend("force", vim.lsp.config['sqls'] or {}, {
  -- keep filetypes/cmd/defaults from upstream if present, just add our settings
  settings = {
    sqls = {
      connections = {}
    }
  }
})
vim.lsp.enable('sqls')

-- ----------------
-- Lua (customize runtime, globals, workspace)
-- ----------------
vim.lsp.config['lua_ls'] = tbl_extend("force", vim.lsp.config['lua_ls'] or {}, {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' }, -- don't warn about `vim` in config
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
vim.lsp.enable('lua_ls')
