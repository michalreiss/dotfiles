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
                if lsp == "lua_ls" then
                    lspconfig[lsp].setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                },
                            },
                        },
                    })
                else
                    lspconfig[lsp].setup({
                        capabilities = capabilities,
                    })
                end
            end

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, {})

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    --  This function gets run when an LSP attaches to a particular buffer.
                    --    That is to say, every time a new file is opened that is associated with
                    --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
                    --    function will be executed to configure the current buffer
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.server_capabilities.documentHighlightProvider then
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                end,
            })
            vim.filetype.add({ extension = { templ = "templ" } })
        end,
    },
}
