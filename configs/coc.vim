" Auto Install coc
let g:coc_global_extensions = [
   \    'coc-json',
   \	'coc-emmet',
   \	'coc-html',
   \	'coc-tsserver',
   \	'coc-word',
   \	'coc-css',
   " \	'coc-ccls',
   \	'coc-cmake',
   \	'coc-go',
   \	'coc-sh',
   \	'coc-java',
   \	'coc-html-css-support',
   \	'coc-phpls',
   \	'coc-markdownlint',
   " \ 	'coc-pyright',
   \ 	'coc-tailwindcss',
   \    'coc-eslint',
   \    'coc-prettier',
   \    'coc-docker',
   \    'coc-sql',
   \    'coc-yaml',
   \ 	'coc-tslint-plugin',
   \ 	'coc-styled-components',
   \    'coc-spell-checker',
   \    'coc-highlight',
   \ 	'coc-vetur',
   \ 	'coc-sumneko-lua',
   \	]



" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end



" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')




