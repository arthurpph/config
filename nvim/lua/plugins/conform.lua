local prettier = { "prettierd", "prettier", stop_after_first = true }
local lsp_fallback_files = { "lua" }

local function use_lsp_fallback(bufnr)
    local filetype = vim.bo[bufnr].filetype
    for _, current_file in ipairs(lsp_fallback_files) do
        if current_file == filetype then
            return true
        end
    end
    return false
end

return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            javascript = prettier,
            javascriptreact = prettier,
            typescript = prettier,
            typescriptreact = prettier,

            python = { "isort", "black" },
        },
        format_on_save = {
            timeout_ms = 2500,
        },
        format_after_save = function(bufnr)
            return {
                lsp_fallback = use_lsp_fallback(bufnr),
            }
        end,
    },
}
