# VS Code Quick Edit 

![Lua](https://img.shields.io/badge/Lua-5.4-blue)
![License](https://img.shields.io/github/license/SuperNinjaCat5/vs-code-quick-edit)

---

A useful plugin for preish vim users. It allows you to quickly open the current file or directory
in vs code. Just type `:Vscode` or `:Vscodefolder`! It's that easy!

# Installing

## Prereqrisites

1. Be sure to have vs code installed and working
2. Make sure to have neovim setup (if you dont know how use the offical kickstart repo)

### Tip

> Test the command `code .` and `nvim` in terminal to be sure everything will work

## Setup

To setup you will first need to clone the repo into a folder of your choice. I reccomend the one that has your other plugins.
We will be using lazy.nvim to install the plugin.

1. In your lazy file (~/.config/nvim/lua/custom/plugins/init.lua if you did the kickstart project) paste this code:
{
  dir = vim.fn.expand('~/.config/nvim/lua/vs-code-quick-edit.nvim'),
  config = function()
    require('vs-code-quick-edit').setup {
      file_keymap = '<Leader>o',
      folder_keymap = '<Leader>O',
    }
  end,
}
> It may need to be modified