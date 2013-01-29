" rasca's .vimrc

" General "{{{
set nocompatible
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=256
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
if has('mouse')
  set mouse=a
endif

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
set number
" Search
set incsearch " do incremental searching
set hlsearch " highlight last search term
set ignorecase " do case in sensitive matching with
set smartcase " be sensitive when there's a capital letter
" Command line
set wildmode=longest,list
let mapleader = ","
set wildignore='*~,*.swp,*.swo,*.pyc,.DS_Store,*.db'
let g:netrw_list_hide='.*\.swp$,.*\.swo$,.*\.pyc$,.*\.DS_Store$,.*\.db$'
" "}}}

" My mappings "{{{
map Q gq
" "}}}

" Formatting "{{{
syntax on
filetype off

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

augroup END

set tabstop=4 " set the default tabstop
set softtabstop=4
set shiftwidth=4 " set the default shift width for indents
set expandtab " make tabs into spaces (set by tabstop)
set smarttab " smarter tab levels
" "}}}

" Plugins "{{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Colorschemes

Bundle 'nanotech/jellybeans.vim'
Bundle 'cschlueter/vim-wombat'
Bundle 'wombat256.vim'
Bundle 'altercation/vim-colors-solarized'

" Bundle 'git://git.wincent.com/command-t.git'
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

Bundle 'Lokaltog/vim-powerline'
set laststatus=2
let g:Powerline_symbols = 'fancy'

Bundle 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_echo_current_error=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_python_checker_args = '--ignore=E501'

Bundle 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1

Bundle 'tpope/vim-surround'
Bundle "SuperTab"
"
" Try:
" Fugitiveo
" vim-indent-guides
" neocomplcache
" vim-javascript
" vim-json
" vim-jquery
" nginx.vim
" Better-CSS-Syntac-for-Vim
" vim-markdown
" vim.tmux
" vimux
" gitv
" vim-pastie

" " trying this 
" Bundle "YankRing.vim"
" Bundle "http://github.com/thinca/vim-quickrun.git"
" Bundle "http://github.com/thinca/vim-poslist.git"
" Bundle "http://github.com/mattn/gist-vim.git"
" Bundle "http://github.com/rstacruz/sparkup.git", {'rtp': 'vim/'}
" 
" " Programming
" Bundle "jQuery"
" 
" " Snippets
" Bundle "http://github.com/gmarik/snipmate.vim.git"
" 
" " Syntax highlight
" Bundle "Markdown"
" 
" " Git integration
" Bundle "git.zip"
" Bundle "fugitive.vim"
" 
" " (HT|X)ml tool
" Bundle "ragtag.vim"
" 
" " Utility
" Bundle "repeat.vim"
" Bundle "file-line"
" Bundle "Align"
" "}}}

filetype plugin indent on " automatically detect file types
colorscheme jellybeans
