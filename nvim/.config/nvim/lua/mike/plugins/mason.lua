return {
	"williamboman/mason.nvim",
	tag = "stable",
	lazy = false,
	config = true,
	ensure_installed = {
		"goimports-reviser",
		"gopls",
		"html-lsp",
		"htmx-lsp",
		"lua-language-server",
		"python-lsp-server",
		"staticcheck",
		"templ",
		"terraform-ls",
	}
}
