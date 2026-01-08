local is_android = vim.fn.has("android") == 1
if is_android == true{
    return {
        require('plugins.lsp.mason'),
        require('plugins.lsp.lsp'),
    }
}
else{
    return {
        require('plugins.lsp.mason'),
        require('plugins.lsp.lsp'),
        require('plugins.lsp.mason-lspconfig'),
    }
}
