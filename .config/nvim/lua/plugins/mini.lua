--return {
--	"nvim-lualine/lualine.nvim",
--	dependencies = { "nvim-tree/nvim-web-devicons" },
--	config = function()
--		require("lualine").setup({
--			options = {
--				theme = "auto",
--			},
--		})
--	end,
--}
return {
	"echasnovski/mini.nvim",
	config = function()
		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font })
		statusline.section_location = function()
			return "%2l:%-2v"
		end
	end,
}
