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
                "Hoffs/omnisharp-extended-lsp.nvim",
                config = function()
                    local e = require("omnisharp_extended")
                    vim.keymap.set("n", "gd", e.lsp_definition, {})
                    vim.keymap.set("n", "gr", e.lsp_references, {})
                    vim.keymap.set("n", "gri", e.lsp_implementation, {})
                end,
            },
            {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require("mason-lspconfig").setup({
                        automatic_installation = true,
                        ensure_installed = {
                            "lua_ls",
                            "omnisharp",
                            "gopls",
                            "templ",
                            "terraformls",
                            "ts_ls",
                            "angularls",
                        },
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
            lspconfig.omnisharp.setup({
                capabilities = capabilities,
                enable_roslyn_analysers = true,
                enable_import_completion = true,
                organize_imports_on_format = true,
                enable_decompilation_support = true,
            })
            lspconfig.angularls.setup({})
            lspconfig.ts_ls.setup({})
            lspconfig.terraformls.setup({ capabilities = capabilities })
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
