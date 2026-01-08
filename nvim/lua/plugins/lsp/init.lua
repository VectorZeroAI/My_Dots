local is_android = vim.fn.has("android") == 1

if is_andoird then
    return {
        require('plugins.lsp.lsp'),
    }
else
    return {
        require('plugins.lsp.mason'),
        require('plugins.lsp.lsp'),
        require('plugins.lsp.mason-lspconfig'),
    }
end
