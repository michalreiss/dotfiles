local options = {
  ma = true,
  nu = true,
  mouse = 'a',
  tabstop = 3,
  shiftwidth = 3,
  softtabstop = 3,
  expandtab = true,
  backup = false,
  writebackup = false,
  swapfile = false,
  clipboard = 'unnamedplus',
  showmode = false,
  ignorecase = true,
  smartcase = true,
  termguicolors = true,
  completeopt = 'menuone,noselect',
  hlsearch = false,
  breakindent = true,
  relativenumber = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
