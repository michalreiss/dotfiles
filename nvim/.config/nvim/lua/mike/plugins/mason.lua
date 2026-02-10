return {
	{
		"williamboman/mason.nvim",
		tag = "stable",
		lazy = false,
		config = true,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"goimports-reviser",
					"golangci-lint",
					"gopls",
					"html-lsp",
					"lua-language-server",
					"python-lsp-server",
					"staticcheck",
				}
			})
		end
	},
}
