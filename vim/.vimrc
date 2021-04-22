"            _
"    _   __ (_)____ ___   _____ _____
"   | | / // // __ `__ \ / ___// ___/
"   | |/ // // / / / / // /   / /__
"   |___//_//_/ /_/ /_//_/    \___/
"

"----------
" REMAP
"----------
let mapleader = "\<Space>"

nnoremap q :q<CR>
nnoremap <left> b
nnoremap <right> w

inoremap jk <ESC>

nnoremap <leader>t :TagbarToggle<CR>
"nnoremap <F11> :e ~/.vimrc<CR>
"nnoremap <F12> :w<CR>:so ~/.vimrc<CR>:echo "RELOADED"<CR>
"nnoremap <leader>rr :w<CR>:!clear;python %:p<CR><CR>
nnoremap <leader>rr :w<CR>:terminal python %:p<CR><CR>:q<CR><CR>
nnoremap <silent><leader><TAB> :bn!<CR>
nnoremap <silent><leader>d :bw<CR>
nnoremap <leader>e :Vex 20<CR>
nnoremap <leader>s :shell<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :qa!<CR>


"----------
" MISC
"----------
set number
set nomodeline
set clipboard^=unnamedplus

filetype indent on
filetype plugin on

syntax enable
syntax on

set scrolloff=4

let $LANG = 'en_US'

"--------------
" AUTOCOMMANDS
"--------------
" filetype custom think to move filetype things to ftplugin
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead Vagrantfile setfiletype ruby
autocmd BufNewFile,BufRead Markdown syn clear markdownError
setfiletype ruby
autocmd BufNewFile,BufReadPost *.bats set filetype=sh


set backspace=eol,start,indent
set mouse=a
set ff=unix
set breakindent
set showbreak=\\\\\
set list listchars=trail:·,extends:>,precedes:<
set t_Co=256
set wrap
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set hlsearch
set nofoldenable
set cmdheight=1
set noswapfile
set nobackup
set noundofile
set autoread
set hidden
set magic
set showmatch
set wildmenu
set wildmode=longest:list

" Explorer options
set splitright
let g:netrw_banner = 0
let g:netrw_preview = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4

let loaded_matchparen = 1

"--------------------
" PLUG plugin manager
"--------------------
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
    Plug 'majutsushi/tagbar'
    Plug 'flazz/vim-colorschemes'
    Plug 'lfv89/vim-interestingwords'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/LimeLight.vim'
call plug#end()

"let g:limelight_conceal_ctermfg = 'gray'
"colorscheme monokain
colorscheme goodwolf
