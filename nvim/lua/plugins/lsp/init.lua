IsAndroid = vim.fn.has("android") == 1

local plugins

if IsAndroid then
    plugins = {
        require("plugins.lsp.lsp"),
    }
else
    plugins = {
        require("plugins.lsp.mason"),
        require("plugins.lsp.lsp"),
        require("plugins.lsp.mason-lspconfig"),
    }
end

return plugins
