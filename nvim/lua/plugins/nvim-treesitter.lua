return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require 'nvim-treesitter'.setup({
            -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
            install_dir = vim.fn.stdpath('data') .. '/site',

            ensure_installed = {
                "lua", "vim", "vimdoc", "bash",
                "javascript", "typescript", "json",
                "html", "css"
            },

            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,
        })
    end
}
