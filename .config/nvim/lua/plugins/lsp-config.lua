local lsps = { "lua_ls", "gopls", "htmx", "templ" }
return {
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
                ensure_installed = lsps,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            for _, lsp in ipairs(lsps) do
                lspconfig[lsp].setup({
                    capabilities = capabilities,
                })
            end

            vim.keymap.set("n", "<leader>sd", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, {})

            vim.filetype.add({ extension = { templ = "templ" } })
        end,
    },
}
