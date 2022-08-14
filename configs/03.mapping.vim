" Tips 
"
" C is ctrl
" A is alt
"
" <leader> is ' , ' 
"  you can bind leader key on options.vim
"
"    Can using :verbose map see all key using
"    		ex:  :verbose map <leader>
"
  
"  Basis 
"
" source file 
noremap <silent> <F2> :so% <CR>    "only use on init.vim

" close buffer and flex
noremap <leader>q :bd <CR>         

"open buffer
noremap  <C-b> :Buffers <CR>

"save file
map <C-s> :w <CR>
imap <C-s> <ESC>:w <CR>

" copy text 
vnoremap <C-c> "+y

" paste 
map <C-v> <ESC>"+pa

" cut
vnoremap <C-x> "+d

" move to first line
noremap <A-a> <Home>

" move to end line
noremap <C-e> <End>

" Move lines to lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"switch between tab
noremap <silent> <c-k> :wincmd k<CR>
noremap <silent> <c-j> :wincmd j<CR>
noremap <silent> <c-h> :wincmd h<CR>
noremap <silent> <c-l> :wincmd l<CR>

"Select All
noremap <C-a> <ESC>ggVG 


" Clear search highlights.
nnoremap <Leader><Space> :let @/=''<CR>
vnoremap <Leader><Space> :let @/=''<CR>



"  Plugin key 
"
"  =============================
"  |          NERDtree          |
"  ==============================
"
noremap <silent> <C-t> :NERDTreeToggle<CR>	
nnoremap <leader>n :NERDTreeFocus<CR>
"
"

"  =============================
"  |         floatterm          |
"  ==============================
"
" => Hotkey to manage terminals
"
" Open a new terminal 
nnoremap   <silent>   <leader>to    :FloatermNew<CR>
tnoremap   <silent>   <leader>to    <C-\><C-n>:FloatermNew<CR>

" Kill current terminal 
nnoremap <silent> 	<leader>tk 		:FloatermKill<CR>:FloatermPrev<CR>
tnoremap <silent> 	<leader>tk 		<C-\><C-n>:FloatermKill<CR>:FloatermPrev<CR>

" Navigation next and previous terminal 
nnoremap <silent> 	<leader>tn 		:FloatermNext<CR>
tnoremap <silent> 	<leader>tn 		<C-\><C-n>:FloatermNext<CR>
nnoremap <silent> 	<leader>tp 		:FloatermPrev<CR>
tnoremap <silent> 	<leader>tp 		<C-\><C-n>:FloatermPrev<CR>

" Toggle terminal
nnoremap <silent> 	<leader>tt 		:FloatermToggle<CR>
tnoremap <silent> 	<leader>tt 		<C-\><C-n>:FloatermToggle<CR>

" Focus terminal 
nnoremap <silent> 	<leader>tf 		<C-\><C-n><C-W><Left>
tnoremap <silent> 	<leader>tf 		<C-\><C-n><C-W><Left>


" => Hotkey to run other console apps

" Git 
nnoremap   <silent> <leader>tl    :FloatermNew --position=center --height=0.9 --width=0.8 --title='Git' lazygit<CR>

"compile and run c/c++
nnoremap <F12> :w <CR> :FloatermNew --autoclose=0 g++ % -o %< -lm && ./%< <CR>

"
"  =============================
"  |            fzf             |
"  ==============================
" open files
nmap <C-p> :Files<CR> 
" open History
nmap <C-/> :history/<CR>

" open Rg on fzf and find text u want to search 
nnoremap <leader>rg :Rg<Space>

"
"  =============================
"  |          lazygit           |
"  ==============================
"
nnoremap <silent> <leader>gg :LazyGit<CR>
"
"
"  =============================
"  |           tabbar           |
"  ==============================
"
nnoremap <leader>b :TagbarToggle<CR>
"
"
"  =============================
"  |            coc             |
"  ==============================
"
"  !!!!! rarely used
"
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"
"
"  =============================
"  |         vimspactor         |
"  ==============================
"
"  If installed plug need uncomment
"
" nnoremap 	<Leader>dl :call vimspector#Launch()<CR>
" nnoremap 	<Leader>ds :call vimspector#Reset()<CR>
" nnoremap 	<Leader>dc :call vimspector#Continue()<CR>
"
" nnoremap 	<Leader>dt :call vimspector#ToggleBreakpoint()<CR>
" nnoremap 	<Leader>dT :call vimspector#ClearBreakpoints()<CR>
"
" nmap 		<Leader>dr <Plug>VimspectorRestart
" nmap 		<Leader>de <Plug>VimspectorStepOut
" nmap 		<Leader>di <Plug>VimspectorStepInto
" nmap 		<Leader>do <Plug>VimspectorStepOver
"
"
"
"
"  Advance 
"
"
"  =============================
"  |  find and replace on file  |
"  ==============================
"
" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn


"  =============================
"  |         vim-grepper        |
"  ==============================
"  !!!!! Multiple files
"
"
xmap gr <plug>(GrepperOperator)

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>f
			\ :let @s='\<'.expand('<cword>').'\>'<CR>
			\ :Grepper -cword -noprompt<CR>
			\ :/<C-r>s
			\ :cfdo %s/<C-r>s//g \| update
			\<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>f
			\ "sy
			\ gvgr
			\ :cfdo %s/<C-r>s//g \| update
			\<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>




