-- init.lua - clean, unified version

-- ============================================================
-- BASIC OPTIONS
-- ============================================================
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.numberwidth = 4
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smoothscroll = true

-- Tabs as 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Show diagnostics on hover
vim.opt.updatetime = 250
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end,
})

-- Markdown-specific wrapping
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true
    end,
})

-- ============================================================
-- BOOTSTRAP LAZY.NVIM
-- ============================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================
-- PLUGINS
-- ============================================================
    require("lazy").setup({

        -- Theme (load first)
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
        },
        {
            'nvim-telescope/telescope.nvim',
            dependencies = { 'nvim-lua/plenary.nvim' },
            cmd = 'Telescope',
            keys = {
                { '<leader>sf', '<cmd>Telescope find_files<cr>', desc = '[S]earch [F]iles' },
                { '<leader>sg', '<cmd>Telescope live_grep<cr>', desc = '[S]earch by [G]rep' },
                
                -- Override / to use Telescope
                { '/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Search buffer' },
            },
            config = function()
                require('telescope').setup({
                    defaults = {
                        layout_strategy = 'horizontal',
                        layout_config = { prompt_position = 'top' },
                        sorting_strategy = 'ascending',
                    },
                })
            end,
        },

        -- AI diagnostics
        {
            "VectorZeroAI/ai_diagnos.nvim",
            config = function()
                require("ai_diagnos").setup({
                    api_key = "nope, didnt forget",
                    model = "tngtech/deepseek-r1t2-chimera:free",
                    timeout_ms = 30000,
                })
            end,
        },

        -- Markdown enhancements
        {
            "yousefhadder/markdown-plus.nvim",
            ft = { "markdown", "text", "txt" },
            config = function()
                require("markdown-plus").setup({
                    filetypes = { "markdown", "md" },
                    features = {
                        list_management = true,
                        text_formatting = true,
                    },
                })
            end,
        },

        -- Smooth scrolling
        {
            "karb94/neoscroll.nvim",
            config = function()
                require("neoscroll").setup({
                    easing_function = "cubic",
                    hide_cursor = false,
                    duration_multiplier = 1.5,
                })
            end,
        },

        -- Indent guides
        {
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            opts = {},
        },

        -- Treesitter (syntax highlighting)
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            dependencies = {
                "nvim-treesitter/nvim-treesitter-textobjects",
            },
            config = function()
                require("nvim-treesitter.configs").setup({
                    ensure_installed = { "python", "lua", "json", "sql", "markdown", "go" },

                    highlight = { enable = true },
                    indent = { enable = true },

                    -- Textobjects: structural editing
                    textobjects = {
                        select = {
                            enable = true,
                            lookahead = true,

                            keymaps = {
                                -- Functions
                                ["af"] = "@function.outer",
                                ["if"] = "@function.inner",

                                -- Classes
                                ["ac"] = "@class.outer",
                                ["ic"] = "@class.inner",

                                -- Arguments/parameters
                                ["aa"] = "@parameter.outer",
                                ["ia"] = "@parameter.inner",
                            },
                        },

                        move = {
                            enable = true,
                            set_jumps = true,

                            goto_next_start = {
                                ["]m"] = "@function.outer",
                                ["]]"] = "@class.outer",
                            },

                            goto_previous_start = {
                                ["[m"] = "@function.outer",
                                ["[["] = "@class.outer",
                            },
                        },

                        swap = {
                            enable = true,

                            swap_next = {
                                ["<leader>a"] = "@parameter.inner",
                            },
                            swap_previous = {
                                ["<leader>A"] = "@parameter.inner",
                            },
                        },
                    },

                    -- Incremental selection
                    incremental_selection = {
                        enable = true,
                        keymaps = {
                            init_selection = "gnn",
                            node_incremental = "grn",
                            node_decremental = "grm",
                        },
                    },
                })
            end,
        },

        {
          "folke/todo-comments.nvim",
          dependencies = { "nvim-lua/plenary.nvim" },
          opts = {
            keywords = {
              TODO  = { icon = " ", color = "info" },
              FIXME = { icon = " ", color = "error" },
              NOTE  = { icon = " ", color = "hint" },
            },
          },
        },

        -- ============================================================
        -- LSP CONFIGURATION (0.11+ Native API Only)
        -- ============================================================
        {
            "neovim/nvim-lspconfig",
            config = function()
                local util = require("lspconfig.util")

                -- Python: Pyright (type checking)
                vim.lsp.config.pyright = {
                    default_config = {
                        cmd = { "pyright-langserver", "--stdio" },
                        filetypes = { "python" },
                        root_dir = util.root_pattern(
                            "pyproject.toml",
                            "setup.py",
                            ".git"
                        ),
                    },
                }

                -- Python: Ruff (linting/formatting - new native server)
                vim.lsp.config.ruff = {
                    default_config = {
                        cmd = { "ruff", "server", "--preview" },
                        filetypes = { "python" },
                        root_dir = util.root_pattern(
                            "pyproject.toml",
                            "ruff.toml",
                            ".git"
                        ),
                    },
                }

                -- JSON
                vim.lsp.config.jsonls = {
                    default_config = {
                        cmd = { "vscode-json-language-server", "--stdio" },
                        filetypes = { "json", "jsonc" },
                        root_dir = util.find_git_ancestor,
                    },
                }

                -- SQL
                vim.lsp.config.sqls = {
                    default_config = {
                        cmd = { "sqls" },
                        filetypes = { "sql", "mysql" },
                        root_dir = util.root_pattern(".git"),
                    },
                    settings = {
                        sqls = {
                            connections = {},
                        },
                    },
                }

                -- Lua
                vim.lsp.config.lua_ls = {
                    default_config = {
                        cmd = { "lua-language-server" },
                        filetypes = { "lua" },
                        root_dir = util.root_pattern(".git", "init.lua"),
                    },
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = { globals = { "vim" } },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                            telemetry = { enable = false },
                        },
                    },
                }

                -- Go
                vim.lsp.config.gopls = {
                    default_config = {
                        cmd = { "gopls" },
                        filetypes = { "go", "gomod", "gowork", "gotmpl" },
                        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
                        settings = {
                            gopls = {
                                analyses = {
                                    unusedparams = true,
                                    unusedwrite = true,
                                },
                                staticcheck = true,
                                gofumpt = false,
                            },
                        },
                    },
                }

                -- Enable all servers
                vim.lsp.enable("pyright")
                vim.lsp.enable("ruff")
                vim.lsp.enable("jsonls")
                vim.lsp.enable("sqls")
                vim.lsp.enable("lua_ls")
                vim.lsp.enable("gopls")
            end,
        },
    -- ============================================================
    -- AUTOCOMPLETION
    -- ============================================================
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-signature-help",
        },
        config = function()
            local cmp = require("cmp")

            -- Main completion setup
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-e>"] = cmp.mapping.abort(),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "nvim_lua" },
                    { name = "path" },
                },
            })

            -- Cmdline completion for '/'
            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            -- Cmdline completion for ':'
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })
        end,
    },
})

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
