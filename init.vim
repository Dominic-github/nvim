if exists("g:neovide")
    " Put anything you want to happen only in Neovide here
endif

for f in split(glob('~/.config/nvim/configs/*.vim'), '\n')
  exe 'source' f
endfor

