call plug#begin('~/.vim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/syntastic'
Plug 'yuratomo/w3m.vim'
Plug 'scrooloose/nerdtree'
Plug 'tacahiroy/ctrlp-funky'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/calendar.vim'
Plug 'ivalkeen/nerdtree-execute'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-commentary'
Plug '~/.vim/manually/personal'
Plug 'nvie/vim-flake8'
Plug 'jalvesaq/Nvim-R'
Plug 'junegunn/vim-easy-align'
Plug 'altercation/vim-colors-solarized'
" Plug 'robu3/vimongous'
Plug 'plasticboy/vim-markdown'
Plug 'Yggdroot/indentLine'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'tmhedberg/SimpylFold'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-scripts/python.vim'
Plug 'jpalardy/vim-slime'
Plug 'AndrewRadev/sideways.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
" Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/summerfruit256.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'hdima/python-syntax'
Plug 'NLKNguyen/c-syntax.vim'
Plug 'guns/xterm-color-table.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-abolish'
" Plug 'powerline/powerline'
" Plug 'Chiel92/vim-autoformat' "autopep8 for python
" Plug 'epeli/slimux'
" Plug 'tomtom/tcomment_vim'
" Plug 'LaTeX-Box-Team/LaTeX-Box'
" Plug 'vim-scripts/screen.vim'
" Plug 'tomtom/checksyntax_vim'
" Plug 'vim-scripts/math'
" Plug 'chrisbra/unicode.vim'

call plug#end()

syntax enable
filetype plugin indent on

" let g:solarized_contrast="high"
" call togglebg#map("<F5>")
" let g:solarized_termcolors=256
" set background=light
" colorscheme solarized
" colorscheme summerfruit256
colorscheme PaperColor
let g:airline_theme='papercolor'

" let g:indentLine_color_term = 239
" let g:indentLine_color_gui = '#A4E57E'
" let g:indentLine_color_tty_light = 7 " (default: 4)
" let g:indentLine_color_dark = 1 " (default: 2)

set number
" set relativenumber
set autoindent
set autowriteall
set backspace=2
set clipboard=unnamed
set cursorline
set expandtab
set formatoptions+=l
set formatoptions-=t
set hlsearch
set incsearch
set linebreak
set mouse=a
set nocompatible
set nolist  " list disables linebreak
set noswapfile
set ruler
set shiftwidth=2
set showmatch
set tabstop=2
set textwidth=0
set wmw=0
set wrap
set wrapmargin=0

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
inoremap Oo <Esc>o
inoremap CC <Esc>C
inoremap SS <Esc>S
inoremap UU <Esc>ui
inoremap PP <c-r>*
ino hh <esc>
cno hh <c-c>
vno v <esc>

let maplocalleader = ","
let mapleader = ","

map gm :call cursor(0, virtcol('$')/2)<CR>
" map gm 0w :call cursor(0, virtcol('.')/2)<CR>
autocmd FileType markdown nmap ,h yypv$r-<Esc>0
autocmd FileType markdown nmap ,H yypv$r=<Esc>0
autocmd FileType python nmap ,h o#<Esc>60a#<Esc>0

""" tmux
nmap ,hh :TagbarOpenAutoClose<cr>:vertical resize 2<cr>:!tmux resizep -t 2 -x 70<cr><cr><C-l>:vertical resize 60<cr>
nmap ,ll :TagbarOpenAutoClose<cr>:vertical resize 25<cr>:!tmux resizep -t 2 -x 2<cr><cr><C-l><C-w>=
nmap ,jj :TagbarOpenAutoClose<cr>:vertical resize 22<cr>:!tmux resizep -t 2 -x 65<cr><cr><C-l><C-w>=
nmap ,kk :TagbarOpenAutoClose<cr>:vertical resize 2<cr>:!tmux resizep -t 2 -x 2<cr><cr><C-l><C-w>=




""" folding
set foldmethod=manual   "fold based on indent
set nofoldenable        "dont fold by default
set foldnestmax=1
set foldlevel=1

" autocmd FileType python setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'^\s*#'
" set foldmethod=marker
" set foldmarker='#<,#>'

" set foldmethod=syntax
" :map f v%zf " manually close a fold
" :map F zD " manually open a fold
" :map <F3> zi " toggle open/close folds
" :map <F4> zn " open all folds


""" airline
let g:airline_section_y = ''

""" vimtex
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'


""" vim-surround
nmap '' ysiw'
nmap "" ysiw""
nmap ( ysiw)
nmap [ ysiw]


""" W3m
let g:w3m#command = '/usr/bin/w3m'


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


""" Python
" let g:ycm_auto_trigger = 1
" let g:ycm_autoclose_preview_window_after_completion=0
let python_highlight_all=1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" let g:ycm_python_binary_path = '/usr/bin/python2'
" let b:python_version_2 = 1


""" Nerdtree and Tagbar
" map ,et :NERDTreeToggle<CR>
map ,et :NERDTree<CR>
let NERDTreeWinSize=20
let NERDTreeMapJumpNextSibling=',j'
let NERDTreeMapJumpPrevSibling=',k'
" Winmanage hack
nmap ,en :call ToggleNerdtreeTagbar()<CR><c-l>
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


""" Nvim-R
au BufNewFile,BufRead *.R set filetype=r
au BufNewFile,BufRead *.r set filetype=r
let R_tmux_split = 1
let R_in_buffer = 0
let R_applescript = 0
let R_tmux_title = "Nvim-R"
let R_tmux_title = "automatic"
let R_tmux_ob = 0
"" VIM-R-PLUGIN
let r_syntax_folding = 1
let vimrplugin_assign = 1
let vimrplugin_args_in_stline = 0
au FileType R imap <buffer> <silent> <LocalLeader>ru <Plug>RCompleteArgs
let g:r_hl_roxygen = 0
let vimrplugin_vimpager = "tabnew"
set completeopt-=preview
" autocmd FileType r map <buffer> <f2> <Plug>RStart
			" \ :!tmux select-layout even-horizontal <cr>
      "       \ :!tmux split-window -t 2 -d <cr>
			" \ :!tmux resize-pane -t 2 -x 64 <cr>
			" \ :!tmux resize-pane -t 2 -y 20 <cr>
			" \ <c-w>=
" autocmd FileType r map <buffer> <f3>
" 			\ :!tmux select-layout even-horizontal <cr>
"             \ :!tmux split-window -t 2 -d <cr>
" 			\ :!tmux resize-pane -t 2 -x 64 <cr>
" 			\ :!tmux resize-pane -t 2 -y 20 <cr>
" 			\ <c-w>=
autocmd FileType r vmap <buffer> <Space> <Plug>RDSendSelection
autocmd FileType r nmap <buffer> <Space> <Plug>RDSendLine
autocmd FileType r imap <buffer> ,> <space><esc>ciw<space>%>%<space>
autocmd FileType r imap <buffer> ,> <space><esc>ciw<space>%>%<space>
autocmd FileType r imap <buffer> ,= <space><esc>ciw<space>%<>%<space>
autocmd FileType r imap <buffer> ,< <space><esc>ciw<space>%T>%<space>
autocmd FileType r imap <buffer> ,t <space><esc>ciw<space>%T>%<space>
autocmd FileType r imap <buffer> ,$ <space><esc>ciw<space>%$%<space>
autocmd FileType r noremap <buffer> <silent> <LocalLeader>t :call RAction("tail")<CR>
autocmd FileType r noremap <buffer> <silent> <LocalLeader>h :call RAction("head")<CR>


""" VIM-SLIME, SH
au BufNewFile,BufRead *.py set filetype=python
au BufNewFile,BufReadPost *.mql setlocal filetype=mongoql

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ".3"}
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
autocmd FileType python nmap <buffer> ,r :wa<cr>
      \ :!tmux send-keys -t 3 'python ' % Enter <cr><cr>
autocmd FileType python nmap <buffer> ,R
      \ :!tmux send-keys -t 3 'python2 ' % Enter <cr><cr>
" autocmd FileType python nmap <buffer> ,R
"       \ :!tmux send-keys -t 3 'python ' % ' \| tee ' %:r '_output.txt' Enter <cr><cr>
autocmd FileType sh,mongoql,matlab,w3m,perl nmap <buffer> ,r
      \ :!tmux send-keys -t 3 ./% Enter <cr><cr>
" autocmd FileType python nmap <buffer> ,pa <Plug>SlimeParagraphSend }


autocmd FileType python,mongoql,matlab,perl,r noremap <buffer> <silent> ,q
      \ :!tmux kill-pane -t 3 && tmux kill-pane -t 2 <cr><cr>
autocmd FileType c,cpp,java map <buffer> <f3> :!tmux split-window &&
      \ tmux select-layout even-horizontal &&
      \ tmux resize-pane -t 2 -x 64 && tmux select-pane -t:.1
      \ <cr><cr>
autocmd FileType matlab map <buffer> <f2> :!tmux split-window &&
      \ tmux select-layout even-horizontal &&
      \ tmux send-keys -t 2 'matlab -nodesktop' Enter &&
      \ tmux split-window -d -t 2 &&
      \ tmux resize-pane -t 3 -x 64 -y 20 &&
      \ tmux select-pane -t:.1 <cr><cr>
autocmd FileType python map <buffer> <f3> ,en:!tmux split-window <cr><cr>
      \ :!tmux select-layout even-horizontal <cr><cr>
      \ :!tmux send-keys -t 2 'ipython3' Enter <cr><cr>
      \ :!tmux split-window -d -t 2 &&
      \ tmux resize-pane -t 3 -x 64 -y 20 &&
      \ tmux select-pane -t:.1 <cr><cr>
autocmd FileType python,w3m map <buffer> <f2> ,en:!tmux split-window &&
      \ tmux select-layout even-horizontal &&
      \ tmux send-keys -t 2 'ipython2' Enter &&
      \ tmux split-window -d -t 2 &&
      \ tmux resize-pane -t 3 -x 30 -y 20 &&
      \ tmux select-pane -t:.1 <cr><cr>:set nonu<cr>:vs<cr>

autocmd FileType mongoql map <buffer> <f2> :!tmux split-window &&
      \ tmux select-layout even-horizontal <cr><cr>
      \ :!tmux split-window -d -t 2 &&
      \ tmux resize-pane -t 3 -x 64 -y 20 &&
      \ tmux select-pane -t:.1 <cr><cr>
      \ :!tmux send-keys -t 2 'mongo' Enter <cr><cr>

autocmd FileType perl map <buffer> <f2> :!tmux split-window &&
      \ tmux select-layout even-horizontal <cr><cr>
      \ :!tmux send-keys -t 2 're.pl' Enter <cr><cr>
      \ :!tmux split-window -d -t 2 &&
      \ tmux resize-pane -t 3 -x 64 -y 20 &&
      \ tmux select-pane -t:.1 <cr><cr>
autocmd FileType perl noremap <buffer> <silent> ,r
      \ :!tmux send-keys -t 3 'perl %' Enter <cr><cr>

autocmd FileType sh map <buffer> <f2> :!tmux split-window &&
      \ tmux select-layout even-horizontal <cr><cr>
      \ :!tmux split-window -d -t 2 &&
      \ tmux resize-pane -t 3 -x 64 -y 20 &&
      \ tmux select-pane -t:.1 <cr><cr>
autocmd FileType sh noremap <buffer> <silent> ,r
      \ :!tmux send-keys -t 3 'perl %' Enter <cr><cr>

autocmd FileType sh noremap <buffer> <silent> ,q
      \ :!tmux send-keys -t 2 'exit' Enter <cr><cr>
      \ :!tmux split-window -d -t 2 &&
      \ tmux select-pane -t:.1 <cr><cr>


""" YCM YOUCOMPLETEME
let g:ycm_confirm_extra_conf = 0
autocmd FileType c,cpp,objc nnoremap <buffer> ,yf :YcmCompleter FixIt<CR>


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
" mouse block select
noremap <M-LeftMouse> <4-LeftMouse>
inoremap <M-LeftMouse> <4-LeftMouse>
onoremap <M-LeftMouse> <C-C><4-LeftMouse>
noremap <M-LeftDrag> <LeftDrag>
inoremap <M-LeftDrag> <LeftDrag>
onoremap <M-LeftDrag> <C-C><LeftDrag>

" view in kindle. A RESTART AND RECONNECT KINDLE MUST RERUN VIM
" vmap <F4> :w! /tmp/kclip.txt<cr>:!DISPLAY=: xterm -e /usr/bin/zsh -c "vim -u ~/.vimrc0 /tmp/kclip.txt"&<cr><cr>
:execute "vmap <F4> :w! /tmp/kclip.txt\<cr>:!DISPLAY=:" . system("cat /tmp/kver | tr -d '\n'"). " xterm -e /usr/bin/zsh -c \"vim -u ~/.vimrc0 /tmp/kclip.txt\"&\<cr>\<cr>"


noremap <C-LeftMouse> <LeftMouse>:call Pjump()<cr><cr><LeftRelease>
nnoremap <X1Mouse> <C-O>
nnoremap <X2Mouse> <C-I>
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


""" INDENT-LINE
let g:indentLine_color_term = 10
let g:indentLine_color_tty_dark = 10
map ,iv :IndentLinesToggle<cr>
let g:indentLine_enabled = 1


""" Ctrlp funky
nnoremap gp :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap gP :execute 'CtrlPFunky ' . expand('<cword>')<Cr>


""" Easy tags
:set tags=./tags;
:let g:easytags_dynamic_files = 2


""" SIDEWAYS
nnoremap ,ah :SidewaysLeft<cr>
nnoremap ,al :SidewaysRight<cr>


""" CPP
autocmd BufWritePost *.cpp :!tmux send-keys -t 3 'g++ -std=c++14 -O2 -o ' %:r ' ' % Enter
autocmd BufWritePost *.tex.md :!tmux send-keys -t 2 'pandoc -s ' % ' --latex-engine=xelatex --filter pandoc-citeproc --bibliography ' %:r '.bib -o ' %:r '.pdf' Enter
autocmd FileType cpp nmap <buffer> ,r :!tmux send-keys -t 3 './'%:r Enter<cr><cr>


function! TwiddleCase(str)
	if a:str ==# toupper(a:str)
    let str2 = tolower(a:str)
		let result = substitute(str2,'\(\<\w\+\>\)', '\u\1', 'g')
	elseif a:str ==# tolower(a:str)
		let result = toupper(a:str)
	else
		let result = tolower(a:str)
	endif
	return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv
inoremap ~~ <Esc>viwy:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv<Esc>a
nnoremap ~ viwy:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv<Esc>


" autocmd FileType c,cpp,objc nnoremap <buffer> ,eb
" 			\ :w<cr>:!tmux send-keys -t 2 ':qa' Enter 'make %:r 2>&1 \| egrep -i "warning\|error"' Enter <cr><cr>
" autocmd FileType c,cpp,objc nnoremap <buffer> ,eB
" 			\ :w<cr>:!tmux send-keys -t 2 ':qa' Enter 'clear && make main' Enter <cr><cr>
" autocmd FileType c,cpp,objc nnoremap <buffer> ,er
" 			\ :w<cr>:!tmux send-keys -t 2 ':qa' Enter 'clear && ./%:r' Enter <cr><cr>
" autocmd FileType c,cpp,objc nnoremap <buffer> ,eR
" 			\ :w<cr>:!tmux send-keys -t 2 ':qa' Enter 'clear && ./main' Enter <cr><cr>
" autocmd FileType c,cpp,objc nnoremap <buffer> ,em
" 			\ :w<cr>:!tmux send-keys -t 2 ':qa' Enter 'clear && drmem -- ./%:r' Enter <cr><cr>
" autocmd FileType c,cpp,objc nnoremap <buffer> ,eM
" 			\ :w<cr>:!tmux send-keys -t 2 ':qa' Enter 'clear && drmem -- ./main' Enter <cr><cr>
"
"
" function! RSendSubLine()
" 	let line=getline('.')
" 	let line=split(line, '%>%')[0]
" 	let line=split(line, '%$%')[0]
" 	let line=split(line, '->')[0]
" 	call g:SendCmdToR(line)
" endfunction
" autocmd FileType R nnoremap <buffer> ,r<space> :call RSendSubLine()<CR>
"
" """ VIM-MARKDOWN
" set conceallevel=1
" let g:vim_markdown_toc_autofit = 1
" " au BufNewFile,BufRead *.md set filetype=md
" " au BufNewFile,BufRead *.mkd set filetype=md
" autocmd FileType markdown map <buffer> <f2> :Toc <cr>
" autocmd FileType markdown map <buffer> <f5> :!pandoc -s %
"       \ --latex-engine=xelatex --filter pandoc-citeproc --bibliography %:r.bib
"       \ -o %:r.pdf <cr>
"       \ :!xdg-open %:r.pdf & <cr><cr>
" autocmd FileType markdown map <buffer> <f6> :!pandoc -s % -o %:r.pdf <cr><cr>
"
"
" """ UNICODE
" "" au BufNewFile,BufRead *.md set filetype=md
" "nmap ga <Plug>(UnicodeGA)
" "" imap <C-X><C-u> <Plug>(DigraphComplete)
" "" imap *& *<esc>viW<Plug>(MakeDigraph)a
" "autocmd FileType text,markdown imap <buffer> u *<esc>vh<Plug>(MakeDigraph)a
" "autocmd FileType text,markdown imap <buffer> i <esc>vh<Plug>(MakeDigraph)a
"
"
" """ MATH
" imap <silent> m        <c-o>:if &kmp == ""<bar>
"       \set kmp=math<bar>
"       \else<bar>
"       \set kmp=<bar>
"       \endif<bar>
"       \echo "kmp<".&kmp.">"<cr>
" nmap <silent> m        :if &kmp == ""<bar>
"       \set kmp=math<bar>
"       \else<bar>
"       \set kmp=<bar>
"       \endif<bar>
"       \echo "kmp<".&kmp.">"<cr>
"
"
"
"
" " Highlight all instances of word under cursor, when idle.
" " Useful when studying strange source code.
" " Type z/ to toggle highlighting on/off.
" nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
" function! AutoHighlightToggle()
"   let @/ = ''
"   if exists('#auto_highlight')
"     au! auto_highlight
"     augroup! auto_highlight
"     setl updatetime=4000
"     echo 'Highlight current word: off'
"     return 0
"   else
"     augroup auto_highlight
"       au!
"       au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
"     augroup end
"     setl updatetime=500
"     echo 'Highlight current word: ON'
"     return 1
"   endif
" endfunction
"
"
