call plug#begin('~/.vim/plugged')
Plug '~/.vim/manually/personal'
Plug 'altercation/vim-colors-solarized'
Plug 'kien/ctrlp.vim'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/lh-tags'
Plug 'LucHermitte/lh-dev'
Plug 'LucHermitte/lh-brackets'
Plug 'LucHermitte/searchInRuntime'
Plug 'LucHermitte/mu-template'
Plug 'LucHermitte/lh-cpp'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tomtom/tcomment_vim'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'jcfaria/Vim-R-plugin'
Plug 'vim-scripts/screen.vim'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'majutsushi/tagbar'
Plug 'Superbil/llvm.vim'
Plug 'https://github.com/Yggdroot/indentLine'
Plug 'jalvesaq/R-Vim-runtime'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'vim-scripts/Conque-GDB'
Plug 'yuratomo/w3m.vim'
" Plug 'plasticboy/vim-markdown'
Plug 'gabrielelana/vim-markdown'
" Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
" Plug 'klen/python-mode'
Plug 'carlhuda/janus'
Plug 'scrooloose/nerdtree'
Plug 'ivanov/vim-ipython'

" Plug 'nathanaelkane/vim-indent-guides'
"Plug 'gilligan/vim-lldb'
"Plug 'rhysd/vim-clang-format'
"Plug 'tacahiroy/ctrlp-funky'
"Plug 'tomtom/stakeholders_vim'
"Plug '~/.vim/manually/pyclewn-vmb'
call plug#end()

" ~/.vim/manually/personal/after/unmap.vim

let maplocalleader = ","
let mapleader = ","
set autowriteall
" set clipboard=unnamedplus
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
" let g:solarized_termcolors = 256
let g:solarized_contrast = "low"
" "normal" "high" or "low"
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

" nmap <c-h> <esc><c-w>h
" nmap <c-l> <esc><c-w>l
" nmap <c-h> <esc>:w<esc><c-w>h
" nmap <c-l> <esc>:w<esc><c-w>l
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""VIM-R-PLUGIN
let r_indent_op_pattern = '\(+\|-\|\*\|/\|=\|\~\|%\)$'
autocmd FileType R map <F3> :!tmux select-layout even-horizontal &&
      \ tmux resize-pane -t 2 -x 80 <cr><cr>
autocmd FileType R imap ,< <space>%<>%<space>
autocmd FileType R imap ,> <space>%>%<space>
autocmd FileType c,cpp,java,python map <F3> :!tmux split-window && tmux select-layout
      \ even-horizontal && tmux resize-pane -t 2 -x 78 && tmux select-pane -t:.1
      \ <cr><cr>

let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_invoke_completion = '<C-c>'

let g:marker_select_empty_marks=0
imap ,m      <Plug>MarkersJumpF
map ,m      <Plug>MarkersJumpF
" imap <C-J>      <Plug>MarkersJumpF
" map <C-J>      <Plug>MarkersJumpF
"imap <C-K>      <Plug>MarkersJumpB
"map <C-K>      <Plug>MarkersJumpB
"imap <C-<>      <Plug>MarkersMark
"nmap <C-<>      <Plug>MarkersMark
"xmap <C-<>      <Plug>MarkersMark
autocmd FileType c,cpp,java,scala noremap <c-e>f :YcmCompleter FixIt<cr>
autocmd FileType c,cpp,java,scala noremap <c-e><c-f> :YcmCompleter FixIt<cr>
autocmd FileType c,cpp,objc nnoremap <c-e>B :w<cr>:!tmux send-keys -t 2
      \ ':qa' Enter 'clear && make main' Enter<cr><cr>
autocmd FileType c,cpp,objc nnoremap <c-e>b :w<cr>:!tmux send-keys -t 2
      \ ':qa' Enter 'clear && make %:r' Enter<cr><cr>
autocmd FileType c,cpp,objc nnoremap <c-e>R :!tmux send-keys -t 2 ':qa'
      \ Enter 'clear && ./main' Enter<cr><cr>
autocmd FileType c,cpp,objc nnoremap <c-e>r :!tmux send-keys -t 2 ':qa'
      \ Enter 'clear && ./%:r' Enter<cr><cr>
" autocmd FileType c,cpp,objc nnoremap <c-e><c-d> :!tmux send-keys -t 2 ':qa'
" \Enter 'clear && vim `drmem -- ./main 2>&1 \| tail -1 \| rev \| cut -d: -f1
" \ \| rev`' Enter<cr><cr>
autocmd FileType c,cpp,objc nnoremap <c-e><c-d> :!tmux send-keys -t 2 ':qa'
      \ Enter 'clear && drmem -- ./%:r' Enter<cr><cr>

nnoremap <silent> ] :lnext<CR>
nnoremap <silent> [ :lprev<CR>
nnoremap <silent> <c-e><c-e> :YcmDiags<CR> :!ctags -R .<cr><cr>,aa<cr>
nnoremap <silent> <c-e><c-w> :lclose<CR>
" nnoremap <silent> <c-e><c-]> :lclose<CR>
" "map <f12> :!ctags -R .<cr><cr>,aa<cr>

"set ts=8
"set ft=help
"set norl

" vim-easytags options
set tags=./.tags;
let g:easytags_dynamic_files = 2

" noremap <c-e><c-j> :call Pjump()<cr><cr>
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
" function! Pjump()
" 	:WincmdTag
" 	:norm ma
" 	if winnr() == winnr("$")
" 		execute (winnr("$") - 1) . "WincmdW"
" 	else
" 		execute winnr("$") . "WincmdW"
" 	endif
" 	:norm `a
" 	:norm <C-]>
" 	execute ":tag " . expand("<cword>")
" 	:norm z.
" 	:norm 10^E
" endfunction

let g:ConqueGdb_SrcSplit = 'left'
nnoremap <F10> :ConqueGdb %:r<CR><esc><c-w><c-h>
nnoremap <silent> <Leader>Y :ConqueGdbCommand y<CR>
nnoremap <silent> <Leader>N :ConqueGdbCommand n<CR>
autocmd FileType c,cpp,objc nnoremap ,q :ConqueGdbCommand
      \ quit<cr>:ConqueGdbCommand quit<cr><c-w><c-o><cr>

" map <C-I> :pyf ~/bin/clang-format.py<CR>
" imap <C-I> <ESC>:pyf ~/bin/clang-format.py<CR>i
autocmd FileType c,cpp,objc map <buffer> = :pyf ~/bin/clang-format.py<CR>
autocmd FileType c,cpp,objc map <buffer> ,=
      \ <ESC>ma<ESC>ggVG:pyf ~/bin/clang-format.py<CR>'az.

let vimrplugin_applescript = 0
let vimrplugin_screenplugin = 0
let g:ScreenImpl = 'Tmux'
let vimrplugin_screenvsplit = 1 " For vertical tmux split
let g:ScreenShellInitialFocus = 'shell'
let g:vimrplugin_noscreenrc = 1
let g:vimrplugin_screenplugin = 1
let vimrplugin_conqueplugin = 1
let g:vimrplugin_map_r = 1
let vimrplugin_vimpager = "no"
map <F2> <Plug>RStart
imap <F2> <Plug>RStart
vmap <F2> <Plug>RStart
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
set completeopt-=preview

au BufNewFile,BufRead *.r set filetype=r
au BufNewFile,BufRead *.R set filetype=r
inoremap <C-_> <space>%>%<space>
"map <silent> <LocalLeader>rk :call RAction("levels")<CR>
autocmd FileType R noremap <silent> <LocalLeader>t :call RAction("tail")<CR>
autocmd FileType R noremap <silent> <LocalLeader>h :call RAction("head")<CR>
autocmd FileType R noremap <silent> <LocalLeader>q
      \ :call g:SendCmdToR("quit(save=\"no\")")<cr>


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


""" VIM W3M
nmap <silent> ,W :W3m google 


""" EASY-ALIGN
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""" NERDTREE
map ,t :NERDTreeToggle<CR>
