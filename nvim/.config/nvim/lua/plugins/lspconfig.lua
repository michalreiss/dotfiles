return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "saghen/blink.cmp" },
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
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.gopls.setup({ capabilities = capabilities })
            lspconfig.htmx.setup({ capabilities = capabilities })
            lspconfig.templ.setup({ capabilities = capabilities })
            lspconfig.elixirls.setup({
                capabilities = capabilities,
                cmd = { "$HOME/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
            })

            vim.filetype.add({ extension = { templ = "templ" } })
        end,
    },
}
