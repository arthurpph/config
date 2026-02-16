local lspconfig_path = vim.fn.stdpath("config") .. "/lua/config/lspconfig/*.lua"

for _, file in ipairs(vim.split(vim.fn.glob(lspconfig_path), "\n")) do
    local module = file:match("lua/(.+)%.lua$")
    if module then
        local ok, _ = pcall(require, module)
        if not ok then
            print("Fail to load LSP config file: " .. module)
        end
    end
end

vim.lsp.enable({
    'ts_ls',
    'clangd',
    'pylsp',
    'lua_ls',
})

vim.diagnostic.config({
    virtual_lines = true,
    update_in_insert = true,
    signs = true,
    underline = true,
})
