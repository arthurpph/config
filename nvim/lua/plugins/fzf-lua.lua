return {
    {
        "ibhagwan/fzf-lua",
        lazy = false,
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        config = function()
            local fzf = require("fzf-lua")
            vim.keymap.set("n", "<leader>pf", fzf.files, { desc = "FZF files" })
            vim.keymap.set("n", "<leader>ps", function()
                fzf.live_grep({
                    prompt = "Grep > ",
                })
            end, { desc = "FZF grep string" })
            vim.keymap.set("n", "<leader>gf", fzf.git_files, { desc = "FZF git files" })
            vim.keymap.set("n", "<leader>gc", fzf.git_commits)
            vim.keymap.set("n", "<leader>gbc", fzf.git_bcommits)
            vim.keymap.set("n", "<leader>gh", fzf.git_hunks)
            vim.keymap.set("n", "<leader>gb", fzf.git_branches)
            vim.keymap.set("n", "<leader>ds", "<cmd>FzfLua lsp_workspace_diagnostics<CR>", { desc = "FZF diagnostic" })
            vim.keymap.set("n", "<leader>bf", fzf.buffers)
        end,
    }
}
