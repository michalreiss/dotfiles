return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls", "html", "htmx", "templ" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
				filetypes = { "html", "templ" },
			})
			lspconfig.htmx.setup({
				capabilities = capabilities,
				filetypes = { "html", "templ" },
			})

			vim.keymap.set("n", "<leader>sd", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, {})

			vim.filetype.add({ extension = { templ = "templ" } })
		end,
	},
}
