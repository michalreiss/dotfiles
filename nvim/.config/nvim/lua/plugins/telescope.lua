return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<C-f>", builtin.current_buffer_fuzzy_find, { desc = "Search in current file" })
			vim.keymap.set("n", "<leader>f", builtin.live_grep, { desc = "Search in working directory" })
			vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Go to references" })
			vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to definition" })
			vim.keymap.set("n", "gI", builtin.lsp_implementations, { desc = "Go to implementation" })
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
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
