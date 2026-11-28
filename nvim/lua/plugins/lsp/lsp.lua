-- lspconfig
return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local util = require("lspconfig.util")

            -- Python: Pyright (type checking)
            -- vim.lsp.config.pyright = {
            --     default_config = {
            --         cmd = { "pyright-langserver", "--stdio" },
            --         filetypes = { "python" },
            --         root_dir = util.root_pattern(
            --             "pyproject.toml",
            --             "setup.py",
            --             ".git"
            --         ),
            --     },
            -- }

            -- SQL
            vim.lsp.config.sqls = {
                config = {
                    settings = {
                        sqls = {
                            connections = {
                                -- TODO: Add here connections for when working with it
                            },
                        },
                    },
                },
            }

            -- Lua
            vim.lsp.config.lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim", "hl" } },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            }

            -- -- Go
            -- vim.lsp.config.gopls = {
            --     default_config = {
            --         cmd = { "gopls" },
            --         filetypes = { "go", "gomod", "gowork", "gotmpl" },
            --         root_dir = util.root_pattern("go.work", "go.mod", ".git"),
            --         settings = {
            --             gopls = {
            --                 analyses = {
            --                     unusedparams = true,
            --                     unusedwrite = true,
            --                 },
            --                 staticcheck = true,
            --                 gofumpt = false,
            --             },
            --         },
            --     },
            -- }
            -- TODO: Check the differense to LSPCONFIG and only use the differenses, dont define literaly everything

            vim.lsp.config.tinymist = {
                config = {
                    settings = {
                        formatterMode = "typstyle",
                        formatterProseWrap = "sentence",
                        formatterPrintWidth = 80,
                        formatterIndentSize = 4,
                        semanticTokens = "enable",
                        exportPdf = "onSave",
                    }
                }
            }

            -- Enable all servers
            -- vim.lsp.enable("pyright")
            vim.lsp.enable("basedpyright")
            vim.lsp.enable("ruff")
            vim.lsp.enable("jsonls")
            vim.lsp.enable("sqls")
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("gopls")
            vim.lsp.enable("html")
            vim.lsp.enable("tinymist")
            vim.lsp.enable("ocamllsp")
        end,
    },
}

