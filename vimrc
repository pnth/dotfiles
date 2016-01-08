call plug#begin('~/.vim/plugged')

" Plug 'LucHermitte/lh-cpp'
" Plug 'LucHermitte/mu-template'
" Plug 'LucHermitte/searchInRuntime'
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'
Plug 'davidhalter/jedi'
Plug 'gabrielelana/vim-markdown'
Plug 'hdima/python-syntax'
Plug 'jalvesaq/R-Vim-runtime'
Plug 'jcfaria/Vim-R-plugin'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'LucHermitte/lh-brackets'
Plug 'LucHermitte/lh-dev'
Plug 'LucHermitte/lh-tags'
Plug 'LucHermitte/lh-vim-lib'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/screen.vim'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'Yggdroot/indentLine'
Plug '~/.vim/manually/personal'
call plug#end()

let maplocalleader = ","
let mapleader = ","
set autowriteall
set clipboard=unnamed
set number
set autoindent
filetype plugin indent on
set shiftwidth=4
set tabstop=4
set backspace=2
syntax on
set hlsearch
set incsearch
set nocompatible
set ruler
syntax enable
colorscheme solarized
set background=dark
set noswapfile
nmap gl :bn<cr>
nmap gh :bN<cr>
nmap gW :bd<cr>:syn on<cr>
nmap gw :bN<cr>:bd #<cr>
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

set wmw=0
set tw=78
set wrap
set formatoptions+=t
set nofoldenable
set foldmethod=syntax
set foldnestmax=1      "deepest fold is 10 levels
nnoremap <C-Space> i
inoremap <C-Space> <Esc>
inoremap <C-@> <Esc>
vnoremap <C-@> <Esc>

""" TAGBAR
nmap <silent> <c-e><c-t> :TagbarOpen fj<CR><c-w>=
nmap <silent> <c-e><c-y> :TagbarClose<CR>
let g:tagbar_left = 1
let g:tagbar_width = 18
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

""" VIM-TMUX-NAVIGATOR
let g:tmux_navigator_save_on_switch = 1

"""vim-slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ".2"}
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1
let g:slime_no_mappings = 1
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>s <Plug>SlimeMotionSend
nmap <leader>ss <Plug>SlimeLineSend
nmap <space> <Plug>SlimeLineSend<cr>
nmap <leader>sp <Plug>SlimeParagraphSend
autocmd FileType c,cpp,java,python map <buffer> <F3> :!tmux split-window && tmux select-layout
      \ even-horizontal && tmux resize-pane -t 2 -x 78 && tmux select-pane -t:.1
      \ <cr><cr>

""" EASY-ALIGN
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""" NERDTREE
map ,t :NERDTreeToggle<CR>

""" INDENT-LINE
let g:indentLine_color_term = 10
let g:indentLine_color_tty_dark = 10

""" LH-BRACKET
let g:marker_select_empty_marks=0
imap ,m      <Plug>MarkersJumpF
map ,m      <Plug>MarkersJumpF

""" MINE
noremap gd :call Pjump()<cr><cr>
function! Pjump()
	:WincmdTag
	if winnr() == winnr("$")
		execute (winnr("$") - 1) . "WincmdW"
	else
		execute winnr("$") . "WincmdW"
	endif
	:norm ZZ
    :exe "normal :vs\<cr>"
	:WincmdTag
	if winnr() == winnr("$")
		execute (winnr("$") - 1) . "WincmdW"
	else
		execute winnr("$") . "WincmdW"
	endif
    :exe "normal \<c-]>"
    :norm z.
endfunction


""" R
au BufNewFile,BufRead *.r set filetype=r
au BufNewFile,BufRead *.R set filetype=r
autocmd FileType R map <buffer> <F2> <Plug>RStart
autocmd FileType R imap <buffer> <F2> <Plug>RStart
autocmd FileType R vmap <buffer> <F2> <Plug>RStart
autocmd FileType R map <buffer> <F3> :!tmux select-layout even-horizontal &&
      \ tmux resize-pane -t 2 -x 80 <cr><cr>
autocmd FileType R vmap <buffer> <Space> <Plug>RDSendSelection
autocmd FileType R nmap <buffer> <Space> <Plug>RDSendLine
set completeopt-=preview
inoremap <C-_> <space>%>%<space>
"map <silent> <LocalLeader>rk :call RAction("levels")<CR>
autocmd FileType R noremap <buffer> <silent> <LocalLeader>t :call RAction("tail")<CR>
autocmd FileType R noremap <buffer> <silent> <LocalLeader>h :call RAction("head")<CR>
autocmd FileType R noremap <buffer> <silent> <LocalLeader>q
      \ :call g:SendCmdToR("quit(save=\"no\")")<cr>


