local servers = {
    "lua_ls",
}

local capabilities = vim.lsp.protocol.make_client_capabilities()

local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    opts.desc = "Hover Documentation"
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

    opts.desc = "Go to Definition"
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

    opts.desc = "Code Action"
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()

        local lspconfig = require("lspconfig")

        require("mason-lspconfig").setup({
            ensure_installed = servers,
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                    })
                end,
            },
        })
    end,
}
