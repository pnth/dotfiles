set autoindent
set autowriteall
set clipboard=unnamed
set cursorline
set expandtab
set fo-=t
set hlsearch
set incsearch
set nocompatible
set noswapfile
set ruler
set backspace=2
set shiftwidth=2
set ts=2
set tabstop=2
set showmatch
nnoremap Q <nop>  "Ex mode
nnoremap ' `
nnoremap ` '
nnoremap j gj
nnoremap k gk
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>
inoremap II <Esc>I
inoremap JJ <Esc>Ja
inoremap AA <Esc>A
inoremap OO <Esc>O
inoremap oo <Esc>o
inoremap CC <Esc>C
inoremap SS <Esc>S
inoremap uu <Esc>ui
inoremap pp <c-r>*
ino hh <esc>
cno hh <c-c>
vno v <esc>
let maplocalleader = ","
let mapleader = ","
map gm :call cursor(0, virtcol('$')/2)<CR>
