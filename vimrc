call plug#begin('~/.vim/plugged')

Plug 'yuratomo/w3m.vim'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ivalkeen/nerdtree-execute'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-commentary'
Plug '~/.vim/manually/personal'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
call plug#end()

set autoindent
set autowriteall
set clipboard=unnamed
set cursorline
set expandtab
set fo-=t
set hlsearch
set incsearch
set mouse=a
set nocompatible
set noswapfile
" set number
" set relativenumber
set ruler
set backspace=2
set shiftwidth=2
set ts=2
set tabstop=2
set showmatch
set tw=78
set wmw=0
set wrap
map ,nw :set nowrap! <CR>
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

set background=dark
colorscheme solarized

map gm :call cursor(0, virtcol('$')/2)<CR>
" map gm 0w :call cursor(0, virtcol('.')/2)<CR>
autocmd FileType markdown nmap ,h yypv$r-<Esc>0
autocmd FileType markdown nmap ,H yypv$r=<Esc>0
autocmd FileType python nmap ,h o#<Esc>60a#<Esc>0

""" tmux
nmap ,tl :!tmux resizep -t 2 -x 30<cr><cr><c-w>=
nmap ,th :!tmux resizep -t 2 -x 65<cr><cr><c-w>=


""" folding
set foldmethod=manual   "fold based on indent
set nofoldenable        "dont fold by default
set foldnestmax=1
set foldlevel=1

""" vim-surround
nmap '' ysiw'
nmap "" ysiw""
nmap ( ysiw)
nmap [ ysiw]

""" Tmux
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1
" nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap gh :bN<cr>
nnoremap gl :bn<cr>
nnoremap gW :bd<cr>:syn on<cr>
nnoremap gw :bN<cr>:bd #<cr>

""" Auto-pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = '<C-}>'
let g:AutoPairsShortcutJump = ',m'
let g:AutoPairsShortcutBackInsert = ',b'
" <M-p> : Toggle Autopairs (g:AutoPairsShortcutToggle)
" <M-e> : Fast Wrap (g:AutoPairsShortcutFastWrap)
" <M-n> : Jump to next closed pair (g:AutoPairsShortcutJump)
" <M-b> : BackInsert (g:AutoPairsShortcutBackInsert)


""" Nerdtree and Tagbar
" map ,et :NERDTreeToggle<CR>
map ,et :NERDTree<CR>
let NERDTreeWinSize=20
let NERDTreeMapJumpNextSibling=',j'
let NERDTreeMapJumpPrevSibling=',k'
" Winmanage hack
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
nmap ,en :call ToggleNerdtreeTagbar()<CR><c-l>
" Tagbar
set tags=./tags,tags;$HOME
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


""" CALENDAR
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1


augroup PreviewOnBottom
    autocmd InsertEnter * set splitbelow
    autocmd InsertLeave * set splitbelow!
augroup END

""" Syntastic
let g:syntastic_python_python_exec = '/usr/bin/python2'


""" VIM-SLIME, SH
au BufNewFile,BufRead *.py set filetype=python
au BufNewFile,BufReadPost *.mql setlocal filetype=mongoql

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ".2"}
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1
let g:slime_no_mappings = 1
autocmd FileType python,sh,mongoql,matlab,w3m,perl xmap <buffer> <space> <Plug>SlimeRegionSend
autocmd FileType python,sh,mongoql,matlab,w3m,perl nmap <buffer> <space> <Plug>SlimeLineSend<cr>
autocmd FileType python,sh,mongoql,matlab,w3m,perl nmap <buffer> ,p <Plug>SlimeMotionSend
autocmd FileType python,sh,mongoql,matlab,w3m,perl nmap <buffer> ,pa ,p}}
" autocmd FileType python,sh,mongoql,matlab,w3m,perl nmap <buffer> ,rp viwe<space>
autocmd FileType python,sh,mongoql,matlab,w3m,perl nmap <buffer> ,rp viw<space>
autocmd FileType python,sh,mongoql,matlab,w3m,perl imap <buffer> <c-l> <Esc><Plug>SlimeLineSendo


""" CTRLP
let g:ctrlp_root_markers = ['NAMESPACE', 'main.cpp', 'Makefile', 'README.md']
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
" nmap <c-p> :CtrlPBuffer<cr>
nmap <c-\> :CtrlP<cr>

""" REMOVE TRAILING SPACES
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
fun! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun
" let _s=@/ let @/


""" VIM-AUTOFORMAT
noremap ,ed :Autoformat<CR>


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


""" EASY-ALIGN
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


""" Easy tags
:set tags=./tags;
:let g:easytags_dynamic_files = 2
