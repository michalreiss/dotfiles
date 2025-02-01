return {
    "echasnovski/mini.nvim",
    config = function()
        local statusline = require("mini.statusline")
        local pairs = require("mini.pairs")
        local comment = require("mini.comment")
        statusline.setup({ use_icons = vim.g.have_nerd_font })
        statusline.section_location = function()
            return "%2l:%-2v"
        end
        pairs.setup()
        comment.setup()
    end,
}
