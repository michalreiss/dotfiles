vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.foldmethod = "expr"
vim.opt.foldlevelstart = 99
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- global keymaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move down a selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move up a selection" })
