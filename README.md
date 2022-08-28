# Introduction

- This repo hosts my Nvim configuration for Linux. `init.vim` is the config entry point for terminal Nvim

- My configurations are heavily documented to make it as clear as possible.
  While you can clone the whole repository and use it, it is not recommended though.
  Good configurations are personal. Everyone should have his or her unique config file.
  You are encouraged to copy from this repo the part you want and add it to your own config.

# Screenshot

</br>

<img src="https://github.com/Frey1a/dotfiles/blob/main/.github/assets/nvim-start.jpg?raw=true">
</br>
</br>

<details>
  <summary>More Screenshot</summary>
 
<img src="https://github.com/Frey1a/dotfiles/blob/main/.github/assets/nvim-coding.jpg?raw=true">
</br>
</br>

<img src="https://github.com/Frey1a/dotfiles/blob/main/.github/assets/nvim-lazygit.jpg?raw=true">
</br>
</br>

<img src="https://github.com/Frey1a/dotfiles/blob/main/.github/assets/nvim-terminal.jpg?raw=true">
</br>
</br>

<img src="https://github.com/Frey1a/dotfiles/blob/main/.github/assets/nvim-search-file.jpg?raw=true">
</br>
</br>

</details>

<br>

## Structure

```
├── init.vim                      source file
│
├── bundle                        storage plugin
│
└── configs
    ├── ***.vim           *** is name plugin
    ├── ***.vim
    ├── ***.vim
    ├── ***.vim
    └── ***.vim
  

```

# Install

> #### Copy and paste on terminal

###### with bash, zsh, ...

```bash
bash <(curl -s https://raw.githubusercontent.com/Frey1a/nvim/main/bin/install.sh)
```

###### with fish

```bash
bash (curl -s https://raw.githubusercontent.com/Frey1a/nvim/main/bin/install.sh | psub)
```

- Run nvim and ignore all errors
- `:PlugInstall`''
- Enjoy

## Usage

- Use `:verbose map` see all keymap
- `.config/nvim/configs/mappings.vim` is all my mappings

## Config

- C / Cpp

Using `gcc` uncomment `coc-ccls` on `.config/nvim/configs/coc.vim`

And rerun nvim if you see

```bash
[coc.nvim] Unable to load global extension at /home/$(USER)/.config/coc/extensions/node_modules/coc-ccls: main
 file ./lib/extension.js not found, you may need to build the project.
```

[Solution](https://github.com/Maxattax97/coc-ccls/issues/5):

```bash
cd ~/.config/coc/extensions/node_modules/coc-ccls
npm i
npm run build
```

- Python

Using `gcc` uncomment `coc-pyright` on `.config/nvim/configs/coc.vim`
