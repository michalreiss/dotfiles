return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<C-f>", builtin.current_buffer_fuzzy_find, { desc = "Search in current file" })
			vim.keymap.set("n", "<leader>f", builtin.live_grep, { desc = "Search in working directory" })
			vim.keymap.set("n", "<leader>d", builtin.diagnostics, { desc = "Diagnostics" })
			vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "Go to references" })
			vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "Go to definition" })
			vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "Go to implementation" })
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
