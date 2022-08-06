" This is the default extra key bindings
let g:fzf_action = {
		\ 'ctrl-i': 'split',
		\ 'ctrl-s': 'vsplit', 
		\ 'ctrl-e': 'tab split'}

let g:fzf_layout = { 'window': { 'width': 0.87, 'height': 0.8, 'highlight': 'Comment' } }
let g:fzf_preview_window = ['right:80%', 'ctrl-/']
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" ignore file
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'



hi! fzf_fg ctermfg=14
hi! fzf_fgp ctermfg=3
hi! fzf_hl ctermfg=5
hi! fzf_hlp ctermfg=5
hi! fzf_info ctermfg=6
hi! fzf_prompt ctermfg=6
hi! fzf_spinner ctermfg=6
hi! fzf_pointer ctermfg=3
let g:fzf_colors = {
		\ 'fg':      ['fg', 'fzf_fg'],
		\ 'hl':      ['fg', 'fzf_hl'],
		\ 'fg+':     ['fg', 'fzf_fgp'],
		\ 'hl+':     ['fg', 'fzf_hlp'],
		\ 'info':    ['fg', 'fzf_info'],
		\ 'prompt':  ['fg', 'fzf_prompt'],
		\ 'pointer': ['fg', 'fzf_pointer'],
		\ 'spinner': ['fg', 'fzf_spinner'] }

" :Files
command! -bang -nargs=? -complete=dir Files
   \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --color=always --theme=TwoDark --style=header,numbers,snip --line-range :300 {}']}, <bang>0)

" :Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
	\   'rg --column --line-number --color=always --smart-case -- '.shellescape(<q-args>), 1, {'options': ['--exact', '--layout=reverse']}, <bang>0)

"Advance Rg
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)


