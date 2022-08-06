# Introduction

- This repo hosts my Nvim configuration for Linux. `init.vim` is the config entry point for terminal Nvim

- My configurations are heavily documented to make it as clear as possible.
  While you can clone the whole repository and use it, it is not recommended though.
  Good configurations are personal. Everyone should have his or her unique config file.
  You are encouraged to copy from this repo the part you want and add it to your own config.

# Screenshot

</br>

<img src="https://github.com/Frey1a/dotfiles/blob/main/image/Screenshot/nvim-start.jpg?raw=true">
</br>
</br>

<details>
  <summary>More Screenshot</summary>
 
<img src="https://github.com/Frey1a/dotfiles/blob/main/image/Screenshot/nvim-codding.jpg?raw=true">
</br>
</br>

<img src="https://github.com/Frey1a/dotfiles/blob/main/image/Screenshot/nvim-float-term.jpg?raw=true">
</br>
</br>

<img src="https://github.com/Frey1a/dotfiles/blob/main/image/Screenshot/nvim-find-file.jpg?raw=true">
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
bash <(curl -s https://raw.githubusercontent.com/Frey1a/nvim/main/install.sh)
```

###### with fish

```bash
bash (curl -s https://raw.githubusercontent.com/Frey1a/nvim/main/install.sh | psub)
```

- Run nvim and ignore all errors
- `:PlugInstall`''
- Enjoy

## Usage

- Use `:verbose map` see all keymap
