-- lsp
function RestartLSP()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })

	for _, c in ipairs(clients) do
		if c.name ~= "GitHub Copilot" and c.name ~= "null-ls" then
			vim.lsp.enable(c.name, false)
			vim.lsp.enable(c.name, true)
		end
	end
end

vim.lsp.enable({
	"lua",
	"go",
	"html",
	"htmx",
	"python",
	"templ",
})

vim.keymap.set("n", "<leader>lr", RestartLSP, { desc = "Restart LSP for current buffer" })
