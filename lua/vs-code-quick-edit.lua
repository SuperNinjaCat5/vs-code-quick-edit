print 'loaded vs-code-quick-edit.nvim'
local M = {}

function M.vscode()
  print 'Hello, World!'
  vim.fn.jobstart({ 'code', '.' }, { detach = true })
end

-- Map a command to the function
vim.api.nvim_command 'command! Vscode lua require("vs-code-quick-edit").vscode()'

return
