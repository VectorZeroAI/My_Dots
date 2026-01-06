return {
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
                settings = {
                    sqls = {
                        connections = {},
                    },
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
}
