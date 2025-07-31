return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gg", ":Git<CR>", {})
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()

            vim.keymap.set("n", "<leader>gtb", ":Gitsigns toggle_current_line_blame<CR>", {})
            vim.keymap.set("n", "<leader>gb", ":Gitsigns blame<CR>", {})
        end,
    },
}
