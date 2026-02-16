return {
    "neovim/nvim-lspconfig",
    dependencies = {
        'saghen/blink.cmp',
        'antosha417/nvim-lsp-file-operations',
    },
    config = function()
        local blink_cap = require('blink.cmp').get_lsp_capabilities()
        local file_ops_cap = require('lsp-file-operations').default_capabilities()

        local capabilities = vim.tbl_deep_extend(
            "force",
            blink_cap,
            file_ops_cap
        )

        vim.lsp.config('lua_ls', { capabilities = capabilities })
        vim.lsp.config('ts_ls', { capabilities = capabilities })
    end,
}
