call plug#begin('~/.config/nvim/bundle')

"Airline && Airline theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Theme neovim
Plug 'ghifarit53/tokyonight-vim'
Plug 'tribela/vim-transparent' 				"opacity neovim

"NERDtree and devicons
Plug 'scrooloose/nerdtree'
Plug 'unkiwii/vim-nerdtree-sync' 		"Sync current file	
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'ryanoasis/vim-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }



"File search
Plug 'junegunn/fzf', 
		\ { 'do': { -> fzf#install() } } 			" Fuzzy finder 
Plug 'junegunn/fzf.vim'

"Start nvim
Plug 'mhinz/vim-startify'

"Terminal
Plug 'voldikss/vim-floaterm' 					" Float terminal

"Auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'} 	"Coc-nvim like IDE
Plug 'tomtom/tcomment_vim' 				"Auto comment
Plug 'jiangmiao/auto-pairs' 				"Auto brackets, parens, quotes in pair
Plug 'andrewradev/tagalong.vim' 		"Rename tag
Plug 'mattn/emmet-vim' 			"fast code html 
" Plug 'SirVer/ultisnips' 			"auto coding
Plug 'mlaursen/vim-react-snippets'   "Snippets

Plug 'moll/vim-node' "For nodejs



"Vim-surround
Plug 'tpope/vim-surround' 		"lets you deal with pairs of things, surrounding things

"code syntax highlight
Plug 'cakebaker/scss-syntax.vim'      "Scss
Plug 'yuezk/vim-js' 			"Javascript
Plug 'maxmellon/vim-jsx-pretty'  			"JSX / React
Plug 'jackguo380/vim-lsp-cxx-highlight'  	"C++ syntax
Plug 'othree/javascript-libraries-syntax.vim' "Syntax for JavaScript libraries


"Debugging
" Plug 'puremourning/vimspector' 				"vimspector

"Some extension for developer
Plug 'preservim/tagbar' 					"Tagbar
Plug 'ap/vim-css-color' 					"Css Color preview 	
" Handle multi-file find and replace.
Plug 'mhinz/vim-grepper'

"Preview Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

"Source code version control 
Plug 'airblade/vim-gitgutter' 						" show git change
Plug 'tpope/vim-fugitive' 						" Git
Plug 'kdheepak/lazygit.vim'						"lazygit

"muti select for neovim use ctrl + n
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"wakatime
Plug 'wakatime/vim-wakatime'


call plug#end()
