call plug#begin('~/.vim/plugged')
Plug 'https://github.com/vim-scripts/Vim-R-plugin.git'
Plug 'https://github.com/vim-scripts/screen.vim'
Plug 'https://github.com/fholgado/minibufexpl.vim'
Plug 'https://github.com/Townk/vim-autoclose.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Plug 'https://github.com/tomtom/tlib_vim.git'
Plug 'https://github.com/garbas/vim-snipmate.git'
Plug 'https://github.com/honza/vim-snippets.git'
call plug#end()

let maplocalleader = ","
let mapleader = ","
set autowriteall
set number
set autoindent
filetype plugin indent on
set shiftwidth=2
set tabstop=2
syntax on 
set incsearch
set nocompatible
syntax enable
let g:solarized_termcolors = 256
let g:solarized_contrast  =   "low"
" "high" or "low"
colorscheme solarized
set background=dark                                                         
set sw=2
set noswapfile
set backspace=2
inoremap <C-@> <Esc>
vnoremap <C-@> <Esc>
set tw=78
set formatoptions+=t


let vimrplugin_applescript = 0
let vimrplugin_screenplugin = 0
let g:ScreenImpl = 'Tmux'
let vimrplugin_screenvsplit = 1 " For vertical tmux split
let g:ScreenShellInitialFocus = 'shell'
let g:vimrplugin_noscreenrc = 1
let g:vimrplugin_screenplugin = 1
let vimrplugin_conqueplugin = 0
let g:vimrplugin_map_r = 1
let vimrplugin_vimpager = "no"
map <F2> <Plug>RStart
imap <F2> <Plug>RStart
vmap <F2> <Plug>RStart
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine 
map gl :bn<cr>
map gh :bN<cr>
map gD :bd<cr>:syn on<cr>
map gd :bn<cr>:bd #<cr>:syn on<cr>

":imap <C-j> <Plug>snipMateNextOrTrigger
":smap <C-j> <Plug>snipMateNextOrTrigger
au BufNewFile,BufRead *.r set filetype=r
au BufNewFile,BufRead *.R set filetype=r
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
inoremap <C-_> <space>%>%<space>

