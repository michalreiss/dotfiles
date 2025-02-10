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
                        ensure_installed = { "lua_ls", "gopls", "htmx", "templ", "terraformls" },
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
            local util = require("lspconfig.util")

            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.gopls.setup({ capabilities = capabilities })
            lspconfig.terraformls.setup({ capabilities = capabilities })
            lspconfig.htmx.setup({ capabilities = capabilities, })
            lspconfig.sourcekit.setup({
                capabilities = {
                    workspace = {
                        didChangeWatchedFiles = {
                            dynamicRegistration = true,
                        },
                    },
                }
            })
            lspconfig.templ.setup({
                capabilities = capabilities,
                default_config = {
                    cmd = { "templ", "lsp" },
                    filetypes = { "templ" },
                    root_dir = function(fname)
                        return util.root_pattern("go.work", "go.mod", ".git")(fname)
                    end,
                },
            })

            vim.filetype.add({ extension = { templ = "templ" } })
        end,
    },
}
