return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            require("telescope").setup({})
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find files" })
            vim.keymap.set("n", "<C-f>", builtin.current_buffer_fuzzy_find, { desc = "Search in current file" })
            vim.keymap.set("n", "<leader>f", builtin.live_grep, { desc = "Search in working directory" })
            vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
            vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
            vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
            vim.keymap.set("n", "<leader>d", builtin.diagnostics, { desc = "Open diagnostic Quickfix list" })

            -- Shortcut for searching your Neovim configuration files
            vim.keymap.set("n", "<leader>sn", function()
                builtin.find_files({ cwd = vim.fn.stdpath("config") })
            end, { desc = "Search Neovim files" })
        end,
    },
}
