call plug#begin('~/.vim/plugged')

" Plug 'LucHermitte/mu-template'
" Plug 'LucHermitte/searchInRuntime'
" Plug 'vim-scripts/winmanager'
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'davidhalter/jedi'
Plug 'gabrielelana/vim-markdown'
Plug 'hdima/python-syntax'
Plug 'ivalkeen/nerdtree-execute'
Plug 'jalvesaq/R-Vim-runtime'
Plug 'jcfaria/Vim-R-plugin'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'LucHermitte/lh-brackets'
Plug 'LucHermitte/lh-cpp'
Plug 'LucHermitte/lh-dev'
Plug 'LucHermitte/lh-tags'
Plug 'LucHermitte/lh-vim-lib'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/screen.vim'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'Yggdroot/indentLine'
Plug '~/.vim/manually/personal'
Plug 'chrisbra/csv.vim'

call plug#end()

colorscheme solarized
filetype plugin indent on
let g:tmux_navigator_no_mappings = 1
let mapleader = ","
let maplocalleader = ","
nnoremap gh :bN<cr>
nnoremap gl :bn<cr>
nnoremap gW :bd<cr>:syn on<cr>
nnoremap gw :bN<cr>:bd #<cr>
nnoremap ' `
nnoremap ` '
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
set autoindent
set autowriteall
set background=dark
set backspace=2
set clipboard=unnamed
set foldmethod=syntax
set foldnestmax=1
set formatoptions+=t
set hlsearch
set incsearch
set nocompatible
set nofoldenable
set noswapfile
set number
set ruler
set shiftwidth=2
set tabstop=2
set tw=78
set wmw=0
set wrap
syntax on

""" Case-insensive search
" set ignorecase
" set smartcase

""" ESC keys
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
autocmd FileType python xmap <buffer> <leader>r <Plug>SlimeRegionSend
autocmd FileType python nmap <buffer> <leader>r <Plug>SlimeMotionSend
autocmd FileType python nmap <buffer> <leader>rr <Plug>SlimeLineSend
autocmd FileType python nmap <buffer> <space> <Plug>SlimeLineSend<cr>
autocmd FileType python nmap <buffer> <leader>rp <Plug>SlimeParagraphSend
autocmd FileType c,cpp,java,python map <buffer> <f3> :!tmux split-window && tmux select-layout
      \ even-horizontal && tmux resize-pane -t 2 -x 78 && tmux select-pane -t:.1
      \ <cr><cr>

""" EASY-ALIGN
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""" NERDTREE
" map ,et :NERDTreeToggle<CR>
map ,et :NERDTree<CR>
let NERDTreeWinSize=20
let NERDTreeMapJumpNextSibling=',j'
let NERDTreeMapJumpPrevSibling=',k'

""" INDENT-LINE
let g:indentLine_color_term = 10
let g:indentLine_color_tty_dark = 10
map ,ei :IndentLinesToggle<cr>
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

" map ,<space> <esc>:call PJumpMaker()<cr>
" function! PJumpMaker()
" 	let str=getline('.')
"   if str =~ "«»"
" 		echo "jump"
" 		:norm ,m
" 	else
" 		:execute "normal! a,\<esc>a\<space>"
"   endif
" 	:call feedkeys('a','n')
" endfunction


""" VIM-R-PLUGIN
let r_syntax_folding = 1
set nofoldenable
let vimrplugin_assign = 1
au BufNewFile,BufRead *.r set filetype=r
au BufNewFile,BufRead *.R set filetype=r
autocmd FileType R map <buffer> <f2> <Plug>RStart <cr>
			\ :!tmux select-layout even-horizontal &&
      \ tmux resize-pane -t 2 -x 78 <cr><cr>
autocmd FileType R imap <buffer> <f2> <Plug>RStart
autocmd FileType R vmap <buffer> <f2> <Plug>RStart
autocmd FileType R map <buffer> <f3> :!tmux select-layout even-horizontal &&
      \ tmux resize-pane -t 2 -x 78 <cr><cr>
autocmd FileType R vmap <buffer> <Space> <Plug>RDSendSelection
autocmd FileType R nmap <buffer> <Space> <Plug>RDSendLine
set completeopt-=preview
autocmd FileType R imap <buffer> ,> <space><esc>ciw<space>%>%<space>
autocmd FileType R imap <buffer> ,> <space><esc>ciw<space>%>%<space>
autocmd FileType R imap <buffer> ,= <space><esc>ciw<space>%<>%<space>
autocmd FileType R imap <buffer> ,< <space><esc>ciw<space>%T>%<space>
autocmd FileType R imap <buffer> ,$ <space><esc>ciw<space>%$%<space>
"map <silent> <LocalLeader>rk :call RAction("levels")<CR>
autocmd FileType R noremap <buffer> <silent> <LocalLeader>t :call RAction("tail")<CR>
autocmd FileType R noremap <buffer> <silent> <LocalLeader>h :call RAction("head")<CR>
autocmd FileType R noremap <buffer> <silent> <LocalLeader>q
      \ :call g:SendCmdToR("quit(save=\"no\")")<cr>
let vimrplugin_args_in_stline = 1
" imap <C-A> <Plug>RCompleteArgs
autocmd FileType R imap <buffer> <silent> <LocalLeader>ra <Plug>RCompleteArgs

""" WINMANAGE HACK
function! ToggleNerdtreeTagbar()

	" check if NERDTree and Tagbar are opened
	let NERDTree_close = (bufwinnr('NERD_tree') == -1)
	let Tagbar_close   = (bufwinnr('__Tagbar__') == -1)

	NERDTreeToggle
	TagbarToggle

	if NERDTree_close && Tagbar_close
		wincmd K
		wincmd b
		wincmd L
		wincmd h
		exe 'vertical resize 22'
	endif

endfunction
nmap ,en :call ToggleNerdtreeTagbar()<CR>

""" CTRLP
let g:ctrlp_root_markers = ['NAMESPACE', 'main.cpp', 'Makefile']
let g:ctrlp_working_path_mode = 'r'

""" YCM YOUCOMPLETEME
let g:ycm_confirm_extra_conf = 0


""" REMOVE TRAILING SPACES
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
fun! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun
" let _s=@/ let @/

""" CPP
autocmd FileType c,cpp,objc nnoremap <buffer> <c-e>b
			\ :w<cr>:!tmux if-shell "test \#{window_panes} -gt 2"
			\ "send-keys -t 3 ':qa' Enter 'clear && make %:r' Enter "
			\ "send-keys -t 2 ':qa' Enter 'clear && make %:r' Enter "<cr><cr>

autocmd FileType c,cpp,objc nnoremap <buffer> <c-e>B
			\ :w<cr>:!tmux if-shell "test \#{window_panes} -gt 2"
			\ "send-keys -t 3 ':qa' Enter 'clear && make main' Enter "
			\ "send-keys -t 2 ':qa' Enter 'clear && make main' Enter "<cr><cr>

autocmd FileType c,cpp,objc nnoremap <buffer> <c-e>r
			\ :w<cr>:!tmux if-shell "test \#{window_panes} -gt 2"
			\ "send-keys -t 3 ':qa' Enter 'clear && ./%:r' Enter "
			\ "send-keys -t 2 ':qa' Enter 'clear && ./%:r' Enter "<cr><cr>

autocmd FileType c,cpp,objc nnoremap <buffer> <c-e>R
			\ :w<cr>:!tmux if-shell "test \#{window_panes} -gt 2"
			\ "send-keys -t 3 ':qa' Enter 'clear && ./main' Enter "
			\ "send-keys -t 2 ':qa' Enter 'clear && ./main' Enter "<cr><cr>

autocmd FileType c,cpp,objc nnoremap <buffer> <c-e>d
			\ :w<cr>:!tmux if-shell "test \#{window_panes} -gt 2"
			\ "send-keys -t 3 ':qa' Enter 'clear && ./%:r' Enter "
			\ "send-keys -t 2 ':qa' Enter 'clear && ./%:r' Enter "<cr><cr>

autocmd FileType c,cpp,objc nnoremap <buffer> <c-e>D
			\ :w<cr>:!tmux if-shell "test \#{window_panes} -gt 2"
			\ "send-keys -t 3 ':qa' Enter 'clear && drmem -- ./main' Enter "
			\ "send-keys -t 2 ':qa' Enter 'clear && drmem -- ./%:r' Enter "<cr><cr>

" autocmd FileType c,cpp,objc nnoremap <buffer> <c-e><c-d> :!tmux send-keys -t 3 ':qa'
" \Enter 'clear && vim `drmem -- ./main 2>&1 \| tail -1 \| rev \| cut -d: -f1
" \ \| rev`' Enter<cr><cr>


