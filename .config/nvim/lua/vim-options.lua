vim.g.mapleader = " "
vim.cmd("set number")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set clipboard=unnamedplus")

-- global keymaps
vim.keymap.set("n", "H", ":bprevious<CR>", {})
vim.keymap.set("n", "L", ":bnext<CR>", {})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
