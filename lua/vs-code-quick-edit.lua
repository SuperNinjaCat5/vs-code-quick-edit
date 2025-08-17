print 'loaded vs-code-quick-edit.nvim'
local M = {}

M.opts = { -- Keybinds defults
  file_keymap = '<Leader>v', --defult <Leader>v
  folder_keymap = '<Leader>V', --defult <Leader>V
  prefix = '', --  default is code just leave empty. If you for some reason have like `vscodium .` instead of `vscode .` this does that
  cmd_prefix = '', -- If you want to be able to do RunVscode or OpenVscode or NvimVscode
}

function M.vscode(filepath)
  print 'Opening Current File in VS code.'
  local file = filepath or vim.fn.expand '%:p'
  if file == '' then
    print 'No file to open! Falling back to current dir'
    file = vim.fn.getcwd()
    return
  end

  vim.fn.jobstart({ M.opts.prefix, '-n', file }, { detach = true })
end

function M.vscode_folder(dirpath)
  local folder = dirpath or vim.fn.expand '%:p:h'
  if folder == '' then
    print 'No folder to open! Falling back to current dir'
    folder = vim.fn.getcwd()
    return
  end
  print 'Opening Current Folder in VS code.'
  vim.fn.jobstart({ M.opts.prefix, '-n', folder }, { detach = true })
end

function M.setup(opts)
  M.opts = vim.tbl_extend('force', M.opts, opts or {})

  local cmd_prefix = M.opts.cmd_prefix ~= '' and M.opts.cmd_prefix:gsub('[^%w]', '') or ''
  local prefix = M.opts.prefix ~= '' and M.opts.prefix or 'Code'

  vim.api.nvim_create_user_command(cmd_prefix .. 'Vscode', function(opts)
    M.vscode(opts.args)
  end, { nargs = '?' })

  vim.api.nvim_create_user_command(cmd_prefix .. 'VscodeFolder', function(opts)
    M.vscode_folder(opts.args)
  end, { nargs = '?' })

  vim.keymap.set('n', M.opts.file_keymap, string.format(':%sVscode<CR>', prefix), { noremap = true, silent = true })
  vim.keymap.set('n', M.opts.folder_keymap, string.format(':%sVscodeFolder<CR>', prefix), { noremap = true, silent = true })
end

return M
