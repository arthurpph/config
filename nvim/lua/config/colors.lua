function Pencil(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    local groups = {
        "Normal",
        "NormalFloat",
        "NormalNC",
        "StatusLine",
        "StatusLineNC",
        "SignColumn",
        "ColorColumn",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "NeoTreeEndOfBuffer",
        "NeoTreeWinSeparator",
    }

    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
    end

    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#5f87af" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#5f87af" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff", bold = true })
end

Pencil("tokyonight-night")
