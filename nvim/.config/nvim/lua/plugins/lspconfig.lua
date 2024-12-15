 return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
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
        				ensure_installed = { "lua_ls", "gopls", "elixirls", "htmx", "templ" },
        			})
        		end,
        	},
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({})
            lspconfig.gopls.setup({})
            lspconfig.htmx.setup({})
            lspconfig.templ.setup({})
            lspconfig.elixirls.setup({
                cmd = { "$HOME/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
            })

            vim.filetype.add({ extension = { templ = "templ" } })
        end,
    },
}
