set nocompatible

set rtp+=~/dotfiles/vim
set rtp+=~/dotfiles/vim/after

"load pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

"global appearance
set history=50
set tabstop=4       " numbers of spaces of tab character
set softtabstop=4   " number of spaces that <Tab> uses while editing
set shiftwidth=4    " numbers of spaces to (auto)indent
set expandtab
set smartindent     " smart indent
set ignorecase      " ignorecase / ic
set smartcase       " smartcase: override the 'ic' when searching
                    " if search pattern contains uppercase char
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set autoindent      " always set autoindenting on
set ruler           " show the cursor position all the time
set nobackup        " do not keep a backup file
set number          " show line numbers
set ls=2            " allways show status line
set title           " show title in console title bar
set nostartofline   " don't jump to first character when paging
set colorcolumn=110
set nofoldenable
set noswapfile


set showmatch       " show matching brackets
set hidden          " enable switching between buffers without saving them
if has('syntax') && (&t_Co > 2)
  syntax on
endif

filetype plugin indent on

set fileencodings=utf8,cp866

noremap Bs Del
noremap Del Bs
set backspace=2
set backspace=indent,eol,start

set list
set listchars=tab:->
set listchars+=trail:·

let g:mapleader=","

let g:ack_default_options=" -s -H --nocolor --nogroup --column --type=cc"
let g:ack_use_dispatch = 1

" Make 'gf' rebound to last cursor position (line *and* column)
noremap gf gf`"zz

:autocmd BufRead,BufNewFile *.ts set ft=ts
:autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
:autocmd BufNewFile *.xml 0r ~/.vim/templates/xml.tpl

autocmd FileType sql set tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType cmake set tabstop=2 softtabstop=2 shiftwidth=2
autocmd FocusGained,BufEnter *.log :silent! !

" do not show preview window for tag
"set completeopt-=menu
set completeopt-=preview

set rtp+=~/dotfiles/vim/bundle/ctrlp.vim

let g:ctrlp_map = '<c-p>'
let g:ctrp_cmd = 'CtrlP'

try
     source ~/dotfiles/vim/appearance.vim
     source ~/dotfiles/vim/functions.vim
catch
endtry

let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
