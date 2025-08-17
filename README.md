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

1. In your lazy file please add: 

  {
    dir = vim.fn.expand '~/.config/nvim/lua/vs-code-quick-edit.nvim', -- This is the file path to whereever you cloned it
    config = function()
      require('vs-code-quick-edit').setup {  -- These are your keybinds, I reccomend chaging them depending on your preference
        file_keymap = '<Leader>v', -- open current file
        folder_keymap = '<Leader>V', -- open folder
      }
    end,

> The above should be modified!

2. Run `:Lazy install` and `:Lazy sycn` to setup the project.
3. That's it!


