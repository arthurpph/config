return {
    "kawre/leetcode.nvim",
    -- lazy = "leetcode.nvim" ~= vim.fn.argv(0, -1),
    cmd = "Leet",
    build = "TSUpdate html",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        lang = "python3",
        image_support = true,
    },
}
