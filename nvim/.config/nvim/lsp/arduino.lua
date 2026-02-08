return {
	capabilities = {
		textDocument = {
			semanticTokens = vim.NIL,
		},
		workspace = {
			semanticTokens = vim.NIL,
		},
	},
	cmd = {
		"arduino-language-server",
		"-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
		"-cli", "arduino-cli",
	},
	filetypes = { "arduino" },
	root_dir = function(_, on_dir)
		on_dir(vim.fn.expand("%:p:h"))
	end,
}
