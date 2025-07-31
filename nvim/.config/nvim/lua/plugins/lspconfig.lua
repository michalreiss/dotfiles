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

                    vim.api.nvim_create_autocmd("LspAttach", {
                        callback = function(args)
                            local client = vim.lsp.get_client_by_id(args.data.client_id)
                            if client ~= nil and client.name ~= "omnisharp" then
                                return
                            end

                            local buf = args.buf
                            local function map(lhs, rhs, desc)
                                vim.keymap.set("n", lhs, rhs, { buffer = buf, noremap = true, desc = desc })
                            end

                            map("gd", e.lsp_definition, "OmniSharp: Go to definition")
                            map("gr", e.lsp_references, "OmniSharp: Go to references")
                            map("gri", e.lsp_implementation, "OmniSharp: Go to implementation")
                        end,
                    })
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
            lspconfig.gopls.setup({
                capabilities = capabilities,
                settings = {
                    gopls = {
                        staticcheck = true,
                    },
                },
            })
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
