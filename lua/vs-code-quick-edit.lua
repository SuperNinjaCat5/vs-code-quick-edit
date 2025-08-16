print 'loaded vs-code-quick-edit.nvim'
local M = {}

M.opts = { -- Keybinds defults
  file_keymap = '<Leader>v', --defult <Leader>v
  folder_keymap = '<Leader>V', --defult <Leader>V
}

function M.vscode(filepath)
  print 'Opening Current File in VS code.'
  local file = filepath or vim.fn.expand '%:p'
  if file == '' then
    print 'No file to open!'
    return
  end

  vim.fn.jobstart({ 'code', '-n', file }, { detach = true })
end

function M.vscode_folder(dirpath)
  local folder = dirpath or vim.fn.expand '%:p:h'
  if folder == '' then
    print 'No folder to open!'
    return
  end
  print 'Opening Current Folder in VS code.'
  vim.fn.jobstart({ 'code', '-n', folder }, { detach = true })
end

function M.setup(opts)
  M.opts = vim.tbl_extend('force', M.opts, opts or {})

  vim.api.nvim_command [[
  command! -nargs=? -complete=file Vscode lua require("vs-code-quick-edit").vscode(<f-args>)
  ]]

  vim.api.nvim_command [[
  command! -nargs=? -complete=dir Vscodefolder lua require("vs-code-quick-edit").vscode_folder(<f-args>)
  ]]

  vim.keymap.set('n', M.opts.file_keymap, ':Vscode<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', M.opts.folder_keymap, ':VscodeFolder<CR>', { noremap = true, silent = true })
end

return M
