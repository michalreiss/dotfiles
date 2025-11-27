-- opts
vim.g.have_nerd_font = true
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80"
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.textwidth = 80
vim.opt.undofile = true
vim.opt.winborder = "rounded"
vim.opt.wrap = false

-- global keymaps
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous Diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next Diagnostic message" })
vim.keymap.set("n", "<leader>w", ":bd<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>W", ":bd!<CR>", { desc = "Delete buffer no matter what" })

-- file types
vim.filetype.add({ extension = { templ = "templ" } })
