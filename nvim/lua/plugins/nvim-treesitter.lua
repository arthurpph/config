return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').setup({
            install_dir = vim.fn.stdpath('data') .. '/site',
        })
        require('nvim-treesitter').install({
            "lua", "vim", "vimdoc", "bash",
            "javascript", "typescript", "json",
            "java",
            "python",
            "html", "css"
        })
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { '<filetype>' },
            callback = function() vim.treesitter.start() end,
        })
    end
}
