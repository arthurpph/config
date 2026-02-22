return {
    "Eandrju/cellular-automaton.nvim",
    config = function()
        vim.keymap.set("n", "<leader>rain", function()
            require("cellular-automaton").start_animation("make_it_rain")
        end)
    end
}
