call plug#begin('~/.vim/plugged')
Plug 'davidhalter/jedi-vim'
" Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'yuratomo/w3m.vim'
" Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/calendar.vim'
Plug 'ivalkeen/nerdtree-execute'
Plug 'jpalardy/vim-slime'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'tomtom/tcomment_vim'
Plug '~/.vim/manually/personal'

" Plug 'jalvesaq/Nvim-R'
" Plug 'jalvesaq/colorout'
" Plug 'junegunn/vim-easy-align'
" Plug 'LaTeX-Box-Team/LaTeX-Box'
" Plug 'plasticboy/vim-markdown'
" Plug 'vim-scripts/screen.vim'
" Plug 'Yggdroot/indentLine'
" Plug 'AndrewRadev/sideways.vim'
" Plug 'tomtom/checksyntax_vim'
" Plug 'vim-scripts/math'
" Plug 'chrisbra/unicode.vim'
" Plug 'Chiel92/vim-autoformat'
" Plug 'elmanuelito/vim-matlab-behave'
call plug#end()

syntax enable
filetype plugin indent on

set autoindent
set autowriteall
set backspace=2
set clipboard=unnamed
set cursorline
set expandtab
set foldmethod=syntax
set foldnestmax=1
set hlsearch
set incsearch
set mouse=a
set nocompatible
set nofoldenable
set noswapfile
set number
set relativenumber
set ruler
set shiftwidth=2
set shiftwidth=4
set showmatch
set tabstop=2
set ts=4
set tw=78
set wmw=0
set wrap

nnoremap Q <nop>  "Ex mode
nnoremap ' `
nnoremap ` '

let maplocalleader = ","
let mapleader = ","

" set background=dark
colorscheme solarized

map gm :call cursor(0, virtcol('$')/2)<CR>

""" W3m
let g:w3m#command = '/usr/bin/w3m'


""" Tmux
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
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


" let R_in_buffer = 0
" let R_applescript = 0
" let R_tmux_split = 1
" let R_tmux_title = "Nvim-R"
" let R_tmux_title = "automatic"
" let R_tmux_ob = 0
"
" """ Case-insensive search
"
"
"
"
""" VIM-SLIME, SH
au BufNewFile,BufRead *.py set filetype=python
au BufNewFile,BufReadPost *.mql setlocal filetype=mongoql

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ".2"}
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1
let g:slime_no_mappings = 1
autocmd FileType python,sh,mongoql,matlab,w3m xmap <buffer> <space> <Plug>SlimeRegionSend
autocmd FileType python,sh,mongoql,matlab,w3m nmap <buffer> <space> <Plug>SlimeLineSend<cr>
autocmd FileType python,sh,mongoql,matlab,w3m nmap <buffer> ,p <Plug>SlimeMotionSend
autocmd FileType python,sh,mongoql,matlab,w3m nmap <buffer> ,pa ,p}}
autocmd FileType python,sh,mongoql,matlab,w3m nmap <buffer> ,rp ve<space>
autocmd FileType python,sh,mongoql,matlab,w3m imap <buffer> ,l <Plug>SlimeLineSend<cr>
" autocmd FileType python nmap <buffer> ,pa <Plug>SlimeParagraphSend }
autocmd FileType python,mongoql,matlab noremap <buffer> <silent> ,q
      \ :!tmux kill-pane -t 3 && tmux kill-pane -t 2 <cr><cr>
autocmd FileType c,cpp,java map <buffer> <f3> :!tmux split-window &&
      \ tmux select-layout even-horizontal &&
      \ tmux resize-pane -t 2 -x 75 && tmux select-pane -t:.1
      \ <cr><cr>
autocmd FileType matlab map <buffer> <f2> :!tmux split-window &&
      \ tmux select-layout even-horizontal <cr><cr>
      \ :!tmux send-keys -t 2 'matlab -nodesktop' Enter <cr><cr>
      \ :!tmux split-window -d -t 2 &&
      \ tmux resize-pane -t 3 -x 75 -y 20 &&
      \ tmux select-pane -t:.1 <cr><cr>
autocmd FileType python map <buffer> <f3> :!tmux split-window &&
      \ tmux select-layout even-horizontal <cr><cr>
      \ :!tmux send-keys -t 2 'ipython3' Enter <cr><cr>
      \ :!tmux split-window -d -t 2 &&
      \ tmux resize-pane -t 3 -x 75 -y 20 &&
      \ tmux select-pane -t:.1 <cr><cr>
autocmd FileType python,w3m map <buffer> <f2> :!tmux split-window &&
      \ tmux select-layout even-horizontal <cr><cr>
      \ :!tmux send-keys -t 2 'ipython2' Enter <cr><cr>
      \ :!tmux split-window -d -t 2 &&
      \ tmux resize-pane -t 3 -x 75 -y 20 &&
      \ tmux select-pane -t:.1 <cr><cr>

autocmd FileType mongoql map <buffer> <f2> :!tmux split-window &&
      \ tmux select-layout even-horizontal <cr><cr>
      \ :!tmux split-window -d -t 2 &&
      \ tmux resize-pane -t 3 -x 75 -y 20 &&
      \ tmux select-pane -t:.1 <cr><cr>
      \ :!tmux send-keys -t 2 'mongo' Enter <cr><cr>
autocmd FileType sh,perl map <buffer> <f2> :!tmux split-window &&
      \ tmux select-layout even-horizontal &&
      \ tmux resize-pane -t 2 -x 75 && tmux select-pane -t:.1 <cr><cr>
autocmd FileType sh,perl noremap <buffer> <silent> ,q
      \ :!tmux send-keys -t 2 'exit' Enter <cr><cr>


""" YCM YOUCOMPLETEME
let g:ycm_confirm_extra_conf = 0
autocmd FileType c,cpp,objc nnoremap <buffer> ,ef :YcmCompleter FixIt<CR>


""" CTRLP
let g:ctrlp_root_markers = ['NAMESPACE', 'main.cpp', 'Makefile', 'README.md']
let g:ctrlp_working_path_mode = 'r'

""" REMOVE TRAILING SPACES
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
fun! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun
" let _s=@/ let @/



" """ EASY-ALIGN
" " Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)
"
" """ INDENT-LINE
" let g:indentLine_color_term = 10
" let g:indentLine_color_tty_dark = 10
" map ,ei :IndentLinesToggle<cr>
" let g:indentLine_enabled = 0
"

" """ MINE
" noremap gd :call Pjump()<cr><cr>
" function! Pjump()
" 	:WincmdTag
" 	if winnr() == winnr("$")
" 		execute (winnr("$") - 1) . "WincmdW"
" 	else
" 		execute winnr("$") . "WincmdW"
" 	endif
" 	:norm ZZ
"     :exe "normal :vs\<cr>"
" 	:WincmdTag
" 	if winnr() == winnr("$")
" 		execute (winnr("$") - 1) . "WincmdW"
" 	else
" 		execute winnr("$") . "WincmdW"
" 	endif
"     :exe "normal \<c-]>"
"     :norm z.
" endfunction
"
"
" """ VIM-R-PLUGIN
" let r_syntax_folding = 1
" set nofoldenable
" let vimrplugin_assign = 1
" " set <M-->=^[-
" " let vimrplugin_assign_map = "<M-->"
" au BufNewFile,BufRead *.r set filetype=r
" au BufNewFile,BufRead *.R set filetype=r
" autocmd FileType r map <buffer> <f2> <Plug>RStart <cr>
" 			\ :!tmux select-layout even-horizontal <cr><cr>
" 			\ :!tmux resize-pane -t 2 -x 70 &&
" 			\ tmux split-window -t 2 -d &&
" 			\ tmux select-pane -t 1 <cr><cr>
" 			\ :!tmux resize-pane -t 2 -y 20 <cr><cr>
" autocmd FileType r map <buffer> <f3>
" 			\ :!tmux select-layout even-horizontal <cr><cr>
" 			\ :!tmux resize-pane -t 2 -x 75 <cr><cr>
" 			\ :!tmux resize-pane -t 2 -y 20 <cr><cr>
" 			\ <c-w>=
"
" " autocmd FileType r map <buffer> <f3> :!tmux select-layout even-horizontal &&
" " 			\ tmux resize-pane -t 2 -x 75 <cr><cr>
"
" autocmd FileType r imap <buffer> <f2> <Plug>RStart
" autocmd FileType r vmap <buffer> <f2> <Plug>RStart
" autocmd FileType r vmap <buffer> <Space> <Plug>RDSendSelection
" autocmd FileType r nmap <buffer> <Space> <Plug>RDSendLine
" set completeopt-=preview
"
" autocmd FileType r imap <buffer> ,> <space><esc>ciw<space>%>%<space>
" autocmd FileType r imap <buffer> ,> <space><esc>ciw<space>%>%<space>
" autocmd FileType r imap <buffer> ,= <space><esc>ciw<space>%<>%<space>
" autocmd FileType r imap <buffer> ,< <space><esc>ciw<space>%T>%<space>
" autocmd FileType r imap <buffer> ,t <space><esc>ciw<space>%T>%<space>
" autocmd FileType r imap <buffer> ,$ <space><esc>ciw<space>%$%<space>
" " autocmd FileType r imap <buffer> _ <space><esc>ciw<space><-<space>
"
" "map <silent> <LocalLeader>rk :call RAction("levels")<CR>
" autocmd FileType r noremap <buffer> <silent> <LocalLeader>t :call RAction("tail")<CR>
" autocmd FileType r noremap <buffer> <silent> <LocalLeader>h :call RAction("head")<CR>
" autocmd FileType r noremap <buffer> <silent> <LocalLeader>q
" 			\ :call g:SendCmdToR("quit(save=\"no\")")<cr>
" 			\ :!tmux send-keys -t 2 'exit' Enter <cr><cr>
"
" let vimrplugin_args_in_stline = 0
" au FileType R imap <buffer> <silent> <LocalLeader>ru <Plug>RCompleteArgs
" let g:r_hl_roxygen = 0
" let vimrplugin_vimpager = "tabnew"
"
"
"
" """ CPP
"
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
" function! TwiddleCase(str)
" 	if a:str ==# toupper(a:str)
" 		let result = tolower(a:str)
" 	elseif a:str ==# tolower(a:str)
" 		let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
" 	else
" 		let result = toupper(a:str)
" 	endif
" 	return result
" endfunction
" vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv
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
" """ SIDEWAYS
" nnoremap ,ah :SidewaysLeft<cr>
" nnoremap ,al :SidewaysRight<cr>
"
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
" """ VIM-AUTOFORMAT
" noremap ,ed :Autoformat<CR>
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
