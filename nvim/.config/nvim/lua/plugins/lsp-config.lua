local lsps = { "lua_ls", "gopls", "elixirls", "htmx", "templ" }
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
				ensure_installed = lsps,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			for _, lsp in ipairs(lsps) do
				if lsp == "lua_ls" then
					lspconfig[lsp].setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				elseif lsp == "elixirls" then
					lspconfig[lsp].setup({
						capabilities = capabilities,
						cmd = { "$HOME/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
					})
				elseif lsp == "templ" then
					local util = require("lspconfig.util")

					lspconfig[lsp].setup({
						capabilities = capabilities,
						default_config = {
							cmd = { "templ", "lsp" },
							filetypes = { "templ" },
							root_dir = function(fname)
								return util.root_pattern("go.work", "go.mod", ".git")(fname)
							end,
						},
					})
				else
					lspconfig[lsp].setup({
						capabilities = capabilities,
					})
				end
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, {})

			vim.filetype.add({ extension = { templ = "templ" } })
		end,
	},
}
