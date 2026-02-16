return {
    "tpope/vim-fugitive",
    name = "vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end
}
