print 'loaded vs-code-quick-edit.nvim'
local M = {}

function M.vscode()
  print 'Opening Current File in VS code.'
  local file = vim.fn.expand '%:p'
  if file == '' then
    print 'No file to open!'
    return
  end

  vim.fn.jobstart({ 'code', '-n', file }, { detach = true })
end

function M.vscode_folder()
  local folder = vim.fn.expand '%:p:h'
  if folder == '' then
    print 'No folder to open!'
    return
  end
  print 'Opening Current File in VS code.'
  vim.fn.jobstart({ 'code', '-n', folder }, { detach = true })
end

vim.api.nvim_command 'command! Vscode lua require("vs-code-quick-edit").vscode()'
vim.api.nvim_command 'command! Vscodefolder lua require("vs-code-quick-edit").vscode_folder()'
vim.keymap.set('n', '<Leader>v', ':Vscode<CR>', { noremap = true, silent = true }) -- Shortcut to open file in vs code (defult <Leader>v)
vim.keymap.set('n', '<Leader>V', ':Vscodefolder<CR>', { noremap = true, silent = true }) -- Shortcut to open folder in vs code (defult <Leader>V)

return M
