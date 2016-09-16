call plug#begin('~/.vim/plugged')

" Plug 'airblade/vim-gitgutter'
" Plug 'altercation/vim-colors-solarized'
" Plug 'AndrewRadev/sideways.vim'
" Plug 'benekastah/neomake'
" Plug 'Chiel92/vim-autoformat' "autopep8 for python
" Plug 'davidhalter/jedi-vim'
" Plug 'dhruvasagar/vim-table-mode'
" Plug 'epeli/slimux'
" Plug 'guns/xterm-color-table.vim'
" Plug 'hdima/python-syntax'
" Plug 'itchyny/calendar.vim'
" Plug 'itchyny/lightline.vim'
" Plug 'ivalkeen/nerdtree-execute'
" Plug 'jalvesaq/Nvim-R'
" Plug 'jiangmiao/auto-pairs'
" Plug 'junegunn/vim-easy-align'
" Plug 'justinmk/vim-sneak'
" Plug 'kien/ctrlp.vim'
" Plug 'LaTeX-Box-Team/LaTeX-BoxPaperColor'
" Plug 'lervag/vimtex'
" Plug 'nvie/vim-flake8'
" Plug 'plasticboy/vim-markdown'
" Plug 'powerline/powerline'
" Plug 'reedes/vim-lexical'
" Plug 'reedes/vim-litecorrect'
" Plug 'reedes/vim-wordy'
" Plug 'robu3/vimongous'
" Plug 'scrooloose/syntastic'
" Plug 'tacahiroy/ctrlp-funky'
" Plug 'tmhedberg/SimpylFold'
" Plug 'tomtom/checksyntax_vim'
" Plug 'tomtom/tcomment_vim'
" Plug 'tpope/vim-characterize'
" Plug 'tpope/vim-fugitive'
" Plug 'Valloric/YouCompleteMe'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'vim-scripts/math'
" Plug 'vim-scripts/python.vim'
" Plug 'vim-scripts/screen.vim'
" Plug 'Yggdroot/indentLine'
" Plug 'yuratomo/w3m.vim'
" Plug 'zyedidia/julialint.vim'
Plug 'chrisbra/unicode.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'
Plug 'jpalardy/vim-slime'
Plug 'JuliaLang/julia-vim'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug '~/.vim/manually/personal'

call plug#end()

syntax enable
filetype plugin indent on

source ~/dotfiles/theme.vim

""" airline
" let g:airline_section_y = ''
" let g:airline_section_b = ''
let g:airline_powerline_fonts = 0

" │ ┆
let g:indentLine_char = '¦'
let g:indentLine_color_term = 239
" let g:indentLine_color_gui = '#A4E57E'
" let g:indentLine_color_tty_light = 7 " (default: 4)
" let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_concealcursor = 'vc'
" let g:indentLine_conceallevel = 0

set autoindent
set autoread
set autowriteall
set backspace=2
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
set number
set ruler
set shiftwidth=2
set showmatch
set softtabstop=2
set tabstop=2
set textwidth=0
set wmw=0
set wrap
set wrapmargin=0
" set clipboard=unnamed
" set clipboard+=unnamedplus
" vnoremap y ygv"+y

au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! w
" au FileType python setlocal shiftwidth=2 tabstop=2

" set autoread
augroup checktime
    au!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command
        "line window.
        autocmd BufEnter        * silent! checktime
        autocmd CursorHold      * silent! checktime
        autocmd CursorHoldI     * silent! checktime
        "these two _may_ slow things down. Remove if they do.
        autocmd CursorMoved     * silent! checktime
        autocmd CursorMovedI    * silent! checktime
    endif
augroup END

map ,nw :set nowrap! <CR>
nnoremap Q <nop>  "Ex mode
nnoremap ' "
nnoremap " '
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
inoremap PP <c-r>"
inoremap hh <esc>
cnoremap hh <c-c>
vnoremap v <esc>
nnoremap ,wd :windo diffthis<cr>
map <c-s> :wa<cr>


let mapleader = ","
let maplocalleader = ","

map gm :call cursor(0, virtcol('$')/2)<CR>
" map gm 0w :call cursor(0, virtcol('.')/2)<CR>
autocmd FileType markdown nmap ,h yypv$r-<Esc>0
autocmd FileType markdown nmap ,H yypv$r=<Esc>0
autocmd FileType python nmap ,h o#<Esc>60a#<Esc>0

let g:jedi#force_py_version = 3


""" Tex Lyx
vnoremap ,gt :TexTabulify 0<cr>gv:EasyAlign*&<cr>
vnoremap ,gtt :TexTabulify 1<cr>gv:EasyAlign*&<cr>magvj<esc>mb'akV'b:w /tmp/aaa.tex<cr>:!tex2lyx /tmp/aaa.tex<cr><cr>:!xdg-open /tmp/aaa.lyx
" noremap ,gl :!tex2lyx %
nnoremap ,gl :w<cr>:!tex2lyx % %:r.lyx<cr><cr>
nnoremap <C-ScrollWheelUp> :!xdotool key ctrl+Up<cr><cr>
nnoremap <C-ScrollWheelDown> :!xdotool key ctrl+Down<cr><cr>


" vnoremap ,ct :call s:TexTabulify(0)
" vnoremap ,ctt :<line1>,<line2>call s:TexTabulify(1)


:nnoremap <F8> :setl noai nocin nosi inde=<CR>

""" tmux
" nmap ,hh :TagbarOpenAutoClose<cr>:vertical resize 2<cr>:!tmux resizep -t 2 -x 80<cr><cr><C-l><C-w>=<C-l>
" nmap ,hh :TagbarOpenAutoClose<cr>:vertical resize 2<cr>:!tmux resizep -t 2 -x 70<cr><cr><C-l>:vertical resize 75<cr><C-l>
" nmap ,ll :TagbarOpenAutoClose<cr>:vertical resize 22<cr>:!tmux resizep -t 2 -x 2<cr><cr><C-l><C-w>=
" nmap ,hl :TagbarOpenAutoClose<cr>:vertical resize 2<cr>:!tmux resizep -t 2 -x 65<cr><cr><C-l>:vertical resize 70<cr><C-l>
nmap ,jj :TagbarOpenAutoClose<cr>:vertical resize 21<cr>:!tmux resizep -t 2 -x 84<cr><cr><C-l>:set number<cr><C-l>:set number<cr><C-w>=
nmap ,js :TagbarOpenAutoClose<cr>:vertical resize 21<cr>:!tmux resizep -t 2 -x 84<cr><cr><C-l>:set number<cr><C-l>:set number<cr><C-w>=
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


""" vimtex
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'


""" vim-surround
" nmap '' ysiw'
" nmap "" ysiw""
" nmap ( ysiw)
" nmap [ ysiw]


""" W3m
let g:w3m#command = '/usr/bin/w3m'


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
nmap ,em :call ToggleNerdtreeTagbar()<CR><c-l><cr>
nmap ,en :call ToggleNerdtreeTagbar()<CR><c-l>:vs<cr>

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
let g:tagbar_type_julia = {
      \ 'ctagstype' : 'julia',
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
let g:syntastic_python_python_exec = '/usr/bin/python'


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
"       \ :!tmux select-layout even-horizontal <cr>
"             \ :!tmux split-window -t 2 -d <cr>
"       \ :!tmux resize-pane -t 2 -x 64 <cr>
"       \ :!tmux resize-pane -t 2 -y 20 <cr>
"       \ <c-w>=
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
let g:slime_default_config = {"socket_name": "default", "target_pane": ".2"}
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1
let g:slime_no_mappings = 1
autocmd FileType julia,python,sh,mongoql,matlab,w3m,perl xmap <buffer> <space> <Plug>SlimeRegionSend
autocmd FileType julia,python,sh,mongoql,matlab,w3m,perl nmap <buffer> <space> <Plug>SlimeLineSend<cr>
autocmd FileType julia,python,sh,mongoql,matlab,w3m,perl nmap <buffer> ,p <Plug>SlimeMotionSend
autocmd FileType julia,python,sh,mongoql,matlab,w3m,perl nmap <buffer> ,pa ,p}}
" autocmd FileType python,sh,mongoql,matlab,w3m,perl nmap <buffer> ,rp viwe<space>
" autocmd FileType python,sh,mongoql,matlab,w3m,perl nmap <buffer> ,rp viw<space>
autocmd FileType julia,python,sh,mongoql,matlab,w3m,perl imap <buffer> <c-l> <Esc><Plug>SlimeLineSendo
autocmd FileType python nmap <buffer> ,) :wa<cr>:!tmux send-keys -t 3 'python3 ' % Enter <cr><cr>
autocmd FileType python nmap <buffer> ,2 :wa<cr>:!tmux send-keys -t 3 'python3 ' main.py Enter <cr><cr>
autocmd FileType python nmap <buffer> ,+ :wa<cr>:!tmux send-keys -t 4 'python3 ' % Enter <cr><cr>
autocmd FileType python nmap <buffer> ,4 :wa<cr>:!tmux send-keys -t 4 'python3 ' main.py Enter <cr><cr>
autocmd FileType python nmap <buffer> ,] :wa<cr>:!tmux send-keys -t 5 'python3 ' % Enter <cr><cr>
autocmd FileType python nmap <buffer> ,6 :wa<cr>:!tmux send-keys -t 5 'python3 ' main.py Enter <cr><cr>
" autocmd FileType python nmap <buffer> ,] :wa<cr>:!tmux send-keys -t 5 'cgexec -g memory,cpuset:runex `which python3` ' % Enter <cr><cr>
" autocmd FileType python nmap <buffer> ,6 :wa<cr>:!tmux send-keys -t 5 'cgexec -g memory,cpuset:runex `which python3` ' main.py Enter <cr><cr>
autocmd FileType python nmap <buffer> ,R :wa<cr>:!tmux send-keys -t 3 'python3 main.py' Enter <cr><cr>
autocmd FileType julia nmap <buffer> ,r :!tmux send-keys -t 3 julia \ `realpath %` Enter<cr><cr>
autocmd FileType julia nmap <buffer> ,R :!tmux send-keys -t 3 julia \ `realpath main.jl` Enter<cr><cr>
" autocmd FileType python nmap <buffer> ,R
"       \ :!tmux send-keys -t 3 'python ' % ' \| tee ' %:r '_output.txt' Enter <cr><cr>
autocmd FileType sh,mongoql,matlab,w3m,perl nmap <buffer> ,r :!tmux send-keys -t 3 ./% Enter <cr><cr>
" autocmd FileType python nmap <buffer> ,pa <Plug>SlimeParagraphSend }


autocmd FileType python noremap <buffer> ,q :!tmux kill-pane -t 2 && tmux kill-pane -t 2 && tmux kill-pane -t 2 && tmux kill-pane -t 2<cr><cr>
autocmd FileType julia noremap <buffer> ,q :!tmux kill-pane -t 2 && tmux kill-pane -t 2<cr><cr>

autocmd FileType c,cpp,java map <buffer> <f3> :!tmux split-window &&
      \ tmux select-layout even-horizontal &&
      \ tmux resize-pane -t 2 -x 64 && tmux select-pane -t:.1
      \ <cr><cr>

autocmd FileType vim map <buffer> <f5> :w<cr>:so %<cr>:PlugInstall<cr>

execute "nmap ,jl :!tmux send-keys -t 2 'cd(\"" . getcwd(). "\")' Enter<cr><cr>"

autocmd FileType julia map <buffer> <f2> :!tmux split-window &&
      \ tmux select-layout even-horizontal &&
      \ tmux split-window -d -t 2 &&
      \ tmux send-keys -t 2 'julia' Enter<cr><cr>
      \ :!tmux select-pane -t:.1 <cr><cr>,en,jj,jl

autocmd FileType matlab map <buffer> <f2> :!tmux split-window &&
      \ tmux select-layout even-horizontal &&
      \ tmux send-keys -t 2 'matlab -nodesktop' Enter &&
      \ tmux split-window -d -t 2 &&
      \ tmux resize-pane -t 3 -x 64 -y 20 &&
      \ tmux select-pane -t:.1 <cr><cr>,jj

autocmd FileType python map <buffer> <f3> ,en:!tmux split-window <cr><cr>
      \ :!tmux select-layout even-horizontal <cr><cr>
      \ :!tmux send-keys -t 2 'ipython3' Enter <cr><cr>
      \ :!tmux split-window -d -t 2 &&
      \ tmux resize-pane -t 3 -x 64 -y 20 &&
      \ tmux select-pane -t:.1 <cr><cr>

autocmd FileType python map <buffer> <f2> :!tmux split-window &&
      \ tmux select-layout even-horizontal &&
      \ tmux split-window -d -t 2 &&
      \ tmux split-window -d -t 2 &&
      \ tmux split-window -d -t 2 &&
      \ tmux send-keys -t 2 'ipython' Enter &&
      \ tmux send-keys -t 3 'sshdevcube' Enter &&
      \ tmux send-keys -t 4 'sshxeon' Enter &&
      \ tmux send-keys -t 3 'cd share/ml/sec' Enter &&
      \ tmux send-keys -t 4 'cd share/ml/sec' Enter &&
      \ tmux resize-pane -t 2 -x 30 &&
      \ tmux select-pane -t:.1 <cr><cr>,en,jj

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

autocmd FileType sh noremap <buffer> <silent> ,q
      \ :!tmux send-keys -t 2 'exit' Enter <cr><cr>
      \ :!tmux split-window -d -t 2 &&
      \ tmux select-pane -t:.1 <cr><cr>


""" YCM YOUCOMPLETEME
let g:ycm_confirm_extra_conf = 0
autocmd FileType c,cpp,objc nnoremap <buffer> ,yf :YcmCompleter FixIt<CR>


""" CTRLP
let g:ctrlp_root_markers = ['NAMESPACE', 'main.cpp', 'Makefile', 'README.md']
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlPBuffer'
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
" noremap <M-LeftMouse> <4-LeftMouse>
" inoremap <M-LeftMouse> <4-LeftMouse>
" onoremap <M-LeftMouse> <C-C><4-LeftMouse>
" noremap <M-LeftDrag> <LeftDrag>
" inoremap <M-LeftDrag> <LeftDrag>
" onoremap <M-LeftDrag> <C-C><LeftDrag>

noremap <M-LeftMouse> <LeftMouse><Esc><C-V>
noremap <M-LeftDrag> <LeftDrag>


" view in kindle. A RESTART AND RECONNECT KINDLE MUST RERUN VIM
vmap <F4> :w! /tmp/kclip.txt<cr>:!kview_clip

noremap <C-LeftMouse> <LeftMouse>:call Pjump()<cr><cr><LeftRelease>
nnoremap <X1Mouse> <C-O>
nnoremap <X2Mouse> <C-I>
noremap gd :call Pjump()<cr><cr>
function! Pjump()
  if winnr("$") == 4
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
  endif
  :exe "normal \<c-]>"
  :norm z.
endfunction


" let g:jedi#goto_command = <MiddleMouse>

""" EASY-ALIGN
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


""" INDENT-LINE
let g:indentLine_color_term = 10
let g:indentLine_color_tty_dark = 10
" map ,iv :IndentLinesToggle<cr>
let g:indentLine_enabled = 1


""" Ctrlp funky
nnoremap gp :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap gP :execute 'CtrlPFunky ' . expand('<cword>')<Cr>


""" Easy tags
:set tags=./tags;
:let g:easytags_dynamic_files = 2


autocmd FileType python,sh,mongoql,matlab,w3m,perl noremap <buffer> ,pp <esc>_Daprint("<esc>pa", <esc>pa)<esc>

""" SIDEWAYS
" nnoremap ,ah :SidewaysLeft<cr>
" nnoremap ,al :SidewaysRight<cr>
nnoremap ,a vip:s/^/"/g<cr>vip:s/$/",/g<cr>vip:s/\n/ /g<cr>$xx0C[]<esc>P/aaaaa<cr>0
nmap ,A :s/ /\r/g<cr>,a

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

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

""" Tmux
" let g:tmux_navigator_no_mappings = 1
" let g:tmux_navigator_save_on_switch = 1
" " nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
" " nnoremap <silent> <c-h> <c-w>h
" nunmap <c-h>
" nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
" nnoremap <silent> <c-d> :TmuxNavigateLeft<cr>
" nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
" nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
" nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

nnoremap gh :bN<cr>
nnoremap gl :bn<cr>
nnoremap gW :bd<cr>:syn on<cr>
nnoremap gw :bN<cr>:bd #<cr>


"" UNICODE
" au BufNewFile,BufRead *.md set filetype=md
nmap gu <Plug>(UnicodeGA)
" imap <C-X><C-u> <Plug>(DigraphComplete)
" imap *& *<esc>viW<Plug>(MakeDigraph)a
autocmd FileType julia,text,markdown,vim imap <buffer> <c-u> *<esc>vh<Plug>(MakeDigraph)a
autocmd FileType julia,text,markdown,vim imap <buffer> <c-d> <esc>vh<Plug>(MakeDigraph)a
" autocmd FileType julia,text,markdown imap <buffer> i <esc>vh<Plug>(MakeDigraph)a

" """ MATH
" imap <silent> m <c-o>:if &kmp == ""<bar>
"       \set kmp=math<bar>
"       \else<bar>
"       \set kmp=<bar>
"       \endif<bar>
"       \echo "kmp<".&kmp.">"<cr>
" nmap <silent> m :if &kmp == ""<bar>
"       \set kmp=math<bar>
"       \else<bar>
"       \set kmp=<bar>
"       \endif<bar>


""" JULIA
autocmd FileType julia nmap <buffer> ,t :call Pinfo("typeof")<cr><cr>
autocmd FileType julia nmap <buffer> ,s :call Pinfo("size")<cr><cr>
autocmd FileType julia nmap <buffer> ,l :call Pinfo("length")<cr><cr>
autocmd FileType julia nmap <buffer> ,h :call Pinfo("head")<cr><cr>
autocmd FileType julia nmap <buffer> ,v :call Pinfo("")<cr><cr>
function! Pinfo(func)
  let wordUnderCursor = expand("<cword>")
  echo wordUnderCursor
  :exe ":!tmux send-keys -t 2 '".a:func."(".wordUnderCursor.")' Enter"
endfunction
autocmd FileType julia noremap <buffer> ,pp <esc>_Daprintln("<esc>pa", <esc>pa)<esc>

" GREEK
" Letter   Name   Sound
" Ancient[5]   Modern[6]
" Α α α  A alpha, άλφα   [a] [aː]   [a]
" Β β β  B beta, βήτα   [b]   [v]
" Γ γ γ  G gamma, γάμμα   [ɡ], [ŋ][7]   [ɣ] ~ [ʝ], [ŋ] ~ [ɲ][9]
" Δ δ δ  D delta, δέλτα   [d]   [ð]
" Ε ε ε  E epsilon, έψιλον   [e]   [e]
" Ζ ζ ζ  Z zeta, ζήτα   [zd]A   [z]
" Η η η  Y eta, ήτα   [ɛː]   [i]
" Θ θ θ  H theta, θήτα   [tʰ]   [θ]
" Ι ι ι  I iota, ιώτα   [i] [iː]   [i], [ʝ],[10] [ɲ][11]
" Κ κ κ  K kappa, κάππα   [k]   [k] ~ [c]
" Λ λ λ  L lambda, λάμδα   [l]   [l]
" Μ μ μ  M mu, μυ   [m]   [m]
" Ν ν ν  N nu, νυ   [n]   [n]
" Ξ ξ ξ  C xi, ξι   [ks]   [ks]
" Ο ο ο  O omicron, όμικρον   [o]   [o]
" Π π π  P pi, πι   [p]   [p]
" Ρ ρ ρ  R rho, ρώ   [r]   [r]
" Σ σ σ  S sigma, σίγμα   [s]   [s] ~ [z]
" Τ τ τ  T tau, ταυ   [t]   [t]
" Υ υ υ  U upsilon, ύψιλον   [y] [yː]   [i]
" Φ φ φ  F phi, φι   [pʰ]   [f]
" Χ χ χ  X chi, χι   [kʰ]   [x] ~ [ç]
" Ψ ψ ψ  Q psi, ψι   [ps]   [ps]
" Ω ω ω  W omega, ωμέγα   [ɔː]   [o]<Paste>
"     ϊ  J
"    ϋ  V

" DIGRAPH
" ≥ >=
" ≤ =<
" ≠ !=
" ‡ /=
" ∧ AN
" ∨ OR
" ² 2S
" ₂ 2s
" √ RT
" ø o/
" Ø O/
" є ie

" " JULIA latex
" Code point(s) 	Character(s) 	Tab completion sequence(s) 	Unicode name(s)
" U+000A1 	¡ 	\textexclamdown 	INVERTED EXCLAMATION MARK
" U+000A3 	£ 	\sterling 	POUND SIGN
" U+000A5 	¥ 	\yen 	YEN SIGN
" U+000A6 	¦ 	\textbrokenbar 	BROKEN BAR / BROKEN VERTICAL BAR
" U+000A7 	§ 	\S 	SECTION SIGN
" U+000A8 	¨ 	\textasciidieresis 	DIAERESIS / SPACING DIAERESIS
" U+000A9 	© 	\copyright, \:copyright: 	COPYRIGHT SIGN
" U+000AA 	ª 	\textordfeminine 	FEMININE ORDINAL INDICATOR
" U+000AC 	¬ 	\neg 	NOT SIGN
" U+000AE 	® 	\circledR, \:registered: 	REGISTERED SIGN / REGISTERED TRADE MARK SIGN
" U+000AF 	¯ 	\textasciimacron 	MACRON / SPACING MACRON
" U+000B0 	° 	\degree 	DEGREE SIGN
" U+000B1 	± 	\pm 	PLUS-MINUS SIGN / PLUS-OR-MINUS SIGN
" U+000B2 	² 	\^2 	SUPERSCRIPT TWO / SUPERSCRIPT DIGIT TWO
" U+000B3 	³ 	\^3 	SUPERSCRIPT THREE / SUPERSCRIPT DIGIT THREE
" U+000B4 	´ 	\textasciiacute 	ACUTE ACCENT / SPACING ACUTE
" U+000B6 	¶ 	\P 	PILCROW SIGN / PARAGRAPH SIGN
" U+000B7 	· 	\cdotp 	MIDDLE DOT
" U+000B9 	¹ 	\^1 	SUPERSCRIPT ONE / SUPERSCRIPT DIGIT ONE
" U+000BA 	º 	\textordmasculine 	MASCULINE ORDINAL INDICATOR
" U+000BC 	¼ 	\textonequarter 	VULGAR FRACTION ONE QUARTER / FRACTION ONE QUARTER
" U+000BD 	½ 	\textonehalf 	VULGAR FRACTION ONE HALF / FRACTION ONE HALF
" U+000BE 	¾ 	\textthreequarters 	VULGAR FRACTION THREE QUARTERS / FRACTION THREE QUARTERS
" U+000BF 	¿ 	\textquestiondown 	INVERTED QUESTION MARK
" U+000C5 	Å 	\AA 	LATIN CAPITAL LETTER A WITH RING ABOVE / LATIN CAPITAL LETTER A RING
" U+000C6 	Æ 	\AE 	LATIN CAPITAL LETTER AE / LATIN CAPITAL LETTER A E
" U+000D0 	Ð 	\DH 	LATIN CAPITAL LETTER ETH
" U+000D7 	× 	\times 	MULTIPLICATION SIGN
" U+000D8 	Ø 	\O 	LATIN CAPITAL LETTER O WITH STROKE / LATIN CAPITAL LETTER O SLASH
" U+000DE 	Þ 	\TH 	LATIN CAPITAL LETTER THORN
" U+000DF 	ß 	\ss 	LATIN SMALL LETTER SHARP S
" U+000E5 	å 	\aa 	LATIN SMALL LETTER A WITH RING ABOVE / LATIN SMALL LETTER A RING
" U+000E6 	æ 	\ae 	LATIN SMALL LETTER AE / LATIN SMALL LETTER A E
" U+000F0 	ð 	\eth 	LATIN SMALL LETTER ETH
" U+000F7 	÷ 	\div 	DIVISION SIGN
" U+000F8 	ø 	\o 	LATIN SMALL LETTER O WITH STROKE / LATIN SMALL LETTER O SLASH
" U+000FE 	þ 	\th 	LATIN SMALL LETTER THORN
" U+00110 	Đ 	\DJ 	LATIN CAPITAL LETTER D WITH STROKE / LATIN CAPITAL LETTER D BAR
" U+00111 	đ 	\dj 	LATIN SMALL LETTER D WITH STROKE / LATIN SMALL LETTER D BAR
" U+00127 	ħ 	\Elzxh, \hbar 	LATIN SMALL LETTER H WITH STROKE / LATIN SMALL LETTER H BAR
" U+00141 	Ł 	\L 	LATIN CAPITAL LETTER L WITH STROKE / LATIN CAPITAL LETTER L SLASH
" U+00142 	ł 	\l 	LATIN SMALL LETTER L WITH STROKE / LATIN SMALL LETTER L SLASH
" U+0014A 	Ŋ 	\NG 	LATIN CAPITAL LETTER ENG
" U+0014B 	ŋ 	\ng 	LATIN SMALL LETTER ENG
" U+00152 	Œ 	\OE 	LATIN CAPITAL LIGATURE OE / LATIN CAPITAL LETTER O E
" U+00153 	œ 	\oe 	LATIN SMALL LIGATURE OE / LATIN SMALL LETTER O E
" U+00195 	ƕ 	\texthvlig 	LATIN SMALL LETTER HV / LATIN SMALL LETTER H V
" U+0019E 	ƞ 	\textnrleg 	LATIN SMALL LETTER N WITH LONG RIGHT LEG
" U+001B5 	Ƶ 	\Zbar 	LATIN CAPITAL LETTER Z WITH STROKE / LATIN CAPITAL LETTER Z BAR
" U+001C2 	ǂ 	\textdoublepipe 	LATIN LETTER ALVEOLAR CLICK / LATIN LETTER PIPE DOUBLE BAR
" U+00250 	ɐ 	\Elztrna 	LATIN SMALL LETTER TURNED A
" U+00252 	ɒ 	\Elztrnsa 	LATIN SMALL LETTER TURNED ALPHA / LATIN SMALL LETTER TURNED SCRIPT A
" U+00254 	ɔ 	\Elzopeno 	LATIN SMALL LETTER OPEN O
" U+00256 	ɖ 	\Elzrtld 	LATIN SMALL LETTER D WITH TAIL / LATIN SMALL LETTER D RETROFLEX HOOK
" U+00259 	ə 	\Elzschwa 	LATIN SMALL LETTER SCHWA
" U+0025B 	ɛ 	\varepsilon 	LATIN SMALL LETTER OPEN E / LATIN SMALL LETTER EPSILON
" U+00263 	ɣ 	\Elzpgamma 	LATIN SMALL LETTER GAMMA
" U+00264 	ɤ 	\Elzpbgam 	LATIN SMALL LETTER RAMS HORN / LATIN SMALL LETTER BABY GAMMA
" U+00265 	ɥ 	\Elztrnh 	LATIN SMALL LETTER TURNED H
" U+0026C 	ɬ 	\Elzbtdl 	LATIN SMALL LETTER L WITH BELT / LATIN SMALL LETTER L BELT
" U+0026D 	ɭ 	\Elzrtll 	LATIN SMALL LETTER L WITH RETROFLEX HOOK / LATIN SMALL LETTER L RETROFLEX HOOK
" U+0026F 	ɯ 	\Elztrnm 	LATIN SMALL LETTER TURNED M
" U+00270 	ɰ 	\Elztrnmlr 	LATIN SMALL LETTER TURNED M WITH LONG LEG
" U+00271 	ɱ 	\Elzltlmr 	LATIN SMALL LETTER M WITH HOOK / LATIN SMALL LETTER M HOOK
" U+00272 	ɲ 	\Elzltln 	LATIN SMALL LETTER N WITH LEFT HOOK / LATIN SMALL LETTER N HOOK
" U+00273 	ɳ 	\Elzrtln 	LATIN SMALL LETTER N WITH RETROFLEX HOOK / LATIN SMALL LETTER N RETROFLEX HOOK
" U+00277 	ɷ 	\Elzclomeg 	LATIN SMALL LETTER CLOSED OMEGA
" U+00278 	ɸ 	\textphi 	LATIN SMALL LETTER PHI
" U+00279 	ɹ 	\Elztrnr 	LATIN SMALL LETTER TURNED R
" U+0027A 	ɺ 	\Elztrnrl 	LATIN SMALL LETTER TURNED R WITH LONG LEG
" U+0027B 	ɻ 	\Elzrttrnr 	LATIN SMALL LETTER TURNED R WITH HOOK / LATIN SMALL LETTER TURNED R HOOK
" U+0027C 	ɼ 	\Elzrl 	LATIN SMALL LETTER R WITH LONG LEG
" U+0027D 	ɽ 	\Elzrtlr 	LATIN SMALL LETTER R WITH TAIL / LATIN SMALL LETTER R HOOK
" U+0027E 	ɾ 	\Elzfhr 	LATIN SMALL LETTER R WITH FISHHOOK / LATIN SMALL LETTER FISHHOOK R
" U+00282 	ʂ 	\Elzrtls 	LATIN SMALL LETTER S WITH HOOK / LATIN SMALL LETTER S HOOK
" U+00283 	ʃ 	\Elzesh 	LATIN SMALL LETTER ESH
" U+00287 	ʇ 	\Elztrnt 	LATIN SMALL LETTER TURNED T
" U+00288 	ʈ 	\Elzrtlt 	LATIN SMALL LETTER T WITH RETROFLEX HOOK / LATIN SMALL LETTER T RETROFLEX HOOK
" U+0028A 	ʊ 	\Elzpupsil 	LATIN SMALL LETTER UPSILON
" U+0028B 	ʋ 	\Elzpscrv 	LATIN SMALL LETTER V WITH HOOK / LATIN SMALL LETTER SCRIPT V
" U+0028C 	ʌ 	\Elzinvv 	LATIN SMALL LETTER TURNED V
" U+0028D 	ʍ 	\Elzinvw 	LATIN SMALL LETTER TURNED W
" U+0028E 	ʎ 	\Elztrny 	LATIN SMALL LETTER TURNED Y
" U+00290 	ʐ 	\Elzrtlz 	LATIN SMALL LETTER Z WITH RETROFLEX HOOK / LATIN SMALL LETTER Z RETROFLEX HOOK
" U+00292 	ʒ 	\Elzyogh 	LATIN SMALL LETTER EZH / LATIN SMALL LETTER YOGH
" U+00294 	ʔ 	\Elzglst 	LATIN LETTER GLOTTAL STOP
" U+00295 	ʕ 	\Elzreglst 	LATIN LETTER PHARYNGEAL VOICED FRICATIVE / LATIN LETTER REVERSED GLOTTAL STOP
" U+00296 	ʖ 	\Elzinglst 	LATIN LETTER INVERTED GLOTTAL STOP
" U+0029E 	ʞ 	\textturnk 	LATIN SMALL LETTER TURNED K
" U+002A4 	ʤ 	\Elzdyogh 	LATIN SMALL LETTER DEZH DIGRAPH / LATIN SMALL LETTER D YOGH
" U+002A7 	ʧ 	\Elztesh 	LATIN SMALL LETTER TESH DIGRAPH / LATIN SMALL LETTER T ESH
" U+002B0 	ʰ 	\^h 	MODIFIER LETTER SMALL H
" U+002B2 	ʲ 	\^j 	MODIFIER LETTER SMALL J
" U+002B3 	ʳ 	\^r 	MODIFIER LETTER SMALL R
" U+002B7 	ʷ 	\^w 	MODIFIER LETTER SMALL W
" U+002B8 	ʸ 	\^y 	MODIFIER LETTER SMALL Y
" U+002BC 	ʼ 	\rasp 	MODIFIER LETTER APOSTROPHE
" U+002C7 	ˇ 	\textasciicaron 	CARON / MODIFIER LETTER HACEK
" U+002C8 	ˈ 	\Elzverts 	MODIFIER LETTER VERTICAL LINE
" U+002CC 	ˌ 	\Elzverti 	MODIFIER LETTER LOW VERTICAL LINE
" U+002D0 	ː 	\Elzlmrk 	MODIFIER LETTER TRIANGULAR COLON
" U+002D1 	ˑ 	\Elzhlmrk 	MODIFIER LETTER HALF TRIANGULAR COLON
" U+002D2 	˒ 	\Elzsbrhr 	MODIFIER LETTER CENTRED RIGHT HALF RING / MODIFIER LETTER CENTERED RIGHT HALF RING
" U+002D3 	˓ 	\Elzsblhr 	MODIFIER LETTER CENTRED LEFT HALF RING / MODIFIER LETTER CENTERED LEFT HALF RING
" U+002D4 	˔ 	\Elzrais 	MODIFIER LETTER UP TACK
" U+002D5 	˕ 	\Elzlow 	MODIFIER LETTER DOWN TACK
" U+002D8 	˘ 	\u 	BREVE / SPACING BREVE
" U+002DC 	˜ 	\texttildelow 	SMALL TILDE / SPACING TILDE
" U+002E1 	ˡ 	\^l 	MODIFIER LETTER SMALL L
" U+002E2 	ˢ 	\^s 	MODIFIER LETTER SMALL S
" U+002E3 	ˣ 	\^x 	MODIFIER LETTER SMALL X
" U+00300 	  	\grave 	COMBINING GRAVE ACCENT / NON-SPACING GRAVE
" U+00301 	  	\acute 	COMBINING ACUTE ACCENT / NON-SPACING ACUTE
" U+00302 	  	\hat 	COMBINING CIRCUMFLEX ACCENT / NON-SPACING CIRCUMFLEX
" U+00303 	  	\tilde 	COMBINING TILDE / NON-SPACING TILDE
" U+00304 	  	\bar 	COMBINING MACRON / NON-SPACING MACRON
" U+00305 	  	\overbar 	COMBINING OVERLINE / NON-SPACING OVERSCORE
" U+00306 	  	\breve 	COMBINING BREVE / NON-SPACING BREVE
" U+00307 	  	\dot 	COMBINING DOT ABOVE / NON-SPACING DOT ABOVE
" U+00308 	  	\ddot 	COMBINING DIAERESIS / NON-SPACING DIAERESIS
" U+00309 	  	\ovhook 	COMBINING HOOK ABOVE / NON-SPACING HOOK ABOVE
" U+0030A 	  	\ocirc 	COMBINING RING ABOVE / NON-SPACING RING ABOVE
" U+0030B 	  	\H 	COMBINING DOUBLE ACUTE ACCENT / NON-SPACING DOUBLE ACUTE
" U+0030C 	  	\check 	COMBINING CARON / NON-SPACING HACEK
" U+00310 	  	\candra 	COMBINING CANDRABINDU / NON-SPACING CANDRABINDU
" U+00312 	  	\oturnedcomma 	COMBINING TURNED COMMA ABOVE / NON-SPACING TURNED COMMA ABOVE
" U+00315 	  	\ocommatopright 	COMBINING COMMA ABOVE RIGHT / NON-SPACING COMMA ABOVE RIGHT
" U+0031A 	  	\droang 	COMBINING LEFT ANGLE ABOVE / NON-SPACING LEFT ANGLE ABOVE
" U+00321 	  	\Elzpalh 	COMBINING PALATALIZED HOOK BELOW / NON-SPACING PALATALIZED HOOK BELOW
" U+00322 	  	\Elzrh 	COMBINING RETROFLEX HOOK BELOW / NON-SPACING RETROFLEX HOOK BELOW
" U+00327 	  	\c 	COMBINING CEDILLA / NON-SPACING CEDILLA
" U+00328 	  	\k 	COMBINING OGONEK / NON-SPACING OGONEK
" U+0032A 	  	\Elzsbbrg 	COMBINING BRIDGE BELOW / NON-SPACING BRIDGE BELOW
" U+00330 	  	\wideutilde 	COMBINING TILDE BELOW / NON-SPACING TILDE BELOW
" U+00331 	  	\underbar 	COMBINING MACRON BELOW / NON-SPACING MACRON BELOW
" U+00335 	  	\Elzxl 	COMBINING SHORT STROKE OVERLAY / NON-SPACING SHORT BAR OVERLAY
" U+00336 	  	\Elzbar, \sout 	COMBINING LONG STROKE OVERLAY / NON-SPACING LONG BAR OVERLAY
" U+00338 	  	\not 	COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+00391 	Α 	\Alpha 	GREEK CAPITAL LETTER ALPHA
" U+00392 	Β 	\Beta 	GREEK CAPITAL LETTER BETA
" U+00393 	Γ 	\Gamma 	GREEK CAPITAL LETTER GAMMA
" U+00394 	Δ 	\Delta 	GREEK CAPITAL LETTER DELTA
" U+00395 	Ε 	\Epsilon 	GREEK CAPITAL LETTER EPSILON
" U+00396 	Ζ 	\Zeta 	GREEK CAPITAL LETTER ZETA
" U+00397 	Η 	\Eta 	GREEK CAPITAL LETTER ETA
" U+00398 	Θ 	\Theta 	GREEK CAPITAL LETTER THETA
" U+00399 	Ι 	\Iota 	GREEK CAPITAL LETTER IOTA
" U+0039A 	Κ 	\Kappa 	GREEK CAPITAL LETTER KAPPA
" U+0039B 	Λ 	\Lambda 	GREEK CAPITAL LETTER LAMDA / GREEK CAPITAL LETTER LAMBDA
" U+0039C 	Μ 	\upMu 	GREEK CAPITAL LETTER MU
" U+0039D 	Ν 	\upNu 	GREEK CAPITAL LETTER NU
" U+0039E 	Ξ 	\Xi 	GREEK CAPITAL LETTER XI
" U+0039F 	Ο 	\upOmicron 	GREEK CAPITAL LETTER OMICRON
" U+003A0 	Π 	\Pi 	GREEK CAPITAL LETTER PI
" U+003A1 	Ρ 	\Rho 	GREEK CAPITAL LETTER RHO
" U+003A3 	Σ 	\Sigma 	GREEK CAPITAL LETTER SIGMA
" U+003A4 	Τ 	\Tau 	GREEK CAPITAL LETTER TAU
" U+003A5 	Υ 	\Upsilon 	GREEK CAPITAL LETTER UPSILON
" U+003A6 	Φ 	\Phi 	GREEK CAPITAL LETTER PHI
" U+003A7 	Χ 	\Chi 	GREEK CAPITAL LETTER CHI
" U+003A8 	Ψ 	\Psi 	GREEK CAPITAL LETTER PSI
" U+003A9 	Ω 	\Omega 	GREEK CAPITAL LETTER OMEGA
" U+003B1 	α 	\alpha 	GREEK SMALL LETTER ALPHA
" U+003B2 	β 	\beta 	GREEK SMALL LETTER BETA
" U+003B3 	γ 	\gamma 	GREEK SMALL LETTER GAMMA
" U+003B4 	δ 	\delta 	GREEK SMALL LETTER DELTA
" U+003B5 	ε 	\upepsilon 	GREEK SMALL LETTER EPSILON
" U+003B6 	ζ 	\zeta 	GREEK SMALL LETTER ZETA
" U+003B7 	η 	\eta 	GREEK SMALL LETTER ETA
" U+003B8 	θ 	\theta 	GREEK SMALL LETTER THETA
" U+003B9 	ι 	\iota 	GREEK SMALL LETTER IOTA
" U+003BA 	κ 	\kappa 	GREEK SMALL LETTER KAPPA
" U+003BB 	λ 	\lambda 	GREEK SMALL LETTER LAMDA / GREEK SMALL LETTER LAMBDA
" U+003BC 	μ 	\mu 	GREEK SMALL LETTER MU
" U+003BD 	ν 	\nu 	GREEK SMALL LETTER NU
" U+003BE 	ξ 	\xi 	GREEK SMALL LETTER XI
" U+003BF 	ο 	\upomicron 	GREEK SMALL LETTER OMICRON
" U+003C0 	π 	\pi 	GREEK SMALL LETTER PI
" U+003C1 	ρ 	\rho 	GREEK SMALL LETTER RHO
" U+003C2 	ς 	\varsigma 	GREEK SMALL LETTER FINAL SIGMA
" U+003C3 	σ 	\sigma 	GREEK SMALL LETTER SIGMA
" U+003C4 	τ 	\tau 	GREEK SMALL LETTER TAU
" U+003C5 	υ 	\upsilon 	GREEK SMALL LETTER UPSILON
" U+003C6 	φ 	\varphi 	GREEK SMALL LETTER PHI
" U+003C7 	χ 	\chi 	GREEK SMALL LETTER CHI
" U+003C8 	ψ 	\psi 	GREEK SMALL LETTER PSI
" U+003C9 	ω 	\omega 	GREEK SMALL LETTER OMEGA
" U+003D0 	ϐ 	\upvarbeta 	GREEK BETA SYMBOL / GREEK SMALL LETTER CURLED BETA
" U+003D1 	ϑ 	\vartheta 	GREEK THETA SYMBOL / GREEK SMALL LETTER SCRIPT THETA
" U+003D5 	ϕ 	\phi 	GREEK PHI SYMBOL / GREEK SMALL LETTER SCRIPT PHI
" U+003D6 	ϖ 	\varpi 	GREEK PI SYMBOL / GREEK SMALL LETTER OMEGA PI
" U+003D8 	Ϙ 	\upoldKoppa 	GREEK LETTER ARCHAIC KOPPA
" U+003D9 	ϙ 	\upoldkoppa 	GREEK SMALL LETTER ARCHAIC KOPPA
" U+003DA 	Ϛ 	\Stigma 	GREEK LETTER STIGMA / GREEK CAPITAL LETTER STIGMA
" U+003DB 	ϛ 	\upstigma 	GREEK SMALL LETTER STIGMA
" U+003DC 	Ϝ 	\Digamma 	GREEK LETTER DIGAMMA / GREEK CAPITAL LETTER DIGAMMA
" U+003DD 	ϝ 	\digamma 	GREEK SMALL LETTER DIGAMMA
" U+003DE 	Ϟ 	\Koppa 	GREEK LETTER KOPPA / GREEK CAPITAL LETTER KOPPA
" U+003DF 	ϟ 	\upkoppa 	GREEK SMALL LETTER KOPPA
" U+003E0 	Ϡ 	\Sampi 	GREEK LETTER SAMPI / GREEK CAPITAL LETTER SAMPI
" U+003E1 	ϡ 	\upsampi 	GREEK SMALL LETTER SAMPI
" U+003F0 	ϰ 	\varkappa 	GREEK KAPPA SYMBOL / GREEK SMALL LETTER SCRIPT KAPPA
" U+003F1 	ϱ 	\varrho 	GREEK RHO SYMBOL / GREEK SMALL LETTER TAILED RHO
" U+003F4 	ϴ 	\textTheta 	GREEK CAPITAL THETA SYMBOL
" U+003F5 	ϵ 	\epsilon 	GREEK LUNATE EPSILON SYMBOL
" U+003F6 	϶ 	\backepsilon 	GREEK REVERSED LUNATE EPSILON SYMBOL
" U+01D2C 	ᴬ 	\^A 	MODIFIER LETTER CAPITAL A
" U+01D2E 	ᴮ 	\^B 	MODIFIER LETTER CAPITAL B
" U+01D30 	ᴰ 	\^D 	MODIFIER LETTER CAPITAL D
" U+01D31 	ᴱ 	\^E 	MODIFIER LETTER CAPITAL E
" U+01D33 	ᴳ 	\^G 	MODIFIER LETTER CAPITAL G
" U+01D34 	ᴴ 	\^H 	MODIFIER LETTER CAPITAL H
" U+01D35 	ᴵ 	\^I 	MODIFIER LETTER CAPITAL I
" U+01D36 	ᴶ 	\^J 	MODIFIER LETTER CAPITAL J
" U+01D37 	ᴷ 	\^K 	MODIFIER LETTER CAPITAL K
" U+01D38 	ᴸ 	\^L 	MODIFIER LETTER CAPITAL L
" U+01D39 	ᴹ 	\^M 	MODIFIER LETTER CAPITAL M
" U+01D3A 	ᴺ 	\^N 	MODIFIER LETTER CAPITAL N
" U+01D3C 	ᴼ 	\^O 	MODIFIER LETTER CAPITAL O
" U+01D3E 	ᴾ 	\^P 	MODIFIER LETTER CAPITAL P
" U+01D3F 	ᴿ 	\^R 	MODIFIER LETTER CAPITAL R
" U+01D40 	ᵀ 	\^T 	MODIFIER LETTER CAPITAL T
" U+01D41 	ᵁ 	\^U 	MODIFIER LETTER CAPITAL U
" U+01D42 	ᵂ 	\^W 	MODIFIER LETTER CAPITAL W
" U+01D43 	ᵃ 	\^a 	MODIFIER LETTER SMALL A
" U+01D45 	ᵅ 	\^alpha 	MODIFIER LETTER SMALL ALPHA
" U+01D47 	ᵇ 	\^b 	MODIFIER LETTER SMALL B
" U+01D48 	ᵈ 	\^d 	MODIFIER LETTER SMALL D
" U+01D49 	ᵉ 	\^e 	MODIFIER LETTER SMALL E
" U+01D4B 	ᵋ 	\^epsilon 	MODIFIER LETTER SMALL OPEN E
" U+01D4D 	ᵍ 	\^g 	MODIFIER LETTER SMALL G
" U+01D4F 	ᵏ 	\^k 	MODIFIER LETTER SMALL K
" U+01D50 	ᵐ 	\^m 	MODIFIER LETTER SMALL M
" U+01D52 	ᵒ 	\^o 	MODIFIER LETTER SMALL O
" U+01D56 	ᵖ 	\^p 	MODIFIER LETTER SMALL P
" U+01D57 	ᵗ 	\^t 	MODIFIER LETTER SMALL T
" U+01D58 	ᵘ 	\^u 	MODIFIER LETTER SMALL U
" U+01D5B 	ᵛ 	\^v 	MODIFIER LETTER SMALL V
" U+01D5D 	ᵝ 	\^beta 	MODIFIER LETTER SMALL BETA
" U+01D5E 	ᵞ 	\^gamma 	MODIFIER LETTER SMALL GREEK GAMMA
" U+01D5F 	ᵟ 	\^delta 	MODIFIER LETTER SMALL DELTA
" U+01D60 	ᵠ 	\^phi 	MODIFIER LETTER SMALL GREEK PHI
" U+01D61 	ᵡ 	\^chi 	MODIFIER LETTER SMALL CHI
" U+01D62 	ᵢ 	\_i 	LATIN SUBSCRIPT SMALL LETTER I
" U+01D63 	ᵣ 	\_r 	LATIN SUBSCRIPT SMALL LETTER R
" U+01D64 	ᵤ 	\_u 	LATIN SUBSCRIPT SMALL LETTER U
" U+01D65 	ᵥ 	\_v 	LATIN SUBSCRIPT SMALL LETTER V
" U+01D66 	ᵦ 	\_beta 	GREEK SUBSCRIPT SMALL LETTER BETA
" U+01D67 	ᵧ 	\_gamma 	GREEK SUBSCRIPT SMALL LETTER GAMMA
" U+01D68 	ᵨ 	\_rho 	GREEK SUBSCRIPT SMALL LETTER RHO
" U+01D69 	ᵩ 	\_phi 	GREEK SUBSCRIPT SMALL LETTER PHI
" U+01D6A 	ᵪ 	\_chi 	GREEK SUBSCRIPT SMALL LETTER CHI
" U+01D9C 	ᶜ 	\^c 	MODIFIER LETTER SMALL C
" U+01DA0 	ᶠ 	\^f 	MODIFIER LETTER SMALL F
" U+01DA5 	ᶥ 	\^iota 	MODIFIER LETTER SMALL IOTA
" U+01DB2 	ᶲ 	\^Phi 	MODIFIER LETTER SMALL PHI
" U+01DBB 	ᶻ 	\^z 	MODIFIER LETTER SMALL Z
" U+01DBF 	ᶿ 	\^theta 	MODIFIER LETTER SMALL THETA
" U+02002 	  	\enspace 	EN SPACE
" U+02003 	  	\quad 	EM SPACE
" U+02005 	  	\thickspace 	FOUR-PER-EM SPACE
" U+02009 	  	\thinspace 	THIN SPACE
" U+0200A 	  	\hspace 	HAIR SPACE
" U+02013 	– 	\endash 	EN DASH
" U+02014 	— 	\emdash 	EM DASH
" U+02016 	‖ 	\Vert 	DOUBLE VERTICAL LINE / DOUBLE VERTICAL BAR
" U+02018 	‘ 	\lq 	LEFT SINGLE QUOTATION MARK / SINGLE TURNED COMMA QUOTATION MARK
" U+02019 	’ 	\rq 	RIGHT SINGLE QUOTATION MARK / SINGLE COMMA QUOTATION MARK
" U+0201B 	‛ 	\Elzreapos 	SINGLE HIGH-REVERSED-9 QUOTATION MARK / SINGLE REVERSED COMMA QUOTATION MARK
" U+0201C 	“ 	\textquotedblleft 	LEFT DOUBLE QUOTATION MARK / DOUBLE TURNED COMMA QUOTATION MARK
" U+0201D 	” 	\textquotedblright 	RIGHT DOUBLE QUOTATION MARK / DOUBLE COMMA QUOTATION MARK
" U+02020 	† 	\dagger 	DAGGER
" U+02021 	‡ 	\ddagger 	DOUBLE DAGGER
" U+02022

" 	\bullet 	BULLET
" U+02026 	… 	\dots 	HORIZONTAL ELLIPSIS
" U+02030 	‰ 	\textperthousand 	PER MILLE SIGN
" U+02031 	‱ 	\textpertenthousand 	PER TEN THOUSAND SIGN
" U+02032 	′ 	\prime 	PRIME
" U+02033 	″ 	\pprime 	DOUBLE PRIME
" U+02034 	‴ 	\ppprime 	TRIPLE PRIME
" U+02035 	‵ 	\backprime 	REVERSED PRIME
" U+02036 	‶ 	\backpprime 	REVERSED DOUBLE PRIME
" U+02037 	‷ 	\backppprime 	REVERSED TRIPLE PRIME
" U+02039 	‹ 	\guilsinglleft 	SINGLE LEFT-POINTING ANGLE QUOTATION MARK / LEFT POINTING SINGLE GUILLEMET
" U+0203A 	› 	\guilsinglright 	SINGLE RIGHT-POINTING ANGLE QUOTATION MARK / RIGHT POINTING SINGLE GUILLEMET
" U+0203C 	‼ 	\:bangbang: 	DOUBLE EXCLAMATION MARK
" U+02040 	⁀ 	\tieconcat 	CHARACTER TIE
" U+02049 	⁉ 	\:interrobang: 	EXCLAMATION QUESTION MARK
" U+02057 	⁗ 	\pppprime 	QUADRUPLE PRIME
" U+02060 	⁠ 	\nolinebreak 	WORD JOINER
" U+02070 	⁰ 	\^0 	SUPERSCRIPT ZERO / SUPERSCRIPT DIGIT ZERO
" U+02071 	ⁱ 	\^i 	SUPERSCRIPT LATIN SMALL LETTER I
" U+02074 	⁴ 	\^4 	SUPERSCRIPT FOUR / SUPERSCRIPT DIGIT FOUR
" U+02075 	⁵ 	\^5 	SUPERSCRIPT FIVE / SUPERSCRIPT DIGIT FIVE
" U+02076 	⁶ 	\^6 	SUPERSCRIPT SIX / SUPERSCRIPT DIGIT SIX
" U+02077 	⁷ 	\^7 	SUPERSCRIPT SEVEN / SUPERSCRIPT DIGIT SEVEN
" U+02078 	⁸ 	\^8 	SUPERSCRIPT EIGHT / SUPERSCRIPT DIGIT EIGHT
" U+02079 	⁹ 	\^9 	SUPERSCRIPT NINE / SUPERSCRIPT DIGIT NINE
" U+0207A 	⁺ 	\^+ 	SUPERSCRIPT PLUS SIGN
" U+0207B 	⁻ 	\^- 	SUPERSCRIPT MINUS / SUPERSCRIPT HYPHEN-MINUS
" U+0207C 	⁼ 	\^= 	SUPERSCRIPT EQUALS SIGN
" U+0207D 	⁽ 	\^( 	SUPERSCRIPT LEFT PARENTHESIS / SUPERSCRIPT OPENING PARENTHESIS
" U+0207E 	⁾ 	\^) 	SUPERSCRIPT RIGHT PARENTHESIS / SUPERSCRIPT CLOSING PARENTHESIS
" U+0207F 	ⁿ 	\^n 	SUPERSCRIPT LATIN SMALL LETTER N
" U+02080 	₀ 	\_0 	SUBSCRIPT ZERO / SUBSCRIPT DIGIT ZERO
" U+02081 	₁ 	\_1 	SUBSCRIPT ONE / SUBSCRIPT DIGIT ONE
" U+02082 	₂ 	\_2 	SUBSCRIPT TWO / SUBSCRIPT DIGIT TWO
" U+02083 	₃ 	\_3 	SUBSCRIPT THREE / SUBSCRIPT DIGIT THREE
" U+02084 	₄ 	\_4 	SUBSCRIPT FOUR / SUBSCRIPT DIGIT FOUR
" U+02085 	₅ 	\_5 	SUBSCRIPT FIVE / SUBSCRIPT DIGIT FIVE
" U+02086 	₆ 	\_6 	SUBSCRIPT SIX / SUBSCRIPT DIGIT SIX
" U+02087 	₇ 	\_7 	SUBSCRIPT SEVEN / SUBSCRIPT DIGIT SEVEN
" U+02088 	₈ 	\_8 	SUBSCRIPT EIGHT / SUBSCRIPT DIGIT EIGHT
" U+02089 	₉ 	\_9 	SUBSCRIPT NINE / SUBSCRIPT DIGIT NINE
" U+0208A 	₊ 	\_+ 	SUBSCRIPT PLUS SIGN
" U+0208B 	₋ 	\_- 	SUBSCRIPT MINUS / SUBSCRIPT HYPHEN-MINUS
" U+0208C 	₌ 	\_= 	SUBSCRIPT EQUALS SIGN
" U+0208D 	₍ 	\_( 	SUBSCRIPT LEFT PARENTHESIS / SUBSCRIPT OPENING PARENTHESIS
" U+0208E 	₎ 	\_) 	SUBSCRIPT RIGHT PARENTHESIS / SUBSCRIPT CLOSING PARENTHESIS
" U+02090 	ₐ 	\_a 	LATIN SUBSCRIPT SMALL LETTER A
" U+02091 	ₑ 	\_e 	LATIN SUBSCRIPT SMALL LETTER E
" U+02092 	ₒ 	\_o 	LATIN SUBSCRIPT SMALL LETTER O
" U+02093 	ₓ 	\_x 	LATIN SUBSCRIPT SMALL LETTER X
" U+02094 	ₔ 	\_schwa 	LATIN SUBSCRIPT SMALL LETTER SCHWA
" U+02095 	ₕ 	\_h 	LATIN SUBSCRIPT SMALL LETTER H
" U+02096 	ₖ 	\_k 	LATIN SUBSCRIPT SMALL LETTER K
" U+02097 	ₗ 	\_l 	LATIN SUBSCRIPT SMALL LETTER L
" U+02098 	ₘ 	\_m 	LATIN SUBSCRIPT SMALL LETTER M
" U+02099 	ₙ 	\_n 	LATIN SUBSCRIPT SMALL LETTER N
" U+0209A 	ₚ 	\_p 	LATIN SUBSCRIPT SMALL LETTER P
" U+0209B 	ₛ 	\_s 	LATIN SUBSCRIPT SMALL LETTER S
" U+0209C 	ₜ 	\_t 	LATIN SUBSCRIPT SMALL LETTER T
" U+020A7 	₧ 	\Elzpes 	PESETA SIGN
" U+020AC 	€ 	\euro 	EURO SIGN
" U+020D0 	  	\leftharpoonaccent 	COMBINING LEFT HARPOON ABOVE / NON-SPACING LEFT HARPOON ABOVE
" U+020D1 	  	\rightharpoonaccent 	COMBINING RIGHT HARPOON ABOVE / NON-SPACING RIGHT HARPOON ABOVE
" U+020D2 	  	\vertoverlay 	COMBINING LONG VERTICAL LINE OVERLAY / NON-SPACING LONG VERTICAL BAR OVERLAY
" U+020D6 	  	\overleftarrow 	COMBINING LEFT ARROW ABOVE / NON-SPACING LEFT ARROW ABOVE
" U+020D7 	  	\vec 	COMBINING RIGHT ARROW ABOVE / NON-SPACING RIGHT ARROW ABOVE
" U+020DB 	  	\dddot 	COMBINING THREE DOTS ABOVE / NON-SPACING THREE DOTS ABOVE
" U+020DC 	  	\ddddot 	COMBINING FOUR DOTS ABOVE / NON-SPACING FOUR DOTS ABOVE
" U+020DD 	⃝ 	\enclosecircle 	COMBINING ENCLOSING CIRCLE / ENCLOSING CIRCLE
" U+020DE 	⃞ 	\enclosesquare 	COMBINING ENCLOSING SQUARE / ENCLOSING SQUARE
" U+020DF 	⃟ 	\enclosediamond 	COMBINING ENCLOSING DIAMOND / ENCLOSING DIAMOND
" U+020E1 	  	\overleftrightarrow 	COMBINING LEFT RIGHT ARROW ABOVE / NON-SPACING LEFT RIGHT ARROW ABOVE
" U+020E4 	⃤ 	\enclosetriangle 	COMBINING ENCLOSING UPWARD POINTING TRIANGLE
" U+020E7 	  	\annuity 	COMBINING ANNUITY SYMBOL
" U+020E8 	  	\threeunderdot 	COMBINING TRIPLE UNDERDOT
" U+020E9 	  	\widebridgeabove 	COMBINING WIDE BRIDGE ABOVE
" U+020EC 	  	\underrightharpoondown 	COMBINING RIGHTWARDS HARPOON WITH BARB DOWNWARDS
" U+020ED 	  	\underleftharpoondown 	COMBINING LEFTWARDS HARPOON WITH BARB DOWNWARDS
" U+020EE 	  	\underleftarrow 	COMBINING LEFT ARROW BELOW
" U+020EF 	  	\underrightarrow 	COMBINING RIGHT ARROW BELOW
" U+020F0 	  	\asteraccent 	COMBINING ASTERISK ABOVE
" U+02102 	ℂ 	\BbbC 	DOUBLE-STRUCK CAPITAL C / DOUBLE-STRUCK C
" U+02107 	ℇ 	\Eulerconst 	EULER CONSTANT / EULERS
" U+0210A 	ℊ 	\mscrg 	SCRIPT SMALL G
" U+0210B 	ℋ 	\mscrH 	SCRIPT CAPITAL H / SCRIPT H
" U+0210C 	ℌ 	\mfrakH 	BLACK-LETTER CAPITAL H / BLACK-LETTER H
" U+0210D 	ℍ 	\BbbH 	DOUBLE-STRUCK CAPITAL H / DOUBLE-STRUCK H
" U+0210E 	ℎ 	\Planckconst 	PLANCK CONSTANT
" U+0210F 	ℏ 	\hslash 	PLANCK CONSTANT OVER TWO PI / PLANCK CONSTANT OVER 2 PI
" U+02110 	ℐ 	\mscrI 	SCRIPT CAPITAL I / SCRIPT I
" U+02111 	ℑ 	\Im 	BLACK-LETTER CAPITAL I / BLACK-LETTER I
" U+02112 	ℒ 	\mscrL 	SCRIPT CAPITAL L / SCRIPT L
" U+02113 	ℓ 	\ell 	SCRIPT SMALL L
" U+02115 	ℕ 	\BbbN 	DOUBLE-STRUCK CAPITAL N / DOUBLE-STRUCK N
" U+02116 	№ 	\textnumero 	NUMERO SIGN / NUMERO
" U+02118 	℘ 	\wp 	SCRIPT CAPITAL P / SCRIPT P
" U+02119 	ℙ 	\BbbP 	DOUBLE-STRUCK CAPITAL P / DOUBLE-STRUCK P
" U+0211A 	ℚ 	\BbbQ 	DOUBLE-STRUCK CAPITAL Q / DOUBLE-STRUCK Q
" U+0211B 	ℛ 	\mscrR 	SCRIPT CAPITAL R / SCRIPT R
" U+0211C 	ℜ 	\Re 	BLACK-LETTER CAPITAL R / BLACK-LETTER R
" U+0211D 	ℝ 	\BbbR 	DOUBLE-STRUCK CAPITAL R / DOUBLE-STRUCK R
" U+0211E 	℞ 	\Elzxrat 	PRESCRIPTION TAKE
" U+02122 	™ 	\texttrademark, \:tm: 	TRADE MARK SIGN / TRADEMARK
" U+02124 	ℤ 	\BbbZ 	DOUBLE-STRUCK CAPITAL Z / DOUBLE-STRUCK Z
" U+02127 	℧ 	\mho 	INVERTED OHM SIGN / MHO
" U+02128 	ℨ 	\mfrakZ 	BLACK-LETTER CAPITAL Z / BLACK-LETTER Z
" U+02129 	℩ 	\turnediota 	TURNED GREEK SMALL LETTER IOTA
" U+0212B 	Å 	\Angstrom 	ANGSTROM SIGN / ANGSTROM UNIT
" U+0212C 	ℬ 	\mscrB 	SCRIPT CAPITAL B / SCRIPT B
" U+0212D 	ℭ 	\mfrakC 	BLACK-LETTER CAPITAL C / BLACK-LETTER C
" U+0212F 	ℯ 	\mscre 	SCRIPT SMALL E
" U+02130 	ℰ 	\mscrE 	SCRIPT CAPITAL E / SCRIPT E
" U+02131 	ℱ 	\mscrF 	SCRIPT CAPITAL F / SCRIPT F
" U+02132 	Ⅎ 	\Finv 	TURNED CAPITAL F / TURNED F
" U+02133 	ℳ 	\mscrM 	SCRIPT CAPITAL M / SCRIPT M
" U+02134 	ℴ 	\mscro 	SCRIPT SMALL O
" U+02135 	ℵ 	\aleph 	ALEF SYMBOL / FIRST TRANSFINITE CARDINAL
" U+02136 	ℶ 	\beth 	BET SYMBOL / SECOND TRANSFINITE CARDINAL
" U+02137 	ℷ 	\gimel 	GIMEL SYMBOL / THIRD TRANSFINITE CARDINAL
" U+02138 	ℸ 	\daleth 	DALET SYMBOL / FOURTH TRANSFINITE CARDINAL
" U+02139 	ℹ 	\:information_source: 	INFORMATION SOURCE
" U+0213C 	ℼ 	\Bbbpi 	DOUBLE-STRUCK SMALL PI
" U+0213D 	ℽ 	\Bbbgamma 	DOUBLE-STRUCK SMALL GAMMA
" U+0213E 	ℾ 	\BbbGamma 	DOUBLE-STRUCK CAPITAL GAMMA
" U+0213F 	ℿ 	\BbbPi 	DOUBLE-STRUCK CAPITAL PI
" U+02140 	⅀ 	\bbsum 	DOUBLE-STRUCK N-ARY SUMMATION
" U+02141 	⅁ 	\Game 	TURNED SANS-SERIF CAPITAL G
" U+02142 	⅂ 	\sansLturned 	TURNED SANS-SERIF CAPITAL L
" U+02143 	⅃ 	\sansLmirrored 	REVERSED SANS-SERIF CAPITAL L
" U+02144 	⅄ 	\Yup 	TURNED SANS-SERIF CAPITAL Y
" U+02145 	ⅅ 	\mitBbbD 	DOUBLE-STRUCK ITALIC CAPITAL D
" U+02146 	ⅆ 	\mitBbbd 	DOUBLE-STRUCK ITALIC SMALL D
" U+02147 	ⅇ 	\mitBbbe 	DOUBLE-STRUCK ITALIC SMALL E
" U+02148 	ⅈ 	\mitBbbi 	DOUBLE-STRUCK ITALIC SMALL I
" U+02149 	ⅉ 	\mitBbbj 	DOUBLE-STRUCK ITALIC SMALL J
" U+0214A 	⅊ 	\PropertyLine 	PROPERTY LINE
" U+0214B 	⅋ 	\upand 	TURNED AMPERSAND
" U+02190 	← 	\leftarrow 	LEFTWARDS ARROW / LEFT ARROW
" U+02191 	↑ 	\uparrow 	UPWARDS ARROW / UP ARROW
" U+02192 	→ 	\rightarrow 	RIGHTWARDS ARROW / RIGHT ARROW
" U+02193 	↓ 	\downarrow 	DOWNWARDS ARROW / DOWN ARROW
" U+02194 	↔ 	\leftrightarrow, \:left_right_arrow: 	LEFT RIGHT ARROW
" U+02195 	↕ 	\updownarrow, \:arrow_up_down: 	UP DOWN ARROW
" U+02196 	↖ 	\nwarrow, \:arrow_upper_left: 	NORTH WEST ARROW / UPPER LEFT ARROW
" U+02197 	↗ 	\nearrow, \:arrow_upper_right: 	NORTH EAST ARROW / UPPER RIGHT ARROW
" U+02198 	↘ 	\searrow, \:arrow_lower_right: 	SOUTH EAST ARROW / LOWER RIGHT ARROW
" U+02199 	↙ 	\swarrow, \:arrow_lower_left: 	SOUTH WEST ARROW / LOWER LEFT ARROW
" U+0219A 	↚ 	\nleftarrow 	LEFTWARDS ARROW WITH STROKE / LEFT ARROW WITH STROKE
" U+0219B 	↛ 	\nrightarrow 	RIGHTWARDS ARROW WITH STROKE / RIGHT ARROW WITH STROKE
" U+0219E 	↞ 	\twoheadleftarrow 	LEFTWARDS TWO HEADED ARROW / LEFT TWO HEADED ARROW
" U+0219F 	↟ 	\twoheaduparrow 	UPWARDS TWO HEADED ARROW / UP TWO HEADED ARROW
" U+021A0 	↠ 	\twoheadrightarrow 	RIGHTWARDS TWO HEADED ARROW / RIGHT TWO HEADED ARROW
" U+021A1 	↡ 	\twoheaddownarrow 	DOWNWARDS TWO HEADED ARROW / DOWN TWO HEADED ARROW
" U+021A2 	↢ 	\leftarrowtail 	LEFTWARDS ARROW WITH TAIL / LEFT ARROW WITH TAIL
" U+021A3 	↣ 	\rightarrowtail 	RIGHTWARDS ARROW WITH TAIL / RIGHT ARROW WITH TAIL
" U+021A4 	↤ 	\mapsfrom 	LEFTWARDS ARROW FROM BAR / LEFT ARROW FROM BAR
" U+021A5 	↥ 	\mapsup 	UPWARDS ARROW FROM BAR / UP ARROW FROM BAR
" U+021A6 	↦ 	\mapsto 	RIGHTWARDS ARROW FROM BAR / RIGHT ARROW FROM BAR
" U+021A7 	↧ 	\mapsdown 	DOWNWARDS ARROW FROM BAR / DOWN ARROW FROM BAR
" U+021A8 	↨ 	\updownarrowbar 	UP DOWN ARROW WITH BASE
" U+021A9 	↩ 	\hookleftarrow, \:leftwards_arrow_with_hook: 	LEFTWARDS ARROW WITH HOOK / LEFT ARROW WITH HOOK
" U+021AA 	↪ 	\hookrightarrow, \:arrow_right_hook: 	RIGHTWARDS ARROW WITH HOOK / RIGHT ARROW WITH HOOK
" U+021AB 	↫ 	\looparrowleft 	LEFTWARDS ARROW WITH LOOP / LEFT ARROW WITH LOOP
" U+021AC 	↬ 	\looparrowright 	RIGHTWARDS ARROW WITH LOOP / RIGHT ARROW WITH LOOP
" U+021AD 	↭ 	\leftrightsquigarrow 	LEFT RIGHT WAVE ARROW
" U+021AE 	↮ 	\nleftrightarrow 	LEFT RIGHT ARROW WITH STROKE
" U+021AF 	↯ 	\downzigzagarrow 	DOWNWARDS ZIGZAG ARROW / DOWN ZIGZAG ARROW
" U+021B0 	↰ 	\Lsh 	UPWARDS ARROW WITH TIP LEFTWARDS / UP ARROW WITH TIP LEFT
" U+021B1 	↱ 	\Rsh 	UPWARDS ARROW WITH TIP RIGHTWARDS / UP ARROW WITH TIP RIGHT
" U+021B2 	↲ 	\Ldsh 	DOWNWARDS ARROW WITH TIP LEFTWARDS / DOWN ARROW WITH TIP LEFT
" U+021B3 	↳ 	\Rdsh 	DOWNWARDS ARROW WITH TIP RIGHTWARDS / DOWN ARROW WITH TIP RIGHT
" U+021B4 	↴ 	\linefeed 	RIGHTWARDS ARROW WITH CORNER DOWNWARDS / RIGHT ARROW WITH CORNER DOWN
" U+021B5 	↵ 	\carriagereturn 	DOWNWARDS ARROW WITH CORNER LEFTWARDS / DOWN ARROW WITH CORNER LEFT
" U+021B6 	↶ 	\curvearrowleft 	ANTICLOCKWISE TOP SEMICIRCLE ARROW
" U+021B7 	↷ 	\curvearrowright 	CLOCKWISE TOP SEMICIRCLE ARROW
" U+021B8 	↸ 	\barovernorthwestarrow 	NORTH WEST ARROW TO LONG BAR / UPPER LEFT ARROW TO LONG BAR
" U+021B9 	↹ 	\barleftarrowrightarrowbar 	LEFTWARDS ARROW TO BAR OVER RIGHTWARDS ARROW TO BAR / LEFT ARROW TO BAR OVER RIGHT ARROW TO BAR
" U+021BA 	↺ 	\circlearrowleft 	ANTICLOCKWISE OPEN CIRCLE ARROW
" U+021BB 	↻ 	\circlearrowright 	CLOCKWISE OPEN CIRCLE ARROW
" U+021BC 	↼ 	\leftharpoonup 	LEFTWARDS HARPOON WITH BARB UPWARDS / LEFT HARPOON WITH BARB UP
" U+021BD 	↽ 	\leftharpoondown 	LEFTWARDS HARPOON WITH BARB DOWNWARDS / LEFT HARPOON WITH BARB DOWN
" U+021BE 	↾ 	\upharpoonleft 	UPWARDS HARPOON WITH BARB RIGHTWARDS / UP HARPOON WITH BARB RIGHT
" U+021BF 	↿ 	\upharpoonright 	UPWARDS HARPOON WITH BARB LEFTWARDS / UP HARPOON WITH BARB LEFT
" U+021C0 	⇀ 	\rightharpoonup 	RIGHTWARDS HARPOON WITH BARB UPWARDS / RIGHT HARPOON WITH BARB UP
" U+021C1 	⇁ 	\rightharpoondown 	RIGHTWARDS HARPOON WITH BARB DOWNWARDS / RIGHT HARPOON WITH BARB DOWN
" U+021C2 	⇂ 	\downharpoonright 	DOWNWARDS HARPOON WITH BARB RIGHTWARDS / DOWN HARPOON WITH BARB RIGHT
" U+021C3 	⇃ 	\downharpoonleft 	DOWNWARDS HARPOON WITH BARB LEFTWARDS / DOWN HARPOON WITH BARB LEFT
" U+021C4 	⇄ 	\rightleftarrows 	RIGHTWARDS ARROW OVER LEFTWARDS ARROW / RIGHT ARROW OVER LEFT ARROW
" U+021C5 	⇅ 	\dblarrowupdown 	UPWARDS ARROW LEFTWARDS OF DOWNWARDS ARROW / UP ARROW LEFT OF DOWN ARROW
" U+021C6 	⇆ 	\leftrightarrows 	LEFTWARDS ARROW OVER RIGHTWARDS ARROW / LEFT ARROW OVER RIGHT ARROW
" U+021C7 	⇇ 	\leftleftarrows 	LEFTWARDS PAIRED ARROWS / LEFT PAIRED ARROWS
" U+021C8 	⇈ 	\upuparrows 	UPWARDS PAIRED ARROWS / UP PAIRED ARROWS
" U+021C9 	⇉ 	\rightrightarrows 	RIGHTWARDS PAIRED ARROWS / RIGHT PAIRED ARROWS
" U+021CA 	⇊ 	\downdownarrows 	DOWNWARDS PAIRED ARROWS / DOWN PAIRED ARROWS
" U+021CB 	⇋ 	\leftrightharpoons 	LEFTWARDS HARPOON OVER RIGHTWARDS HARPOON / LEFT HARPOON OVER RIGHT HARPOON
" U+021CC 	⇌ 	\rightleftharpoons 	RIGHTWARDS HARPOON OVER LEFTWARDS HARPOON / RIGHT HARPOON OVER LEFT HARPOON
" U+021CD 	⇍ 	\nLeftarrow 	LEFTWARDS DOUBLE ARROW WITH STROKE / LEFT DOUBLE ARROW WITH STROKE
" U+021CE 	⇎ 	\nLeftrightarrow 	LEFT RIGHT DOUBLE ARROW WITH STROKE
" U+021CF 	⇏ 	\nRightarrow 	RIGHTWARDS DOUBLE ARROW WITH STROKE / RIGHT DOUBLE ARROW WITH STROKE
" U+021D0 	⇐ 	\Leftarrow 	LEFTWARDS DOUBLE ARROW / LEFT DOUBLE ARROW
" U+021D1 	⇑ 	\Uparrow 	UPWARDS DOUBLE ARROW / UP DOUBLE ARROW
" U+021D2 	⇒ 	\Rightarrow 	RIGHTWARDS DOUBLE ARROW / RIGHT DOUBLE ARROW
" U+021D3 	⇓ 	\Downarrow 	DOWNWARDS DOUBLE ARROW / DOWN DOUBLE ARROW
" U+021D4 	⇔ 	\Leftrightarrow 	LEFT RIGHT DOUBLE ARROW
" U+021D5 	⇕ 	\Updownarrow 	UP DOWN DOUBLE ARROW
" U+021D6 	⇖ 	\Nwarrow 	NORTH WEST DOUBLE ARROW / UPPER LEFT DOUBLE ARROW
" U+021D7 	⇗ 	\Nearrow 	NORTH EAST DOUBLE ARROW / UPPER RIGHT DOUBLE ARROW
" U+021D8 	⇘ 	\Searrow 	SOUTH EAST DOUBLE ARROW / LOWER RIGHT DOUBLE ARROW
" U+021D9 	⇙ 	\Swarrow 	SOUTH WEST DOUBLE ARROW / LOWER LEFT DOUBLE ARROW
" U+021DA 	⇚ 	\Lleftarrow 	LEFTWARDS TRIPLE ARROW / LEFT TRIPLE ARROW
" U+021DB 	⇛ 	\Rrightarrow 	RIGHTWARDS TRIPLE ARROW / RIGHT TRIPLE ARROW
" U+021DC 	⇜ 	\leftsquigarrow 	LEFTWARDS SQUIGGLE ARROW / LEFT SQUIGGLE ARROW
" U+021DD 	⇝ 	\rightsquigarrow 	RIGHTWARDS SQUIGGLE ARROW / RIGHT SQUIGGLE ARROW
" U+021DE 	⇞ 	\nHuparrow 	UPWARDS ARROW WITH DOUBLE STROKE / UP ARROW WITH DOUBLE STROKE
" U+021DF 	⇟ 	\nHdownarrow 	DOWNWARDS ARROW WITH DOUBLE STROKE / DOWN ARROW WITH DOUBLE STROKE
" U+021E0 	⇠ 	\leftdasharrow 	LEFTWARDS DASHED ARROW / LEFT DASHED ARROW
" U+021E1 	⇡ 	\updasharrow 	UPWARDS DASHED ARROW / UP DASHED ARROW
" U+021E2 	⇢ 	\rightdasharrow 	RIGHTWARDS DASHED ARROW / RIGHT DASHED ARROW
" U+021E3 	⇣ 	\downdasharrow 	DOWNWARDS DASHED ARROW / DOWN DASHED ARROW
" U+021E4 	⇤ 	\barleftarrow 	LEFTWARDS ARROW TO BAR / LEFT ARROW TO BAR
" U+021E5 	⇥ 	\rightarrowbar 	RIGHTWARDS ARROW TO BAR / RIGHT ARROW TO BAR
" U+021E6 	⇦ 	\leftwhitearrow 	LEFTWARDS WHITE ARROW / WHITE LEFT ARROW
" U+021E7 	⇧ 	\upwhitearrow 	UPWARDS WHITE ARROW / WHITE UP ARROW
" U+021E8 	⇨ 	\rightwhitearrow 	RIGHTWARDS WHITE ARROW / WHITE RIGHT ARROW
" U+021E9 	⇩ 	\downwhitearrow 	DOWNWARDS WHITE ARROW / WHITE DOWN ARROW
" U+021EA 	⇪ 	\whitearrowupfrombar 	UPWARDS WHITE ARROW FROM BAR / WHITE UP ARROW FROM BAR
" U+021F4 	⇴ 	\circleonrightarrow 	RIGHT ARROW WITH SMALL CIRCLE
" U+021F5 	⇵ 	\DownArrowUpArrow 	DOWNWARDS ARROW LEFTWARDS OF UPWARDS ARROW
" U+021F6 	⇶ 	\rightthreearrows 	THREE RIGHTWARDS ARROWS
" U+021F7 	⇷ 	\nvleftarrow 	LEFTWARDS ARROW WITH VERTICAL STROKE
" U+021F8 	⇸ 	\nvrightarrow 	RIGHTWARDS ARROW WITH VERTICAL STROKE
" U+021F9 	⇹ 	\nvleftrightarrow 	LEFT RIGHT ARROW WITH VERTICAL STROKE
" U+021FA 	⇺ 	\nVleftarrow 	LEFTWARDS ARROW WITH DOUBLE VERTICAL STROKE
" U+021FB 	⇻ 	\nVrightarrow 	RIGHTWARDS ARROW WITH DOUBLE VERTICAL STROKE
" U+021FC 	⇼ 	\nVleftrightarrow 	LEFT RIGHT ARROW WITH DOUBLE VERTICAL STROKE
" U+021FD 	⇽ 	\leftarrowtriangle 	LEFTWARDS OPEN-HEADED ARROW
" U+021FE 	⇾ 	\rightarrowtriangle 	RIGHTWARDS OPEN-HEADED ARROW
" U+021FF 	⇿ 	\leftrightarrowtriangle 	LEFT RIGHT OPEN-HEADED ARROW
" U+02200 	∀ 	\forall 	FOR ALL
" U+02201 	∁ 	\complement 	COMPLEMENT
" U+02202 	∂ 	\partial 	PARTIAL DIFFERENTIAL
" U+02203 	∃ 	\exists 	THERE EXISTS
" U+02204 	∄ 	\nexists 	THERE DOES NOT EXIST
" U+02205 	∅ 	\varnothing, \emptyset 	EMPTY SET
" U+02206 	∆ 	\increment 	INCREMENT
" U+02207 	∇ 	\del, \nabla 	NABLA
" U+02208 	∈ 	\in 	ELEMENT OF
" U+02209 	∉ 	\notin 	NOT AN ELEMENT OF
" U+0220A 	∊ 	\smallin 	SMALL ELEMENT OF
" U+0220B 	∋ 	\ni 	CONTAINS AS MEMBER
" U+0220C 	∌ 	\nni 	DOES NOT CONTAIN AS MEMBER
" U+0220D 	∍ 	\smallni 	SMALL CONTAINS AS MEMBER
" U+0220E 	∎ 	\QED 	END OF PROOF
" U+0220F 	∏ 	\prod 	N-ARY PRODUCT
" U+02210 	∐ 	\coprod 	N-ARY COPRODUCT
" U+02211 	∑ 	\sum 	N-ARY SUMMATION
" U+02212 	− 	\minus 	MINUS SIGN
" U+02213 	∓ 	\mp 	MINUS-OR-PLUS SIGN
" U+02214 	∔ 	\dotplus 	DOT PLUS
" U+02216 	∖ 	\setminus 	SET MINUS
" U+02217 	∗ 	\ast 	ASTERISK OPERATOR
" U+02218 	∘ 	\circ 	RING OPERATOR
" U+02219 	∙ 	\vysmblkcircle 	BULLET OPERATOR
" U+0221A 	√ 	\surd, \sqrt 	SQUARE ROOT
" U+0221B 	∛ 	\cbrt 	CUBE ROOT
" U+0221C 	∜ 	\fourthroot 	FOURTH ROOT
" U+0221D 	∝ 	\propto 	PROPORTIONAL TO
" U+0221E 	∞ 	\infty 	INFINITY
" U+0221F 	∟ 	\rightangle 	RIGHT ANGLE
" U+02220 	∠ 	\angle 	ANGLE
" U+02221 	∡ 	\measuredangle 	MEASURED ANGLE
" U+02222 	∢ 	\sphericalangle 	SPHERICAL ANGLE
" U+02223 	∣ 	\mid 	DIVIDES
" U+02224 	∤ 	\nmid 	DOES NOT DIVIDE
" U+02225 	∥ 	\parallel 	PARALLEL TO
" U+02226 	∦ 	\nparallel 	NOT PARALLEL TO
" U+02227 	∧ 	\wedge 	LOGICAL AND
" U+02228 	∨ 	\vee 	LOGICAL OR
" U+02229 	∩ 	\cap 	INTERSECTION
" U+0222A 	∪ 	\cup 	UNION
" U+0222B 	∫ 	\int 	INTEGRAL
" U+0222C 	∬ 	\iint 	DOUBLE INTEGRAL
" U+0222D 	∭ 	\iiint 	TRIPLE INTEGRAL
" U+0222E 	∮ 	\oint 	CONTOUR INTEGRAL
" U+0222F 	∯ 	\oiint 	SURFACE INTEGRAL
" U+02230 	∰ 	\oiiint 	VOLUME INTEGRAL
" U+02231 	∱ 	\clwintegral 	CLOCKWISE INTEGRAL
" U+02232 	∲ 	\varointclockwise 	CLOCKWISE CONTOUR INTEGRAL
" U+02233 	∳ 	\ointctrclockwise 	ANTICLOCKWISE CONTOUR INTEGRAL
" U+02234 	∴ 	\therefore 	THEREFORE
" U+02235 	∵ 	\because 	BECAUSE
" U+02237 	∷ 	\Colon 	PROPORTION
" U+02238 	∸ 	\dotminus 	DOT MINUS
" U+0223A 	∺ 	\dotsminusdots 	GEOMETRIC PROPORTION
" U+0223B 	∻ 	\kernelcontraction 	HOMOTHETIC
" U+0223C 	∼ 	\sim 	TILDE OPERATOR
" U+0223D 	∽ 	\backsim 	REVERSED TILDE
" U+0223E 	∾ 	\lazysinv 	INVERTED LAZY S
" U+0223F 	∿ 	\sinewave 	SINE WAVE
" U+02240 	≀ 	\wr 	WREATH PRODUCT
" U+02241 	≁ 	\nsim 	NOT TILDE
" U+02242 	≂ 	\eqsim 	MINUS TILDE
" U+02242 + U+00338 	≂̸ 	\neqsim 	MINUS TILDE + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+02243 	≃ 	\simeq 	ASYMPTOTICALLY EQUAL TO
" U+02244 	≄ 	\nsime 	NOT ASYMPTOTICALLY EQUAL TO
" U+02245 	≅ 	\cong 	APPROXIMATELY EQUAL TO
" U+02246 	≆ 	\approxnotequal 	APPROXIMATELY BUT NOT ACTUALLY EQUAL TO
" U+02247 	≇ 	\ncong 	NEITHER APPROXIMATELY NOR ACTUALLY EQUAL TO
" U+02248 	≈ 	\approx 	ALMOST EQUAL TO
" U+02249 	≉ 	\napprox 	NOT ALMOST EQUAL TO
" U+0224A 	≊ 	\approxeq 	ALMOST EQUAL OR EQUAL TO
" U+0224B 	≋ 	\tildetrpl 	TRIPLE TILDE
" U+0224C 	≌ 	\allequal 	ALL EQUAL TO
" U+0224D 	≍ 	\asymp 	EQUIVALENT TO
" U+0224E 	≎ 	\Bumpeq 	GEOMETRICALLY EQUIVALENT TO
" U+0224E + U+00338 	≎̸ 	\nBumpeq 	GEOMETRICALLY EQUIVALENT TO + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+0224F 	≏ 	\bumpeq 	DIFFERENCE BETWEEN
" U+0224F + U+00338 	≏̸ 	\nbumpeq 	DIFFERENCE BETWEEN + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+02250 	≐ 	\doteq 	APPROACHES THE LIMIT
" U+02251 	≑ 	\Doteq 	GEOMETRICALLY EQUAL TO
" U+02252 	≒ 	\fallingdotseq 	APPROXIMATELY EQUAL TO OR THE IMAGE OF
" U+02253 	≓ 	\risingdotseq 	IMAGE OF OR APPROXIMATELY EQUAL TO
" U+02254 	≔ 	\coloneq 	COLON EQUALS / COLON EQUAL
" U+02255 	≕ 	\eqcolon 	EQUALS COLON / EQUAL COLON
" U+02256 	≖ 	\eqcirc 	RING IN EQUAL TO
" U+02257 	≗ 	\circeq 	RING EQUAL TO
" U+02258 	≘ 	\arceq 	CORRESPONDS TO
" U+02259 	≙ 	\wedgeq 	ESTIMATES
" U+0225A 	≚ 	\veeeq 	EQUIANGULAR TO
" U+0225B 	≛ 	\starequal 	STAR EQUALS
" U+0225C 	≜ 	\triangleq 	DELTA EQUAL TO
" U+0225D 	≝ 	\eqdef 	EQUAL TO BY DEFINITION
" U+0225E 	≞ 	\measeq 	MEASURED BY
" U+0225F 	≟ 	\questeq 	QUESTIONED EQUAL TO
" U+02260 	≠ 	\ne 	NOT EQUAL TO
" U+02261 	≡ 	\equiv 	IDENTICAL TO
" U+02262 	≢ 	\nequiv 	NOT IDENTICAL TO
" U+02263 	≣ 	\Equiv 	STRICTLY EQUIVALENT TO
" U+02264 	≤ 	\le 	LESS-THAN OR EQUAL TO / LESS THAN OR EQUAL TO
" U+02265 	≥ 	\ge 	GREATER-THAN OR EQUAL TO / GREATER THAN OR EQUAL TO
" U+02266 	≦ 	\leqq 	LESS-THAN OVER EQUAL TO / LESS THAN OVER EQUAL TO
" U+02267 	≧ 	\geqq 	GREATER-THAN OVER EQUAL TO / GREATER THAN OVER EQUAL TO
" U+02268 	≨ 	\lneqq 	LESS-THAN BUT NOT EQUAL TO / LESS THAN BUT NOT EQUAL TO
" U+02268 + U+0FE00 	≨︀ 	\lvertneqq 	LESS-THAN BUT NOT EQUAL TO / LESS THAN BUT NOT EQUAL TO + VARIATION SELECTOR-1
" U+02269 	≩ 	\gneqq 	GREATER-THAN BUT NOT EQUAL TO / GREATER THAN BUT NOT EQUAL TO
" U+02269 + U+0FE00 	≩︀ 	\gvertneqq 	GREATER-THAN BUT NOT EQUAL TO / GREATER THAN BUT NOT EQUAL TO + VARIATION SELECTOR-1
" U+0226A 	≪ 	\ll 	MUCH LESS-THAN / MUCH LESS THAN
" U+0226A + U+00338 	≪̸ 	\NotLessLess 	MUCH LESS-THAN / MUCH LESS THAN + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+0226B 	≫ 	\gg 	MUCH GREATER-THAN / MUCH GREATER THAN
" U+0226B + U+00338 	≫̸ 	\NotGreaterGreater 	MUCH GREATER-THAN / MUCH GREATER THAN + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+0226C 	≬ 	\between 	BETWEEN
" U+0226D 	≭ 	\nasymp 	NOT EQUIVALENT TO
" U+0226E 	≮ 	\nless 	NOT LESS-THAN / NOT LESS THAN
" U+0226F 	≯ 	\ngtr 	NOT GREATER-THAN / NOT GREATER THAN
" U+02270 	≰ 	\nleq 	NEITHER LESS-THAN NOR EQUAL TO / NEITHER LESS THAN NOR EQUAL TO
" U+02271 	≱ 	\ngeq 	NEITHER GREATER-THAN NOR EQUAL TO / NEITHER GREATER THAN NOR EQUAL TO
" U+02272 	≲ 	\lesssim 	LESS-THAN OR EQUIVALENT TO / LESS THAN OR EQUIVALENT TO
" U+02273 	≳ 	\gtrsim 	GREATER-THAN OR EQUIVALENT TO / GREATER THAN OR EQUIVALENT TO
" U+02274 	≴ 	\nlesssim 	NEITHER LESS-THAN NOR EQUIVALENT TO / NEITHER LESS THAN NOR EQUIVALENT TO
" U+02275 	≵ 	\ngtrsim 	NEITHER GREATER-THAN NOR EQUIVALENT TO / NEITHER GREATER THAN NOR EQUIVALENT TO
" U+02276 	≶ 	\lessgtr 	LESS-THAN OR GREATER-THAN / LESS THAN OR GREATER THAN
" U+02277 	≷ 	\gtrless 	GREATER-THAN OR LESS-THAN / GREATER THAN OR LESS THAN
" U+02278 	≸ 	\notlessgreater 	NEITHER LESS-THAN NOR GREATER-THAN / NEITHER LESS THAN NOR GREATER THAN
" U+02279 	≹ 	\notgreaterless 	NEITHER GREATER-THAN NOR LESS-THAN / NEITHER GREATER THAN NOR LESS THAN
" U+0227A 	≺ 	\prec 	PRECEDES
" U+0227B 	≻ 	\succ 	SUCCEEDS
" U+0227C 	≼ 	\preccurlyeq 	PRECEDES OR EQUAL TO
" U+0227D 	≽ 	\succcurlyeq 	SUCCEEDS OR EQUAL TO
" U+0227E 	≾ 	\precsim 	PRECEDES OR EQUIVALENT TO
" U+0227E + U+00338 	≾̸ 	\nprecsim 	PRECEDES OR EQUIVALENT TO + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+0227F 	≿ 	\succsim 	SUCCEEDS OR EQUIVALENT TO
" U+0227F + U+00338 	≿̸ 	\nsuccsim 	SUCCEEDS OR EQUIVALENT TO + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+02280 	⊀ 	\nprec 	DOES NOT PRECEDE
" U+02281 	⊁ 	\nsucc 	DOES NOT SUCCEED
" U+02282 	⊂ 	\subset 	SUBSET OF
" U+02283 	⊃ 	\supset 	SUPERSET OF
" U+02284 	⊄ 	\nsubset 	NOT A SUBSET OF
" U+02285 	⊅ 	\nsupset 	NOT A SUPERSET OF
" U+02286 	⊆ 	\subseteq 	SUBSET OF OR EQUAL TO
" U+02287 	⊇ 	\supseteq 	SUPERSET OF OR EQUAL TO
" U+02288 	⊈ 	\nsubseteq 	NEITHER A SUBSET OF NOR EQUAL TO
" U+02289 	⊉ 	\nsupseteq 	NEITHER A SUPERSET OF NOR EQUAL TO
" U+0228A 	⊊ 	\subsetneq 	SUBSET OF WITH NOT EQUAL TO / SUBSET OF OR NOT EQUAL TO
" U+0228A + U+0FE00 	⊊︀ 	\varsubsetneqq 	SUBSET OF WITH NOT EQUAL TO / SUBSET OF OR NOT EQUAL TO + VARIATION SELECTOR-1
" U+0228B 	⊋ 	\supsetneq 	SUPERSET OF WITH NOT EQUAL TO / SUPERSET OF OR NOT EQUAL TO
" U+0228B + U+0FE00 	⊋︀ 	\varsupsetneq 	SUPERSET OF WITH NOT EQUAL TO / SUPERSET OF OR NOT EQUAL TO + VARIATION SELECTOR-1
" U+0228D 	⊍ 	\cupdot 	MULTISET MULTIPLICATION
" U+0228E 	⊎ 	\uplus 	MULTISET UNION
" U+0228F 	⊏ 	\sqsubset 	SQUARE IMAGE OF
" U+0228F + U+00338 	⊏̸ 	\NotSquareSubset 	SQUARE IMAGE OF + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+02290 	⊐ 	\sqsupset 	SQUARE ORIGINAL OF
" U+02290 + U+00338 	⊐̸ 	\NotSquareSuperset 	SQUARE ORIGINAL OF + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+02291 	⊑ 	\sqsubseteq 	SQUARE IMAGE OF OR EQUAL TO
" U+02292 	⊒ 	\sqsupseteq 	SQUARE ORIGINAL OF OR EQUAL TO
" U+02293 	⊓ 	\sqcap 	SQUARE CAP
" U+02294 	⊔ 	\sqcup 	SQUARE CUP
" U+02295 	⊕ 	\oplus 	CIRCLED PLUS
" U+02296 	⊖ 	\ominus 	CIRCLED MINUS
" U+02297 	⊗ 	\otimes 	CIRCLED TIMES
" U+02298 	⊘ 	\oslash 	CIRCLED DIVISION SLASH
" U+02299 	⊙ 	\odot 	CIRCLED DOT OPERATOR
" U+0229A 	⊚ 	\circledcirc 	CIRCLED RING OPERATOR
" U+0229B 	⊛ 	\circledast 	CIRCLED ASTERISK OPERATOR
" U+0229C 	⊜ 	\circledequal 	CIRCLED EQUALS
" U+0229D 	⊝ 	\circleddash 	CIRCLED DASH
" U+0229E 	⊞ 	\boxplus 	SQUARED PLUS
" U+0229F 	⊟ 	\boxminus 	SQUARED MINUS
" U+022A0 	⊠ 	\boxtimes 	SQUARED TIMES
" U+022A1 	⊡ 	\boxdot 	SQUARED DOT OPERATOR
" U+022A2 	⊢ 	\vdash 	RIGHT TACK
" U+022A3 	⊣ 	\dashv 	LEFT TACK
" U+022A4 	⊤ 	\top 	DOWN TACK
" U+022A5 	⊥ 	\bot 	UP TACK
" U+022A7 	⊧ 	\models 	MODELS
" U+022A8 	⊨ 	\vDash 	TRUE
" U+022A9 	⊩ 	\Vdash 	FORCES
" U+022AA 	⊪ 	\Vvdash 	TRIPLE VERTICAL BAR RIGHT TURNSTILE
" U+022AB 	⊫ 	\VDash 	DOUBLE VERTICAL BAR DOUBLE RIGHT TURNSTILE
" U+022AC 	⊬ 	\nvdash 	DOES NOT PROVE
" U+022AD 	⊭ 	\nvDash 	NOT TRUE
" U+022AE 	⊮ 	\nVdash 	DOES NOT FORCE
" U+022AF 	⊯ 	\nVDash 	NEGATED DOUBLE VERTICAL BAR DOUBLE RIGHT TURNSTILE
" U+022B0 	⊰ 	\prurel 	PRECEDES UNDER RELATION
" U+022B1 	⊱ 	\scurel 	SUCCEEDS UNDER RELATION
" U+022B2 	⊲ 	\vartriangleleft 	NORMAL SUBGROUP OF
" U+022B3 	⊳ 	\vartriangleright 	CONTAINS AS NORMAL SUBGROUP
" U+022B4 	⊴ 	\trianglelefteq 	NORMAL SUBGROUP OF OR EQUAL TO
" U+022B5 	⊵ 	\trianglerighteq 	CONTAINS AS NORMAL SUBGROUP OR EQUAL TO
" U+022B6 	⊶ 	\original 	ORIGINAL OF
" U+022B7 	⊷ 	\image 	IMAGE OF
" U+022B8 	⊸ 	\multimap 	MULTIMAP
" U+022B9 	⊹ 	\hermitconjmatrix 	HERMITIAN CONJUGATE MATRIX
" U+022BA 	⊺ 	\intercal 	INTERCALATE
" U+022BB 	⊻ 	\veebar 	XOR
" U+022BC 	⊼ 	\barwedge 	NAND
" U+022BD 	⊽ 	\barvee 	NOR
" U+022BE 	⊾ 	\rightanglearc 	RIGHT ANGLE WITH ARC
" U+022BF 	⊿ 	\varlrtriangle 	RIGHT TRIANGLE
" U+022C0 	⋀ 	\bigwedge 	N-ARY LOGICAL AND
" U+022C1 	⋁ 	\bigvee 	N-ARY LOGICAL OR
" U+022C2 	⋂ 	\bigcap 	N-ARY INTERSECTION
" U+022C3 	⋃ 	\bigcup 	N-ARY UNION
" U+022C4 	⋄ 	\diamond 	DIAMOND OPERATOR
" U+022C5 	⋅ 	\cdot 	DOT OPERATOR
" U+022C6 	⋆ 	\star 	STAR OPERATOR
" U+022C7 	⋇ 	\divideontimes 	DIVISION TIMES
" U+022C8 	⋈ 	\bowtie 	BOWTIE
" U+022C9 	⋉ 	\ltimes 	LEFT NORMAL FACTOR SEMIDIRECT PRODUCT
" U+022CA 	⋊ 	\rtimes 	RIGHT NORMAL FACTOR SEMIDIRECT PRODUCT
" U+022CB 	⋋ 	\leftthreetimes 	LEFT SEMIDIRECT PRODUCT
" U+022CC 	⋌ 	\rightthreetimes 	RIGHT SEMIDIRECT PRODUCT
" U+022CD 	⋍ 	\backsimeq 	REVERSED TILDE EQUALS
" U+022CE 	⋎ 	\curlyvee 	CURLY LOGICAL OR
" U+022CF 	⋏ 	\curlywedge 	CURLY LOGICAL AND
" U+022D0 	⋐ 	\Subset 	DOUBLE SUBSET
" U+022D1 	⋑ 	\Supset 	DOUBLE SUPERSET
" U+022D2 	⋒ 	\Cap 	DOUBLE INTERSECTION
" U+022D3 	⋓ 	\Cup 	DOUBLE UNION
" U+022D4 	⋔ 	\pitchfork 	PITCHFORK
" U+022D5 	⋕ 	\equalparallel 	EQUAL AND PARALLEL TO
" U+022D6 	⋖ 	\lessdot 	LESS-THAN WITH DOT / LESS THAN WITH DOT
" U+022D7 	⋗ 	\gtrdot 	GREATER-THAN WITH DOT / GREATER THAN WITH DOT
" U+022D8 	⋘ 	\verymuchless 	VERY MUCH LESS-THAN / VERY MUCH LESS THAN
" U+022D9 	⋙ 	\ggg 	VERY MUCH GREATER-THAN / VERY MUCH GREATER THAN
" U+022DA 	⋚ 	\lesseqgtr 	LESS-THAN EQUAL TO OR GREATER-THAN / LESS THAN EQUAL TO OR GREATER THAN
" U+022DB 	⋛ 	\gtreqless 	GREATER-THAN EQUAL TO OR LESS-THAN / GREATER THAN EQUAL TO OR LESS THAN
" U+022DC 	⋜ 	\eqless 	EQUAL TO OR LESS-THAN / EQUAL TO OR LESS THAN
" U+022DD 	⋝ 	\eqgtr 	EQUAL TO OR GREATER-THAN / EQUAL TO OR GREATER THAN
" U+022DE 	⋞ 	\curlyeqprec 	EQUAL TO OR PRECEDES
" U+022DF 	⋟ 	\curlyeqsucc 	EQUAL TO OR SUCCEEDS
" U+022E0 	⋠ 	\npreccurlyeq 	DOES NOT PRECEDE OR EQUAL
" U+022E1 	⋡ 	\nsucccurlyeq 	DOES NOT SUCCEED OR EQUAL
" U+022E2 	⋢ 	\nsqsubseteq 	NOT SQUARE IMAGE OF OR EQUAL TO
" U+022E3 	⋣ 	\nsqsupseteq 	NOT SQUARE ORIGINAL OF OR EQUAL TO
" U+022E4 	⋤ 	\sqsubsetneq 	SQUARE IMAGE OF OR NOT EQUAL TO
" U+022E5 	⋥ 	\Elzsqspne 	SQUARE ORIGINAL OF OR NOT EQUAL TO
" U+022E6 	⋦ 	\lnsim 	LESS-THAN BUT NOT EQUIVALENT TO / LESS THAN BUT NOT EQUIVALENT TO
" U+022E7 	⋧ 	\gnsim 	GREATER-THAN BUT NOT EQUIVALENT TO / GREATER THAN BUT NOT EQUIVALENT TO
" U+022E8 	⋨ 	\precnsim 	PRECEDES BUT NOT EQUIVALENT TO
" U+022E9 	⋩ 	\succnsim 	SUCCEEDS BUT NOT EQUIVALENT TO
" U+022EA 	⋪ 	\ntriangleleft 	NOT NORMAL SUBGROUP OF
" U+022EB 	⋫ 	\ntriangleright 	DOES NOT CONTAIN AS NORMAL SUBGROUP
" U+022EC 	⋬ 	\ntrianglelefteq 	NOT NORMAL SUBGROUP OF OR EQUAL TO
" U+022ED 	⋭ 	\ntrianglerighteq 	DOES NOT CONTAIN AS NORMAL SUBGROUP OR EQUAL
" U+022EE 	⋮ 	\vdots 	VERTICAL ELLIPSIS
" U+022EF 	⋯ 	\cdots 	MIDLINE HORIZONTAL ELLIPSIS
" U+022F0 	⋰ 	\adots 	UP RIGHT DIAGONAL ELLIPSIS
" U+022F1 	⋱ 	\ddots 	DOWN RIGHT DIAGONAL ELLIPSIS
" U+022F2 	⋲ 	\disin 	ELEMENT OF WITH LONG HORIZONTAL STROKE
" U+022F3 	⋳ 	\varisins 	ELEMENT OF WITH VERTICAL BAR AT END OF HORIZONTAL STROKE
" U+022F4 	⋴ 	\isins 	SMALL ELEMENT OF WITH VERTICAL BAR AT END OF HORIZONTAL STROKE
" U+022F5 	⋵ 	\isindot 	ELEMENT OF WITH DOT ABOVE
" U+022F6 	⋶ 	\varisinobar 	ELEMENT OF WITH OVERBAR
" U+022F7 	⋷ 	\isinobar 	SMALL ELEMENT OF WITH OVERBAR
" U+022F8 	⋸ 	\isinvb 	ELEMENT OF WITH UNDERBAR
" U+022F9 	⋹ 	\isinE 	ELEMENT OF WITH TWO HORIZONTAL STROKES
" U+022FA 	⋺ 	\nisd 	CONTAINS WITH LONG HORIZONTAL STROKE
" U+022FB 	⋻ 	\varnis 	CONTAINS WITH VERTICAL BAR AT END OF HORIZONTAL STROKE
" U+022FC 	⋼ 	\nis 	SMALL CONTAINS WITH VERTICAL BAR AT END OF HORIZONTAL STROKE
" U+022FD 	⋽ 	\varniobar 	CONTAINS WITH OVERBAR
" U+022FE 	⋾ 	\niobar 	SMALL CONTAINS WITH OVERBAR
" U+022FF 	⋿ 	\bagmember 	Z NOTATION BAG MEMBERSHIP
" U+02300 	⌀ 	\diameter 	DIAMETER SIGN
" U+02302 	⌂ 	\house 	HOUSE
" U+02306 	⌆ 	\vardoublebarwedge 	PERSPECTIVE
" U+02308 	⌈ 	\lceil 	LEFT CEILING
" U+02309 	⌉ 	\rceil 	RIGHT CEILING
" U+0230A 	⌊ 	\lfloor 	LEFT FLOOR
" U+0230B 	⌋ 	\rfloor 	RIGHT FLOOR
" U+02310 	⌐ 	\invnot 	REVERSED NOT SIGN
" U+02311 	⌑ 	\sqlozenge 	SQUARE LOZENGE
" U+02312 	⌒ 	\profline 	ARC
" U+02313 	⌓ 	\profsurf 	SEGMENT
" U+02315 	⌕ 	\recorder 	TELEPHONE RECORDER
" U+02317 	⌗ 	\viewdata 	VIEWDATA SQUARE
" U+02319 	⌙ 	\turnednot 	TURNED NOT SIGN
" U+0231A 	⌚ 	\:watch: 	WATCH
" U+0231B 	⌛ 	\:hourglass: 	HOURGLASS
" U+0231C 	⌜ 	\ulcorner 	TOP LEFT CORNER
" U+0231D 	⌝ 	\urcorner 	TOP RIGHT CORNER
" U+0231E 	⌞ 	\llcorner 	BOTTOM LEFT CORNER
" U+0231F 	⌟ 	\lrcorner 	BOTTOM RIGHT CORNER
" U+02322 	⌢ 	\frown 	FROWN
" U+02323 	⌣ 	\smile 	SMILE
" U+0232C 	⌬ 	\varhexagonlrbonds 	BENZENE RING
" U+02332 	⌲ 	\conictaper 	CONICAL TAPER
" U+02336 	⌶ 	\topbot 	APL FUNCTIONAL SYMBOL I-BEAM
" U+0233D 	⌽ 	\obar 	APL FUNCTIONAL SYMBOL CIRCLE STILE
" U+0233F 	⌿ 	\APLnotslash 	APL FUNCTIONAL SYMBOL SLASH BAR
" U+02340 	⍀ 	\APLnotbackslash 	APL FUNCTIONAL SYMBOL BACKSLASH BAR
" U+02353 	⍓ 	\APLboxupcaret 	APL FUNCTIONAL SYMBOL QUAD UP CARET
" U+02370 	⍰ 	\APLboxquestion 	APL FUNCTIONAL SYMBOL QUAD QUESTION
" U+02394 	⎔ 	\hexagon 	SOFTWARE-FUNCTION SYMBOL
" U+023A3 	⎣ 	\Elzdlcorn 	LEFT SQUARE BRACKET LOWER CORNER
" U+023B0 	⎰ 	\lmoustache 	UPPER LEFT OR LOWER RIGHT CURLY BRACKET SECTION
" U+023B1 	⎱ 	\rmoustache 	UPPER RIGHT OR LOWER LEFT CURLY BRACKET SECTION
" U+023B4 	⎴ 	\overbracket 	TOP SQUARE BRACKET
" U+023B5 	⎵ 	\underbracket 	BOTTOM SQUARE BRACKET
" U+023B6 	⎶ 	\bbrktbrk 	BOTTOM SQUARE BRACKET OVER TOP SQUARE BRACKET
" U+023B7 	⎷ 	\sqrtbottom 	RADICAL SYMBOL BOTTOM
" U+023B8 	⎸ 	\lvboxline 	LEFT VERTICAL BOX LINE
" U+023B9 	⎹ 	\rvboxline 	RIGHT VERTICAL BOX LINE
" U+023CE 	⏎ 	\varcarriagereturn 	RETURN SYMBOL
" U+023DE 	⏞ 	\overbrace 	TOP CURLY BRACKET
" U+023DF 	⏟ 	\underbrace 	BOTTOM CURLY BRACKET
" U+023E2 	⏢ 	\trapezium 	WHITE TRAPEZIUM
" U+023E3 	⏣ 	\benzenr 	BENZENE RING WITH CIRCLE
" U+023E4 	⏤ 	\strns 	STRAIGHTNESS
" U+023E5 	⏥ 	\fltns 	FLATNESS
" U+023E6 	⏦ 	\accurrent 	AC CURRENT
" U+023E7 	⏧ 	\elinters 	ELECTRICAL INTERSECTION
" U+023E9 	⏩ 	\:fast_forward: 	BLACK RIGHT-POINTING DOUBLE TRIANGLE
" U+023EA 	⏪ 	\:rewind: 	BLACK LEFT-POINTING DOUBLE TRIANGLE
" U+023EB 	⏫ 	\:arrow_double_up: 	BLACK UP-POINTING DOUBLE TRIANGLE
" U+023EC 	⏬ 	\:arrow_double_down: 	BLACK DOWN-POINTING DOUBLE TRIANGLE
" U+023F0 	⏰ 	\:alarm_clock: 	ALARM CLOCK
" U+023F3 	⏳ 	\:hourglass_flowing_sand: 	HOURGLASS WITH FLOWING SAND
" U+02422 	␢ 	\blanksymbol 	BLANK SYMBOL / BLANK
" U+02423 	␣ 	\textvisiblespace 	OPEN BOX
" U+024C2 	Ⓜ 	\:m: 	CIRCLED LATIN CAPITAL LETTER M
" U+024C8 	Ⓢ 	\circledS 	CIRCLED LATIN CAPITAL LETTER S
" U+02506 	┆ 	\Elzdshfnc 	BOX DRAWINGS LIGHT TRIPLE DASH VERTICAL / FORMS LIGHT TRIPLE DASH VERTICAL
" U+02519 	┙ 	\Elzsqfnw 	BOX DRAWINGS UP LIGHT AND LEFT HEAVY / FORMS UP LIGHT AND LEFT HEAVY
" U+02571 	╱ 	\diagup 	BOX DRAWINGS LIGHT DIAGONAL UPPER RIGHT TO LOWER LEFT / FORMS LIGHT DIAGONAL UPPER RIGHT TO LOWER LEFT
" U+02572 	╲ 	\diagdown 	BOX DRAWINGS LIGHT DIAGONAL UPPER LEFT TO LOWER RIGHT / FORMS LIGHT DIAGONAL UPPER LEFT TO LOWER RIGHT
" U+02580 	▀ 	\blockuphalf 	UPPER HALF BLOCK
" U+02584 	▄ 	\blocklowhalf 	LOWER HALF BLOCK
" U+02588 	█ 	\blockfull 	FULL BLOCK
" U+0258C 	▌ 	\blocklefthalf 	LEFT HALF BLOCK
" U+02590 	▐ 	\blockrighthalf 	RIGHT HALF BLOCK
" U+02591 	░ 	\blockqtrshaded 	LIGHT SHADE
" U+02592 	▒ 	\blockhalfshaded 	MEDIUM SHADE
" U+02593 	▓ 	\blockthreeqtrshaded 	DARK SHADE
" U+025A0 	■ 	\blacksquare 	BLACK SQUARE
" U+025A1 	□ 	\square 	WHITE SQUARE
" U+025A2 	▢ 	\squoval 	WHITE SQUARE WITH ROUNDED CORNERS
" U+025A3 	▣ 	\blackinwhitesquare 	WHITE SQUARE CONTAINING BLACK SMALL SQUARE
" U+025A4 	▤ 	\squarehfill 	SQUARE WITH HORIZONTAL FILL
" U+025A5 	▥ 	\squarevfill 	SQUARE WITH VERTICAL FILL
" U+025A6 	▦ 	\squarehvfill 	SQUARE WITH ORTHOGONAL CROSSHATCH FILL
" U+025A7 	▧ 	\squarenwsefill 	SQUARE WITH UPPER LEFT TO LOWER RIGHT FILL
" U+025A8 	▨ 	\squareneswfill 	SQUARE WITH UPPER RIGHT TO LOWER LEFT FILL
" U+025A9 	▩ 	\squarecrossfill 	SQUARE WITH DIAGONAL CROSSHATCH FILL
" U+025AA 	▪ 	\smblksquare, \:black_small_square: 	BLACK SMALL SQUARE
" U+025AB 	▫ 	\smwhtsquare, \:white_small_square: 	WHITE SMALL SQUARE
" U+025AC 	▬ 	\hrectangleblack 	BLACK RECTANGLE
" U+025AD 	▭ 	\hrectangle 	WHITE RECTANGLE
" U+025AE 	▮ 	\vrectangleblack 	BLACK VERTICAL RECTANGLE
" U+025AF 	▯ 	\Elzvrecto 	WHITE VERTICAL RECTANGLE
" U+025B0 	▰ 	\parallelogramblack 	BLACK PARALLELOGRAM
" U+025B1 	▱ 	\parallelogram 	WHITE PARALLELOGRAM
" U+025B2 	▲ 	\bigblacktriangleup 	BLACK UP-POINTING TRIANGLE / BLACK UP POINTING TRIANGLE
" U+025B3 	△ 	\bigtriangleup 	WHITE UP-POINTING TRIANGLE / WHITE UP POINTING TRIANGLE
" U+025B4 	▴ 	\blacktriangle 	BLACK UP-POINTING SMALL TRIANGLE / BLACK UP POINTING SMALL TRIANGLE
" U+025B5 	▵ 	\vartriangle 	WHITE UP-POINTING SMALL TRIANGLE / WHITE UP POINTING SMALL TRIANGLE
" U+025B6 	▶ 	\blacktriangleright, \:arrow_forward: 	BLACK RIGHT-POINTING TRIANGLE / BLACK RIGHT POINTING TRIANGLE
" U+025B9 	▹ 	\triangleright 	WHITE RIGHT-POINTING SMALL TRIANGLE / WHITE RIGHT POINTING SMALL TRIANGLE
" U+025BA 	► 	\blackpointerright 	BLACK RIGHT-POINTING POINTER / BLACK RIGHT POINTING POINTER
" U+025BB 	▻ 	\whitepointerright 	WHITE RIGHT-POINTING POINTER / WHITE RIGHT POINTING POINTER
" U+025BC 	▼ 	\bigblacktriangledown 	BLACK DOWN-POINTING TRIANGLE / BLACK DOWN POINTING TRIANGLE
" U+025BD 	▽ 	\bigtriangledown 	WHITE DOWN-POINTING TRIANGLE / WHITE DOWN POINTING TRIANGLE
" U+025BE 	▾ 	\blacktriangledown 	BLACK DOWN-POINTING SMALL TRIANGLE / BLACK DOWN POINTING SMALL TRIANGLE
" U+025BF 	▿ 	\triangledown 	WHITE DOWN-POINTING SMALL TRIANGLE / WHITE DOWN POINTING SMALL TRIANGLE
" U+025C0 	◀ 	\blacktriangleleft, \:arrow_backward: 	BLACK LEFT-POINTING TRIANGLE / BLACK LEFT POINTING TRIANGLE
" U+025C3 	◃ 	\triangleleft 	WHITE LEFT-POINTING SMALL TRIANGLE / WHITE LEFT POINTING SMALL TRIANGLE
" U+025C4 	◄ 	\blackpointerleft 	BLACK LEFT-POINTING POINTER / BLACK LEFT POINTING POINTER
" U+025C5 	◅ 	\whitepointerleft 	WHITE LEFT-POINTING POINTER / WHITE LEFT POINTING POINTER
" U+025C6 	◆ 	\mdlgblkdiamond 	BLACK DIAMOND
" U+025C7 	◇ 	\mdlgwhtdiamond 	WHITE DIAMOND
" U+025C8 	◈ 	\blackinwhitediamond 	WHITE DIAMOND CONTAINING BLACK SMALL DIAMOND
" U+025C9 	◉ 	\fisheye 	FISHEYE
" U+025CA 	◊ 	\lozenge 	LOZENGE
" U+025CB 	○ 	\bigcirc 	WHITE CIRCLE
" U+025CC 	◌ 	\dottedcircle 	DOTTED CIRCLE
" U+025CD 	◍ 	\circlevertfill 	CIRCLE WITH VERTICAL FILL
" U+025CE 	◎ 	\bullseye 	BULLSEYE
" U+025CF 	● 	\mdlgblkcircle 	BLACK CIRCLE
" U+025D0 	◐ 	\Elzcirfl 	CIRCLE WITH LEFT HALF BLACK
" U+025D1 	◑ 	\Elzcirfr 	CIRCLE WITH RIGHT HALF BLACK
" U+025D2 	◒ 	\Elzcirfb 	CIRCLE WITH LOWER HALF BLACK
" U+025D3 	◓ 	\circletophalfblack 	CIRCLE WITH UPPER HALF BLACK
" U+025D4 	◔ 	\circleurquadblack 	CIRCLE WITH UPPER RIGHT QUADRANT BLACK
" U+025D5 	◕ 	\blackcircleulquadwhite 	CIRCLE WITH ALL BUT UPPER LEFT QUADRANT BLACK
" U+025D6 	◖ 	\blacklefthalfcircle 	LEFT HALF BLACK CIRCLE
" U+025D7 	◗ 	\blackrighthalfcircle 	RIGHT HALF BLACK CIRCLE
" U+025D8 	◘ 	\Elzrvbull 	INVERSE BULLET
" U+025D9 	◙ 	\inversewhitecircle 	INVERSE WHITE CIRCLE
" U+025DA 	◚ 	\invwhiteupperhalfcircle 	UPPER HALF INVERSE WHITE CIRCLE
" U+025DB 	◛ 	\invwhitelowerhalfcircle 	LOWER HALF INVERSE WHITE CIRCLE
" U+025DC 	◜ 	\ularc 	UPPER LEFT QUADRANT CIRCULAR ARC
" U+025DD 	◝ 	\urarc 	UPPER RIGHT QUADRANT CIRCULAR ARC
" U+025DE 	◞ 	\lrarc 	LOWER RIGHT QUADRANT CIRCULAR ARC
" U+025DF 	◟ 	\llarc 	LOWER LEFT QUADRANT CIRCULAR ARC
" U+025E0 	◠ 	\topsemicircle 	UPPER HALF CIRCLE
" U+025E1 	◡ 	\botsemicircle 	LOWER HALF CIRCLE
" U+025E2 	◢ 	\lrblacktriangle 	BLACK LOWER RIGHT TRIANGLE
" U+025E3 	◣ 	\llblacktriangle 	BLACK LOWER LEFT TRIANGLE
" U+025E4 	◤ 	\ulblacktriangle 	BLACK UPPER LEFT TRIANGLE
" U+025E5 	◥ 	\urblacktriangle 	BLACK UPPER RIGHT TRIANGLE
" U+025E6 	◦ 	\smwhtcircle 	WHITE BULLET
" U+025E7 	◧ 	\Elzsqfl 	SQUARE WITH LEFT HALF BLACK
" U+025E8 	◨ 	\Elzsqfr 	SQUARE WITH RIGHT HALF BLACK
" U+025E9 	◩ 	\squareulblack 	SQUARE WITH UPPER LEFT DIAGONAL HALF BLACK
" U+025EA 	◪ 	\Elzsqfse 	SQUARE WITH LOWER RIGHT DIAGONAL HALF BLACK
" U+025EB 	◫ 	\boxbar 	WHITE SQUARE WITH VERTICAL BISECTING LINE
" U+025EC 	◬ 	\trianglecdot 	WHITE UP-POINTING TRIANGLE WITH DOT / WHITE UP POINTING TRIANGLE WITH DOT
" U+025ED 	◭ 	\triangleleftblack 	UP-POINTING TRIANGLE WITH LEFT HALF BLACK / UP POINTING TRIANGLE WITH LEFT HALF BLACK
" U+025EE 	◮ 	\trianglerightblack 	UP-POINTING TRIANGLE WITH RIGHT HALF BLACK / UP POINTING TRIANGLE WITH RIGHT HALF BLACK
" U+025EF 	◯ 	\lgwhtcircle 	LARGE CIRCLE
" U+025F0 	◰ 	\squareulquad 	WHITE SQUARE WITH UPPER LEFT QUADRANT
" U+025F1 	◱ 	\squarellquad 	WHITE SQUARE WITH LOWER LEFT QUADRANT
" U+025F2 	◲ 	\squarelrquad 	WHITE SQUARE WITH LOWER RIGHT QUADRANT
" U+025F3 	◳ 	\squareurquad 	WHITE SQUARE WITH UPPER RIGHT QUADRANT
" U+025F4 	◴ 	\circleulquad 	WHITE CIRCLE WITH UPPER LEFT QUADRANT
" U+025F5 	◵ 	\circlellquad 	WHITE CIRCLE WITH LOWER LEFT QUADRANT
" U+025F6 	◶ 	\circlelrquad 	WHITE CIRCLE WITH LOWER RIGHT QUADRANT
" U+025F7 	◷ 	\circleurquad 	WHITE CIRCLE WITH UPPER RIGHT QUADRANT
" U+025F8 	◸ 	\ultriangle 	UPPER LEFT TRIANGLE
" U+025F9 	◹ 	\urtriangle 	UPPER RIGHT TRIANGLE
" U+025FA 	◺ 	\lltriangle 	LOWER LEFT TRIANGLE
" U+025FB 	◻ 	\mdwhtsquare, \:white_medium_square: 	WHITE MEDIUM SQUARE
" U+025FC 	◼ 	\mdblksquare, \:black_medium_square: 	BLACK MEDIUM SQUARE
" U+025FD 	◽ 	\mdsmwhtsquare, \:white_medium_small_square: 	WHITE MEDIUM SMALL SQUARE
" U+025FE 	◾ 	\mdsmblksquare, \:black_medium_small_square: 	BLACK MEDIUM SMALL SQUARE
" U+025FF 	◿ 	\lrtriangle 	LOWER RIGHT TRIANGLE
" U+02600 	☀ 	\:sunny: 	BLACK SUN WITH RAYS
" U+02601 	☁ 	\:cloud: 	CLOUD
" U+02605 	★ 	\bigstar 	BLACK STAR
" U+02606 	☆ 	\bigwhitestar 	WHITE STAR
" U+02609 	☉ 	\astrosun 	SUN
" U+0260E 	☎ 	\:phone: 	BLACK TELEPHONE
" U+02611 	☑ 	\:ballot_box_with_check: 	BALLOT BOX WITH CHECK
" U+02614 	☔ 	\:umbrella: 	UMBRELLA WITH RAIN DROPS
" U+02615 	☕ 	\:coffee: 	HOT BEVERAGE
" U+0261D 	☝ 	\:point_up: 	WHITE UP POINTING INDEX
" U+02621 	☡ 	\danger 	CAUTION SIGN
" U+0263A 	☺ 	\:relaxed: 	WHITE SMILING FACE
" U+0263B 	☻ 	\blacksmiley 	BLACK SMILING FACE
" U+0263C 	☼ 	\sun 	WHITE SUN WITH RAYS
" U+0263D 	☽ 	\rightmoon 	FIRST QUARTER MOON
" U+0263F 	☿ 	\mercury 	MERCURY
" U+02640 	♀ 	\venus, \female 	FEMALE SIGN
" U+02642 	♂ 	\male, \mars 	MALE SIGN
" U+02643 	♃ 	\jupiter 	JUPITER
" U+02644 	♄ 	\saturn 	SATURN
" U+02645 	♅ 	\uranus 	URANUS
" U+02646 	♆ 	\neptune 	NEPTUNE
" U+02647 	♇ 	\pluto 	PLUTO
" U+02648 	♈ 	\aries, \:aries: 	ARIES
" U+02649 	♉ 	\taurus, \:taurus: 	TAURUS
" U+0264A 	♊ 	\gemini, \:gemini: 	GEMINI
" U+0264B 	♋ 	\cancer, \:cancer: 	CANCER
" U+0264C 	♌ 	\leo, \:leo: 	LEO
" U+0264D 	♍ 	\virgo, \:virgo: 	VIRGO
" U+0264E 	♎ 	\libra, \:libra: 	LIBRA
" U+0264F 	♏ 	\scorpio, \:scorpius: 	SCORPIUS
" U+02650 	♐ 	\sagittarius, \:sagittarius: 	SAGITTARIUS
" U+02651 	♑ 	\capricornus, \:capricorn: 	CAPRICORN
" U+02652 	♒ 	\aquarius, \:aquarius: 	AQUARIUS
" U+02653 	♓ 	\pisces, \:pisces: 	PISCES
" U+02660 	♠ 	\spadesuit, \:spades: 	BLACK SPADE SUIT
" U+02661 	♡ 	\heartsuit 	WHITE HEART SUIT
" U+02662 	♢ 	\diamondsuit 	WHITE DIAMOND SUIT
" U+02663 	♣ 	\clubsuit, \:clubs: 	BLACK CLUB SUIT
" U+02664 	♤ 	\varspadesuit 	WHITE SPADE SUIT
" U+02665 	♥ 	\varheartsuit, \:hearts: 	BLACK HEART SUIT
" U+02666 	♦ 	\vardiamondsuit, \:diamonds: 	BLACK DIAMOND SUIT
" U+02667 	♧ 	\varclubsuit 	WHITE CLUB SUIT
" U+02668 	♨ 	\:hotsprings: 	HOT SPRINGS
" U+02669 	♩ 	\quarternote 	QUARTER NOTE
" U+0266A 	♪ 	\eighthnote 	EIGHTH NOTE
" U+0266B 	♫ 	\twonotes 	BEAMED EIGHTH NOTES / BARRED EIGHTH NOTES
" U+0266D 	♭ 	\flat 	MUSIC FLAT SIGN / FLAT
" U+0266E 	♮ 	\natural 	MUSIC NATURAL SIGN / NATURAL
" U+0266F 	♯ 	\sharp 	MUSIC SHARP SIGN / SHARP
" U+0267B 	♻ 	\:recycle: 	BLACK UNIVERSAL RECYCLING SYMBOL
" U+0267E 	♾ 	\acidfree 	PERMANENT PAPER SIGN
" U+0267F 	♿ 	\:wheelchair: 	WHEELCHAIR SYMBOL
" U+02680 	⚀ 	\dicei 	DIE FACE-1
" U+02681 	⚁ 	\diceii 	DIE FACE-2
" U+02682 	⚂ 	\diceiii 	DIE FACE-3
" U+02683 	⚃ 	\diceiv 	DIE FACE-4
" U+02684 	⚄ 	\dicev 	DIE FACE-5
" U+02685 	⚅ 	\dicevi 	DIE FACE-6
" U+02686 	⚆ 	\circledrightdot 	WHITE CIRCLE WITH DOT RIGHT
" U+02687 	⚇ 	\circledtwodots 	WHITE CIRCLE WITH TWO DOTS
" U+02688 	⚈ 	\blackcircledrightdot 	BLACK CIRCLE WITH WHITE DOT RIGHT
" U+02689 	⚉ 	\blackcircledtwodots 	BLACK CIRCLE WITH TWO WHITE DOTS
" U+02693 	⚓ 	\:anchor: 	ANCHOR
" U+026A0 	⚠ 	\:warning: 	WARNING SIGN
" U+026A1 	⚡ 	\:zap: 	HIGH VOLTAGE SIGN
" U+026A5 	⚥ 	\Hermaphrodite 	MALE AND FEMALE SIGN
" U+026AA 	⚪ 	\mdwhtcircle, \:white_circle: 	MEDIUM WHITE CIRCLE
" U+026AB 	⚫ 	\mdblkcircle, \:black_circle: 	MEDIUM BLACK CIRCLE
" U+026AC 	⚬ 	\mdsmwhtcircle 	MEDIUM SMALL WHITE CIRCLE
" U+026B2 	⚲ 	\neuter 	NEUTER
" U+026BD 	⚽ 	\:soccer: 	SOCCER BALL
" U+026BE 	⚾ 	\:baseball: 	BASEBALL
" U+026C4 	⛄ 	\:snowman: 	SNOWMAN WITHOUT SNOW
" U+026C5 	⛅ 	\:partly_sunny: 	SUN BEHIND CLOUD
" U+026CE 	⛎ 	\:ophiuchus: 	OPHIUCHUS
" U+026D4 	⛔ 	\:no_entry: 	NO ENTRY
" U+026EA 	⛪ 	\:church: 	CHURCH
" U+026F2 	⛲ 	\:fountain: 	FOUNTAIN
" U+026F3 	⛳ 	\:golf: 	FLAG IN HOLE
" U+026F5 	⛵ 	\:boat: 	SAILBOAT
" U+026FA 	⛺ 	\:tent: 	TENT
" U+026FD 	⛽ 	\:fuelpump: 	FUEL PUMP
" U+02702 	✂ 	\:scissors: 	BLACK SCISSORS
" U+02705 	✅ 	\:white_check_mark: 	WHITE HEAVY CHECK MARK
" U+02708 	✈ 	\:airplane: 	AIRPLANE
" U+02709 	✉ 	\:email: 	ENVELOPE
" U+0270A 	✊ 	\:fist: 	RAISED FIST
" U+0270B 	✋ 	\:hand: 	RAISED HAND
" U+0270C 	✌ 	\:v: 	VICTORY HAND
" U+0270F 	✏ 	\:pencil2: 	PENCIL
" U+02712 	✒ 	\:black_nib: 	BLACK NIB
" U+02713 	✓ 	\checkmark 	CHECK MARK
" U+02714 	✔ 	\:heavy_check_mark: 	HEAVY CHECK MARK
" U+02716 	✖ 	\:heavy_multiplication_x: 	HEAVY MULTIPLICATION X
" U+02720 	✠ 	\maltese 	MALTESE CROSS
" U+02728 	✨ 	\:sparkles: 	SPARKLES
" U+0272A 	✪ 	\circledstar 	CIRCLED WHITE STAR
" U+02733 	✳ 	\:eight_spoked_asterisk: 	EIGHT SPOKED ASTERISK
" U+02734 	✴ 	\:eight_pointed_black_star: 	EIGHT POINTED BLACK STAR
" U+02736 	✶ 	\varstar 	SIX POINTED BLACK STAR
" U+0273D 	✽ 	\dingasterisk 	HEAVY TEARDROP-SPOKED ASTERISK
" U+02744 	❄ 	\:snowflake: 	SNOWFLAKE
" U+02747 	❇ 	\:sparkle: 	SPARKLE
" U+0274C 	❌ 	\:x: 	CROSS MARK
" U+0274E 	❎ 	\:negative_squared_cross_mark: 	NEGATIVE SQUARED CROSS MARK
" U+02753 	❓ 	\:question: 	BLACK QUESTION MARK ORNAMENT
" U+02754 	❔ 	\:grey_question: 	WHITE QUESTION MARK ORNAMENT
" U+02755 	❕ 	\:grey_exclamation: 	WHITE EXCLAMATION MARK ORNAMENT
" U+02757 	❗ 	\:exclamation: 	HEAVY EXCLAMATION MARK SYMBOL
" U+02764 	❤ 	\:heart: 	HEAVY BLACK HEART
" U+02795 	➕ 	\:heavy_plus_sign: 	HEAVY PLUS SIGN
" U+02796 	➖ 	\:heavy_minus_sign: 	HEAVY MINUS SIGN
" U+02797 	➗ 	\:heavy_division_sign: 	HEAVY DIVISION SIGN
" U+0279B 	➛ 	\draftingarrow 	DRAFTING POINT RIGHTWARDS ARROW / DRAFTING POINT RIGHT ARROW
" U+027A1 	➡ 	\:arrow_right: 	BLACK RIGHTWARDS ARROW / BLACK RIGHT ARROW
" U+027B0 	➰ 	\:curly_loop: 	CURLY LOOP
" U+027BF 	➿ 	\:loop: 	DOUBLE CURLY LOOP
" U+027C0 	⟀ 	\threedangle 	THREE DIMENSIONAL ANGLE
" U+027C1 	⟁ 	\whiteinwhitetriangle 	WHITE TRIANGLE CONTAINING SMALL WHITE TRIANGLE
" U+027C2 	⟂ 	\perp 	PERPENDICULAR
" U+027C8 	⟈ 	\bsolhsub 	REVERSE SOLIDUS PRECEDING SUBSET
" U+027C9 	⟉ 	\suphsol 	SUPERSET PRECEDING SOLIDUS
" U+027D1 	⟑ 	\wedgedot 	AND WITH DOT
" U+027D2 	⟒ 	\upin 	ELEMENT OF OPENING UPWARDS
" U+027D8 	⟘ 	\bigbot 	LARGE UP TACK
" U+027D9 	⟙ 	\bigtop 	LARGE DOWN TACK
" U+027E6 	⟦ 	\llbracket, \openbracketleft 	MATHEMATICAL LEFT WHITE SQUARE BRACKET
" U+027E7 	⟧ 	\openbracketright, \rrbracket 	MATHEMATICAL RIGHT WHITE SQUARE BRACKET
" U+027E8 	⟨ 	\langle 	MATHEMATICAL LEFT ANGLE BRACKET
" U+027E9 	⟩ 	\rangle 	MATHEMATICAL RIGHT ANGLE BRACKET
" U+027F0 	⟰ 	\UUparrow 	UPWARDS QUADRUPLE ARROW
" U+027F1 	⟱ 	\DDownarrow 	DOWNWARDS QUADRUPLE ARROW
" U+027F5 	⟵ 	\longleftarrow 	LONG LEFTWARDS ARROW
" U+027F6 	⟶ 	\longrightarrow 	LONG RIGHTWARDS ARROW
" U+027F7 	⟷ 	\longleftrightarrow 	LONG LEFT RIGHT ARROW
" U+027F8 	⟸ 	\Longleftarrow 	LONG LEFTWARDS DOUBLE ARROW
" U+027F9 	⟹ 	\Longrightarrow 	LONG RIGHTWARDS DOUBLE ARROW
" U+027FA 	⟺ 	\Longleftrightarrow 	LONG LEFT RIGHT DOUBLE ARROW
" U+027FB 	⟻ 	\longmapsfrom 	LONG LEFTWARDS ARROW FROM BAR
" U+027FC 	⟼ 	\longmapsto 	LONG RIGHTWARDS ARROW FROM BAR
" U+027FD 	⟽ 	\Longmapsfrom 	LONG LEFTWARDS DOUBLE ARROW FROM BAR
" U+027FE 	⟾ 	\Longmapsto 	LONG RIGHTWARDS DOUBLE ARROW FROM BAR
" U+027FF 	⟿ 	\longrightsquigarrow 	LONG RIGHTWARDS SQUIGGLE ARROW
" U+02900 	⤀ 	\nvtwoheadrightarrow 	RIGHTWARDS TWO-HEADED ARROW WITH VERTICAL STROKE
" U+02901 	⤁ 	\nVtwoheadrightarrow 	RIGHTWARDS TWO-HEADED ARROW WITH DOUBLE VERTICAL STROKE
" U+02902 	⤂ 	\nvLeftarrow 	LEFTWARDS DOUBLE ARROW WITH VERTICAL STROKE
" U+02903 	⤃ 	\nvRightarrow 	RIGHTWARDS DOUBLE ARROW WITH VERTICAL STROKE
" U+02904 	⤄ 	\nvLeftrightarrow 	LEFT RIGHT DOUBLE ARROW WITH VERTICAL STROKE
" U+02905 	⤅ 	\twoheadmapsto 	RIGHTWARDS TWO-HEADED ARROW FROM BAR
" U+02906 	⤆ 	\Mapsfrom 	LEFTWARDS DOUBLE ARROW FROM BAR
" U+02907 	⤇ 	\Mapsto 	RIGHTWARDS DOUBLE ARROW FROM BAR
" U+02908 	⤈ 	\downarrowbarred 	DOWNWARDS ARROW WITH HORIZONTAL STROKE
" U+02909 	⤉ 	\uparrowbarred 	UPWARDS ARROW WITH HORIZONTAL STROKE
" U+0290A 	⤊ 	\Uuparrow 	UPWARDS TRIPLE ARROW
" U+0290B 	⤋ 	\Ddownarrow 	DOWNWARDS TRIPLE ARROW
" U+0290C 	⤌ 	\leftbkarrow 	LEFTWARDS DOUBLE DASH ARROW
" U+0290D 	⤍ 	\bkarow 	RIGHTWARDS DOUBLE DASH ARROW
" U+0290E 	⤎ 	\leftdbkarrow 	LEFTWARDS TRIPLE DASH ARROW
" U+0290F 	⤏ 	\dbkarow 	RIGHTWARDS TRIPLE DASH ARROW
" U+02910 	⤐ 	\drbkarrow 	RIGHTWARDS TWO-HEADED TRIPLE DASH ARROW
" U+02911 	⤑ 	\rightdotarrow 	RIGHTWARDS ARROW WITH DOTTED STEM
" U+02912 	⤒ 	\UpArrowBar 	UPWARDS ARROW TO BAR
" U+02913 	⤓ 	\DownArrowBar 	DOWNWARDS ARROW TO BAR
" U+02914 	⤔ 	\nvrightarrowtail 	RIGHTWARDS ARROW WITH TAIL WITH VERTICAL STROKE
" U+02915 	⤕ 	\nVrightarrowtail 	RIGHTWARDS ARROW WITH TAIL WITH DOUBLE VERTICAL STROKE
" U+02916 	⤖ 	\twoheadrightarrowtail 	RIGHTWARDS TWO-HEADED ARROW WITH TAIL
" U+02917 	⤗ 	\nvtwoheadrightarrowtail 	RIGHTWARDS TWO-HEADED ARROW WITH TAIL WITH VERTICAL STROKE
" U+02918 	⤘ 	\nVtwoheadrightarrowtail 	RIGHTWARDS TWO-HEADED ARROW WITH TAIL WITH DOUBLE VERTICAL STROKE
" U+0291D 	⤝ 	\diamondleftarrow 	LEFTWARDS ARROW TO BLACK DIAMOND
" U+0291E 	⤞ 	\rightarrowdiamond 	RIGHTWARDS ARROW TO BLACK DIAMOND
" U+0291F 	⤟ 	\diamondleftarrowbar 	LEFTWARDS ARROW FROM BAR TO BLACK DIAMOND
" U+02920 	⤠ 	\barrightarrowdiamond 	RIGHTWARDS ARROW FROM BAR TO BLACK DIAMOND
" U+02925 	⤥ 	\hksearow 	SOUTH EAST ARROW WITH HOOK
" U+02926 	⤦ 	\hkswarow 	SOUTH WEST ARROW WITH HOOK
" U+02927 	⤧ 	\tona 	NORTH WEST ARROW AND NORTH EAST ARROW
" U+02928 	⤨ 	\toea 	NORTH EAST ARROW AND SOUTH EAST ARROW
" U+02929 	⤩ 	\tosa 	SOUTH EAST ARROW AND SOUTH WEST ARROW
" U+0292A 	⤪ 	\towa 	SOUTH WEST ARROW AND NORTH WEST ARROW
" U+0292B 	⤫ 	\rdiagovfdiag 	RISING DIAGONAL CROSSING FALLING DIAGONAL
" U+0292C 	⤬ 	\fdiagovrdiag 	FALLING DIAGONAL CROSSING RISING DIAGONAL
" U+0292D 	⤭ 	\seovnearrow 	SOUTH EAST ARROW CROSSING NORTH EAST ARROW
" U+0292E 	⤮ 	\neovsearrow 	NORTH EAST ARROW CROSSING SOUTH EAST ARROW
" U+0292F 	⤯ 	\fdiagovnearrow 	FALLING DIAGONAL CROSSING NORTH EAST ARROW
" U+02930 	⤰ 	\rdiagovsearrow 	RISING DIAGONAL CROSSING SOUTH EAST ARROW
" U+02931 	⤱ 	\neovnwarrow 	NORTH EAST ARROW CROSSING NORTH WEST ARROW
" U+02932 	⤲ 	\nwovnearrow 	NORTH WEST ARROW CROSSING NORTH EAST ARROW
" U+02934 	⤴ 	\:arrow_heading_up: 	ARROW POINTING RIGHTWARDS THEN CURVING UPWARDS
" U+02935 	⤵ 	\:arrow_heading_down: 	ARROW POINTING RIGHTWARDS THEN CURVING DOWNWARDS
" U+02942 	⥂ 	\ElzRlarr 	RIGHTWARDS ARROW ABOVE SHORT LEFTWARDS ARROW
" U+02944 	⥄ 	\ElzrLarr 	SHORT RIGHTWARDS ARROW ABOVE LEFTWARDS ARROW
" U+02945 	⥅ 	\rightarrowplus 	RIGHTWARDS ARROW WITH PLUS BELOW
" U+02946 	⥆ 	\leftarrowplus 	LEFTWARDS ARROW WITH PLUS BELOW
" U+02947 	⥇ 	\Elzrarrx 	RIGHTWARDS ARROW THROUGH X
" U+02948 	⥈ 	\leftrightarrowcircle 	LEFT RIGHT ARROW THROUGH SMALL CIRCLE
" U+02949 	⥉ 	\twoheaduparrowcircle 	UPWARDS TWO-HEADED ARROW FROM SMALL CIRCLE
" U+0294A 	⥊ 	\leftrightharpoonupdown 	LEFT BARB UP RIGHT BARB DOWN HARPOON
" U+0294B 	⥋ 	\leftrightharpoondownup 	LEFT BARB DOWN RIGHT BARB UP HARPOON
" U+0294C 	⥌ 	\updownharpoonrightleft 	UP BARB RIGHT DOWN BARB LEFT HARPOON
" U+0294D 	⥍ 	\updownharpoonleftright 	UP BARB LEFT DOWN BARB RIGHT HARPOON
" U+0294E 	⥎ 	\LeftRightVector 	LEFT BARB UP RIGHT BARB UP HARPOON
" U+0294F 	⥏ 	\RightUpDownVector 	UP BARB RIGHT DOWN BARB RIGHT HARPOON
" U+02950 	⥐ 	\DownLeftRightVector 	LEFT BARB DOWN RIGHT BARB DOWN HARPOON
" U+02951 	⥑ 	\LeftUpDownVector 	UP BARB LEFT DOWN BARB LEFT HARPOON
" U+02952 	⥒ 	\LeftVectorBar 	LEFTWARDS HARPOON WITH BARB UP TO BAR
" U+02953 	⥓ 	\RightVectorBar 	RIGHTWARDS HARPOON WITH BARB UP TO BAR
" U+02954 	⥔ 	\RightUpVectorBar 	UPWARDS HARPOON WITH BARB RIGHT TO BAR
" U+02955 	⥕ 	\RightDownVectorBar 	DOWNWARDS HARPOON WITH BARB RIGHT TO BAR
" U+02956 	⥖ 	\DownLeftVectorBar 	LEFTWARDS HARPOON WITH BARB DOWN TO BAR
" U+02957 	⥗ 	\DownRightVectorBar 	RIGHTWARDS HARPOON WITH BARB DOWN TO BAR
" U+02958 	⥘ 	\LeftUpVectorBar 	UPWARDS HARPOON WITH BARB LEFT TO BAR
" U+02959 	⥙ 	\LeftDownVectorBar 	DOWNWARDS HARPOON WITH BARB LEFT TO BAR
" U+0295A 	⥚ 	\LeftTeeVector 	LEFTWARDS HARPOON WITH BARB UP FROM BAR
" U+0295B 	⥛ 	\RightTeeVector 	RIGHTWARDS HARPOON WITH BARB UP FROM BAR
" U+0295C 	⥜ 	\RightUpTeeVector 	UPWARDS HARPOON WITH BARB RIGHT FROM BAR
" U+0295D 	⥝ 	\RightDownTeeVector 	DOWNWARDS HARPOON WITH BARB RIGHT FROM BAR
" U+0295E 	⥞ 	\DownLeftTeeVector 	LEFTWARDS HARPOON WITH BARB DOWN FROM BAR
" U+0295F 	⥟ 	\DownRightTeeVector 	RIGHTWARDS HARPOON WITH BARB DOWN FROM BAR
" U+02960 	⥠ 	\LeftUpTeeVector 	UPWARDS HARPOON WITH BARB LEFT FROM BAR
" U+02961 	⥡ 	\LeftDownTeeVector 	DOWNWARDS HARPOON WITH BARB LEFT FROM BAR
" U+02962 	⥢ 	\leftharpoonsupdown 	LEFTWARDS HARPOON WITH BARB UP ABOVE LEFTWARDS HARPOON WITH BARB DOWN
" U+02963 	⥣ 	\upharpoonsleftright 	UPWARDS HARPOON WITH BARB LEFT BESIDE UPWARDS HARPOON WITH BARB RIGHT
" U+02964 	⥤ 	\rightharpoonsupdown 	RIGHTWARDS HARPOON WITH BARB UP ABOVE RIGHTWARDS HARPOON WITH BARB DOWN
" U+02965 	⥥ 	\downharpoonsleftright 	DOWNWARDS HARPOON WITH BARB LEFT BESIDE DOWNWARDS HARPOON WITH BARB RIGHT
" U+02966 	⥦ 	\leftrightharpoonsup 	LEFTWARDS HARPOON WITH BARB UP ABOVE RIGHTWARDS HARPOON WITH BARB UP
" U+02967 	⥧ 	\leftrightharpoonsdown 	LEFTWARDS HARPOON WITH BARB DOWN ABOVE RIGHTWARDS HARPOON WITH BARB DOWN
" U+02968 	⥨ 	\rightleftharpoonsup 	RIGHTWARDS HARPOON WITH BARB UP ABOVE LEFTWARDS HARPOON WITH BARB UP
" U+02969 	⥩ 	\rightleftharpoonsdown 	RIGHTWARDS HARPOON WITH BARB DOWN ABOVE LEFTWARDS HARPOON WITH BARB DOWN
" U+0296A 	⥪ 	\leftharpoonupdash 	LEFTWARDS HARPOON WITH BARB UP ABOVE LONG DASH
" U+0296B 	⥫ 	\dashleftharpoondown 	LEFTWARDS HARPOON WITH BARB DOWN BELOW LONG DASH
" U+0296C 	⥬ 	\rightharpoonupdash 	RIGHTWARDS HARPOON WITH BARB UP ABOVE LONG DASH
" U+0296D 	⥭ 	\dashrightharpoondown 	RIGHTWARDS HARPOON WITH BARB DOWN BELOW LONG DASH
" U+0296E 	⥮ 	\UpEquilibrium 	UPWARDS HARPOON WITH BARB LEFT BESIDE DOWNWARDS HARPOON WITH BARB RIGHT
" U+0296F 	⥯ 	\ReverseUpEquilibrium 	DOWNWARDS HARPOON WITH BARB LEFT BESIDE UPWARDS HARPOON WITH BARB RIGHT
" U+02970 	⥰ 	\RoundImplies 	RIGHT DOUBLE ARROW WITH ROUNDED HEAD
" U+02980 	⦀ 	\Vvert 	TRIPLE VERTICAL BAR DELIMITER
" U+02986 	⦆ 	\Elroang 	RIGHT WHITE PARENTHESIS
" U+02999 	⦙ 	\Elzddfnc 	DOTTED FENCE
" U+0299B 	⦛ 	\measuredangleleft 	MEASURED ANGLE OPENING LEFT
" U+0299C 	⦜ 	\Angle 	RIGHT ANGLE VARIANT WITH SQUARE
" U+0299D 	⦝ 	\rightanglemdot 	MEASURED RIGHT ANGLE WITH DOT
" U+0299E 	⦞ 	\angles 	ANGLE WITH S INSIDE
" U+0299F 	⦟ 	\angdnr 	ACUTE ANGLE
" U+029A0 	⦠ 	\Elzlpargt 	SPHERICAL ANGLE OPENING LEFT
" U+029A1 	⦡ 	\sphericalangleup 	SPHERICAL ANGLE OPENING UP
" U+029A2 	⦢ 	\turnangle 	TURNED ANGLE
" U+029A3 	⦣ 	\revangle 	REVERSED ANGLE
" U+029A4 	⦤ 	\angleubar 	ANGLE WITH UNDERBAR
" U+029A5 	⦥ 	\revangleubar 	REVERSED ANGLE WITH UNDERBAR
" U+029A6 	⦦ 	\wideangledown 	OBLIQUE ANGLE OPENING UP
" U+029A7 	⦧ 	\wideangleup 	OBLIQUE ANGLE OPENING DOWN
" U+029A8 	⦨ 	\measanglerutone 	MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING UP AND RIGHT
" U+029A9 	⦩ 	\measanglelutonw 	MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING UP AND LEFT
" U+029AA 	⦪ 	\measanglerdtose 	MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING DOWN AND RIGHT
" U+029AB 	⦫ 	\measangleldtosw 	MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING DOWN AND LEFT
" U+029AC 	⦬ 	\measangleurtone 	MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING RIGHT AND UP
" U+029AD 	⦭ 	\measangleultonw 	MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING LEFT AND UP
" U+029AE 	⦮ 	\measangledrtose 	MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING RIGHT AND DOWN
" U+029AF 	⦯ 	\measangledltosw 	MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING LEFT AND DOWN
" U+029B0 	⦰ 	\revemptyset 	REVERSED EMPTY SET
" U+029B1 	⦱ 	\emptysetobar 	EMPTY SET WITH OVERBAR
" U+029B2 	⦲ 	\emptysetocirc 	EMPTY SET WITH SMALL CIRCLE ABOVE
" U+029B3 	⦳ 	\emptysetoarr 	EMPTY SET WITH RIGHT ARROW ABOVE
" U+029B4 	⦴ 	\emptysetoarrl 	EMPTY SET WITH LEFT ARROW ABOVE
" U+029B7 	⦷ 	\circledparallel 	CIRCLED PARALLEL
" U+029B8 	⦸ 	\obslash 	CIRCLED REVERSE SOLIDUS
" U+029BC 	⦼ 	\odotslashdot 	CIRCLED ANTICLOCKWISE-ROTATED DIVISION SIGN
" U+029BE 	⦾ 	\circledwhitebullet 	CIRCLED WHITE BULLET
" U+029BF 	⦿ 	\circledbullet 	CIRCLED BULLET
" U+029C0 	⧀ 	\olessthan 	CIRCLED LESS-THAN
" U+029C1 	⧁ 	\ogreaterthan 	CIRCLED GREATER-THAN
" U+029C4 	⧄ 	\boxdiag 	SQUARED RISING DIAGONAL SLASH
" U+029C5 	⧅ 	\boxbslash 	SQUARED FALLING DIAGONAL SLASH
" U+029C6 	⧆ 	\boxast 	SQUARED ASTERISK
" U+029C7 	⧇ 	\boxcircle 	SQUARED SMALL CIRCLE
" U+029CA 	⧊ 	\ElzLap 	TRIANGLE WITH DOT ABOVE
" U+029CB 	⧋ 	\Elzdefas 	TRIANGLE WITH UNDERBAR
" U+029CF 	⧏ 	\LeftTriangleBar 	LEFT TRIANGLE BESIDE VERTICAL BAR
" U+029CF + U+00338 	⧏̸ 	\NotLeftTriangleBar 	LEFT TRIANGLE BESIDE VERTICAL BAR + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+029D0 	⧐ 	\RightTriangleBar 	VERTICAL BAR BESIDE RIGHT TRIANGLE
" U+029D0 + U+00338 	⧐̸ 	\NotRightTriangleBar 	VERTICAL BAR BESIDE RIGHT TRIANGLE + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+029DF 	⧟ 	\dualmap 	DOUBLE-ENDED MULTIMAP
" U+029E1 	⧡ 	\lrtriangleeq 	INCREASES AS
" U+029E2 	⧢ 	\shuffle 	SHUFFLE PRODUCT
" U+029E3 	⧣ 	\eparsl 	EQUALS SIGN AND SLANTED PARALLEL
" U+029E4 	⧤ 	\smeparsl 	EQUALS SIGN AND SLANTED PARALLEL WITH TILDE ABOVE
" U+029E5 	⧥ 	\eqvparsl 	IDENTICAL TO AND SLANTED PARALLEL
" U+029EB 	⧫ 	\blacklozenge 	BLACK LOZENGE
" U+029F4 	⧴ 	\RuleDelayed 	RULE-DELAYED
" U+029F6 	⧶ 	\dsol 	SOLIDUS WITH OVERBAR
" U+029F7 	⧷ 	\rsolbar 	REVERSE SOLIDUS WITH HORIZONTAL STROKE
" U+029FA 	⧺ 	\doubleplus 	DOUBLE PLUS
" U+029FB 	⧻ 	\tripleplus 	TRIPLE PLUS
" U+02A00 	⨀ 	\bigodot 	N-ARY CIRCLED DOT OPERATOR
" U+02A01 	⨁ 	\bigoplus 	N-ARY CIRCLED PLUS OPERATOR
" U+02A02 	⨂ 	\bigotimes 	N-ARY CIRCLED TIMES OPERATOR
" U+02A03 	⨃ 	\bigcupdot 	N-ARY UNION OPERATOR WITH DOT
" U+02A04 	⨄ 	\biguplus 	N-ARY UNION OPERATOR WITH PLUS
" U+02A05 	⨅ 	\bigsqcap 	N-ARY SQUARE INTERSECTION OPERATOR
" U+02A06 	⨆ 	\bigsqcup 	N-ARY SQUARE UNION OPERATOR
" U+02A07 	⨇ 	\conjquant 	TWO LOGICAL AND OPERATOR
" U+02A08 	⨈ 	\disjquant 	TWO LOGICAL OR OPERATOR
" U+02A09 	⨉ 	\bigtimes 	N-ARY TIMES OPERATOR
" U+02A0A 	⨊ 	\modtwosum 	MODULO TWO SUM
" U+02A0B 	⨋ 	\sumint 	SUMMATION WITH INTEGRAL
" U+02A0C 	⨌ 	\iiiint 	QUADRUPLE INTEGRAL OPERATOR
" U+02A0D 	⨍ 	\intbar 	FINITE PART INTEGRAL
" U+02A0E 	⨎ 	\intBar 	INTEGRAL WITH DOUBLE STROKE
" U+02A0F 	⨏ 	\clockoint 	INTEGRAL AVERAGE WITH SLASH
" U+02A10 	⨐ 	\cirfnint 	CIRCULATION FUNCTION
" U+02A11 	⨑ 	\awint 	ANTICLOCKWISE INTEGRATION
" U+02A12 	⨒ 	\rppolint 	LINE INTEGRATION WITH RECTANGULAR PATH AROUND POLE
" U+02A13 	⨓ 	\scpolint 	LINE INTEGRATION WITH SEMICIRCULAR PATH AROUND POLE
" U+02A14 	⨔ 	\npolint 	LINE INTEGRATION NOT INCLUDING THE POLE
" U+02A15 	⨕ 	\pointint 	INTEGRAL AROUND A POINT OPERATOR
" U+02A16 	⨖ 	\sqrint 	QUATERNION INTEGRAL OPERATOR
" U+02A18 	⨘ 	\intx 	INTEGRAL WITH TIMES SIGN
" U+02A19 	⨙ 	\intcap 	INTEGRAL WITH INTERSECTION
" U+02A1A 	⨚ 	\intcup 	INTEGRAL WITH UNION
" U+02A1B 	⨛ 	\upint 	INTEGRAL WITH OVERBAR
" U+02A1C 	⨜ 	\lowint 	INTEGRAL WITH UNDERBAR
" U+02A22 	⨢ 	\ringplus 	PLUS SIGN WITH SMALL CIRCLE ABOVE
" U+02A23 	⨣ 	\plushat 	PLUS SIGN WITH CIRCUMFLEX ACCENT ABOVE
" U+02A24 	⨤ 	\simplus 	PLUS SIGN WITH TILDE ABOVE
" U+02A25 	⨥ 	\plusdot 	PLUS SIGN WITH DOT BELOW
" U+02A26 	⨦ 	\plussim 	PLUS SIGN WITH TILDE BELOW
" U+02A27 	⨧ 	\plussubtwo 	PLUS SIGN WITH SUBSCRIPT TWO
" U+02A28 	⨨ 	\plustrif 	PLUS SIGN WITH BLACK TRIANGLE
" U+02A29 	⨩ 	\commaminus 	MINUS SIGN WITH COMMA ABOVE
" U+02A2A 	⨪ 	\minusdot 	MINUS SIGN WITH DOT BELOW
" U+02A2B 	⨫ 	\minusfdots 	MINUS SIGN WITH FALLING DOTS
" U+02A2C 	⨬ 	\minusrdots 	MINUS SIGN WITH RISING DOTS
" U+02A2D 	⨭ 	\opluslhrim 	PLUS SIGN IN LEFT HALF CIRCLE
" U+02A2E 	⨮ 	\oplusrhrim 	PLUS SIGN IN RIGHT HALF CIRCLE
" U+02A2F 	⨯ 	\ElzTimes 	VECTOR OR CROSS PRODUCT
" U+02A30 	⨰ 	\dottimes 	MULTIPLICATION SIGN WITH DOT ABOVE
" U+02A31 	⨱ 	\timesbar 	MULTIPLICATION SIGN WITH UNDERBAR
" U+02A32 	⨲ 	\btimes 	SEMIDIRECT PRODUCT WITH BOTTOM CLOSED
" U+02A33 	⨳ 	\smashtimes 	SMASH PRODUCT
" U+02A34 	⨴ 	\otimeslhrim 	MULTIPLICATION SIGN IN LEFT HALF CIRCLE
" U+02A35 	⨵ 	\otimesrhrim 	MULTIPLICATION SIGN IN RIGHT HALF CIRCLE
" U+02A36 	⨶ 	\otimeshat 	CIRCLED MULTIPLICATION SIGN WITH CIRCUMFLEX ACCENT
" U+02A37 	⨷ 	\Otimes 	MULTIPLICATION SIGN IN DOUBLE CIRCLE
" U+02A38 	⨸ 	\odiv 	CIRCLED DIVISION SIGN
" U+02A39 	⨹ 	\triangleplus 	PLUS SIGN IN TRIANGLE
" U+02A3A 	⨺ 	\triangleminus 	MINUS SIGN IN TRIANGLE
" U+02A3B 	⨻ 	\triangletimes 	MULTIPLICATION SIGN IN TRIANGLE
" U+02A3C 	⨼ 	\intprod 	INTERIOR PRODUCT
" U+02A3D 	⨽ 	\intprodr 	RIGHTHAND INTERIOR PRODUCT
" U+02A3F 	⨿ 	\amalg 	AMALGAMATION OR COPRODUCT
" U+02A40 	⩀ 	\capdot 	INTERSECTION WITH DOT
" U+02A41 	⩁ 	\uminus 	UNION WITH MINUS SIGN
" U+02A42 	⩂ 	\barcup 	UNION WITH OVERBAR
" U+02A43 	⩃ 	\barcap 	INTERSECTION WITH OVERBAR
" U+02A44 	⩄ 	\capwedge 	INTERSECTION WITH LOGICAL AND
" U+02A45 	⩅ 	\cupvee 	UNION WITH LOGICAL OR
" U+02A4A 	⩊ 	\twocups 	UNION BESIDE AND JOINED WITH UNION
" U+02A4B 	⩋ 	\twocaps 	INTERSECTION BESIDE AND JOINED WITH INTERSECTION
" U+02A4C 	⩌ 	\closedvarcup 	CLOSED UNION WITH SERIFS
" U+02A4D 	⩍ 	\closedvarcap 	CLOSED INTERSECTION WITH SERIFS
" U+02A4E 	⩎ 	\Sqcap 	DOUBLE SQUARE INTERSECTION
" U+02A4F 	⩏ 	\Sqcup 	DOUBLE SQUARE UNION
" U+02A50 	⩐ 	\closedvarcupsmashprod 	CLOSED UNION WITH SERIFS AND SMASH PRODUCT
" U+02A51 	⩑ 	\wedgeodot 	LOGICAL AND WITH DOT ABOVE
" U+02A52 	⩒ 	\veeodot 	LOGICAL OR WITH DOT ABOVE
" U+02A53 	⩓ 	\ElzAnd 	DOUBLE LOGICAL AND
" U+02A54 	⩔ 	\ElzOr 	DOUBLE LOGICAL OR
" U+02A55 	⩕ 	\wedgeonwedge 	TWO INTERSECTING LOGICAL AND
" U+02A56 	⩖ 	\ElOr 	TWO INTERSECTING LOGICAL OR
" U+02A57 	⩗ 	\bigslopedvee 	SLOPING LARGE OR
" U+02A58 	⩘ 	\bigslopedwedge 	SLOPING LARGE AND
" U+02A5A 	⩚ 	\wedgemidvert 	LOGICAL AND WITH MIDDLE STEM
" U+02A5B 	⩛ 	\veemidvert 	LOGICAL OR WITH MIDDLE STEM
" U+02A5C 	⩜ 	\midbarwedge 	LOGICAL AND WITH HORIZONTAL DASH
" U+02A5D 	⩝ 	\midbarvee 	LOGICAL OR WITH HORIZONTAL DASH
" U+02A5E 	⩞ 	\perspcorrespond 	LOGICAL AND WITH DOUBLE OVERBAR
" U+02A5F 	⩟ 	\Elzminhat 	LOGICAL AND WITH UNDERBAR
" U+02A60 	⩠ 	\wedgedoublebar 	LOGICAL AND WITH DOUBLE UNDERBAR
" U+02A61 	⩡ 	\varveebar 	SMALL VEE WITH UNDERBAR
" U+02A62 	⩢ 	\doublebarvee 	LOGICAL OR WITH DOUBLE OVERBAR
" U+02A63 	⩣ 	\veedoublebar 	LOGICAL OR WITH DOUBLE UNDERBAR
" U+02A66 	⩦ 	\eqdot 	EQUALS SIGN WITH DOT BELOW
" U+02A67 	⩧ 	\dotequiv 	IDENTICAL WITH DOT ABOVE
" U+02A6A 	⩪ 	\dotsim 	TILDE OPERATOR WITH DOT ABOVE
" U+02A6B 	⩫ 	\simrdots 	TILDE OPERATOR WITH RISING DOTS
" U+02A6C 	⩬ 	\simminussim 	SIMILAR MINUS SIMILAR
" U+02A6D 	⩭ 	\congdot 	CONGRUENT WITH DOT ABOVE
" U+02A6E 	⩮ 	\asteq 	EQUALS WITH ASTERISK
" U+02A6F 	⩯ 	\hatapprox 	ALMOST EQUAL TO WITH CIRCUMFLEX ACCENT
" U+02A70 	⩰ 	\approxeqq 	APPROXIMATELY EQUAL OR EQUAL TO
" U+02A71 	⩱ 	\eqqplus 	EQUALS SIGN ABOVE PLUS SIGN
" U+02A72 	⩲ 	\pluseqq 	PLUS SIGN ABOVE EQUALS SIGN
" U+02A73 	⩳ 	\eqqsim 	EQUALS SIGN ABOVE TILDE OPERATOR
" U+02A74 	⩴ 	\Coloneq 	DOUBLE COLON EQUAL
" U+02A75 	⩵ 	\Equal 	TWO CONSECUTIVE EQUALS SIGNS
" U+02A76 	⩶ 	\eqeqeq 	THREE CONSECUTIVE EQUALS SIGNS
" U+02A77 	⩷ 	\ddotseq 	EQUALS SIGN WITH TWO DOTS ABOVE AND TWO DOTS BELOW
" U+02A78 	⩸ 	\equivDD 	EQUIVALENT WITH FOUR DOTS ABOVE
" U+02A79 	⩹ 	\ltcir 	LESS-THAN WITH CIRCLE INSIDE
" U+02A7A 	⩺ 	\gtcir 	GREATER-THAN WITH CIRCLE INSIDE
" U+02A7B 	⩻ 	\ltquest 	LESS-THAN WITH QUESTION MARK ABOVE
" U+02A7C 	⩼ 	\gtquest 	GREATER-THAN WITH QUESTION MARK ABOVE
" U+02A7D 	⩽ 	\leqslant 	LESS-THAN OR SLANTED EQUAL TO
" U+02A7D + U+00338 	⩽̸ 	\nleqslant 	LESS-THAN OR SLANTED EQUAL TO + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+02A7E 	⩾ 	\geqslant 	GREATER-THAN OR SLANTED EQUAL TO
" U+02A7E + U+00338 	⩾̸ 	\ngeqslant 	GREATER-THAN OR SLANTED EQUAL TO + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+02A7F 	⩿ 	\lesdot 	LESS-THAN OR SLANTED EQUAL TO WITH DOT INSIDE
" U+02A80 	⪀ 	\gesdot 	GREATER-THAN OR SLANTED EQUAL TO WITH DOT INSIDE
" U+02A81 	⪁ 	\lesdoto 	LESS-THAN OR SLANTED EQUAL TO WITH DOT ABOVE
" U+02A82 	⪂ 	\gesdoto 	GREATER-THAN OR SLANTED EQUAL TO WITH DOT ABOVE
" U+02A83 	⪃ 	\lesdotor 	LESS-THAN OR SLANTED EQUAL TO WITH DOT ABOVE RIGHT
" U+02A84 	⪄ 	\gesdotol 	GREATER-THAN OR SLANTED EQUAL TO WITH DOT ABOVE LEFT
" U+02A85 	⪅ 	\lessapprox 	LESS-THAN OR APPROXIMATE
" U+02A86 	⪆ 	\gtrapprox 	GREATER-THAN OR APPROXIMATE
" U+02A87 	⪇ 	\lneq 	LESS-THAN AND SINGLE-LINE NOT EQUAL TO
" U+02A88 	⪈ 	\gneq 	GREATER-THAN AND SINGLE-LINE NOT EQUAL TO
" U+02A89 	⪉ 	\lnapprox 	LESS-THAN AND NOT APPROXIMATE
" U+02A8A 	⪊ 	\gnapprox 	GREATER-THAN AND NOT APPROXIMATE
" U+02A8B 	⪋ 	\lesseqqgtr 	LESS-THAN ABOVE DOUBLE-LINE EQUAL ABOVE GREATER-THAN
" U+02A8C 	⪌ 	\gtreqqless 	GREATER-THAN ABOVE DOUBLE-LINE EQUAL ABOVE LESS-THAN
" U+02A8D 	⪍ 	\lsime 	LESS-THAN ABOVE SIMILAR OR EQUAL
" U+02A8E 	⪎ 	\gsime 	GREATER-THAN ABOVE SIMILAR OR EQUAL
" U+02A8F 	⪏ 	\lsimg 	LESS-THAN ABOVE SIMILAR ABOVE GREATER-THAN
" U+02A90 	⪐ 	\gsiml 	GREATER-THAN ABOVE SIMILAR ABOVE LESS-THAN
" U+02A91 	⪑ 	\lgE 	LESS-THAN ABOVE GREATER-THAN ABOVE DOUBLE-LINE EQUAL
" U+02A92 	⪒ 	\glE 	GREATER-THAN ABOVE LESS-THAN ABOVE DOUBLE-LINE EQUAL
" U+02A93 	⪓ 	\lesges 	LESS-THAN ABOVE SLANTED EQUAL ABOVE GREATER-THAN ABOVE SLANTED EQUAL
" U+02A94 	⪔ 	\gesles 	GREATER-THAN ABOVE SLANTED EQUAL ABOVE LESS-THAN ABOVE SLANTED EQUAL
" U+02A95 	⪕ 	\eqslantless 	SLANTED EQUAL TO OR LESS-THAN
" U+02A96 	⪖ 	\eqslantgtr 	SLANTED EQUAL TO OR GREATER-THAN
" U+02A97 	⪗ 	\elsdot 	SLANTED EQUAL TO OR LESS-THAN WITH DOT INSIDE
" U+02A98 	⪘ 	\egsdot 	SLANTED EQUAL TO OR GREATER-THAN WITH DOT INSIDE
" U+02A99 	⪙ 	\eqqless 	DOUBLE-LINE EQUAL TO OR LESS-THAN
" U+02A9A 	⪚ 	\eqqgtr 	DOUBLE-LINE EQUAL TO OR GREATER-THAN
" U+02A9B 	⪛ 	\eqqslantless 	DOUBLE-LINE SLANTED EQUAL TO OR LESS-THAN
" U+02A9C 	⪜ 	\eqqslantgtr 	DOUBLE-LINE SLANTED EQUAL TO OR GREATER-THAN
" U+02A9D 	⪝ 	\simless 	SIMILAR OR LESS-THAN
" U+02A9E 	⪞ 	\simgtr 	SIMILAR OR GREATER-THAN
" U+02A9F 	⪟ 	\simlE 	SIMILAR ABOVE LESS-THAN ABOVE EQUALS SIGN
" U+02AA0 	⪠ 	\simgE 	SIMILAR ABOVE GREATER-THAN ABOVE EQUALS SIGN
" U+02AA1 	⪡ 	\NestedLessLess 	DOUBLE NESTED LESS-THAN
" U+02AA1 + U+00338 	⪡̸ 	\NotNestedLessLess 	DOUBLE NESTED LESS-THAN + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+02AA2 	⪢ 	\NestedGreaterGreater 	DOUBLE NESTED GREATER-THAN
" U+02AA2 + U+00338 	⪢̸ 	\NotNestedGreaterGreater 	DOUBLE NESTED GREATER-THAN + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+02AA3 	⪣ 	\partialmeetcontraction 	DOUBLE NESTED LESS-THAN WITH UNDERBAR
" U+02AA4 	⪤ 	\glj 	GREATER-THAN OVERLAPPING LESS-THAN
" U+02AA5 	⪥ 	\gla 	GREATER-THAN BESIDE LESS-THAN
" U+02AA6 	⪦ 	\ltcc 	LESS-THAN CLOSED BY CURVE
" U+02AA7 	⪧ 	\gtcc 	GREATER-THAN CLOSED BY CURVE
" U+02AA8 	⪨ 	\lescc 	LESS-THAN CLOSED BY CURVE ABOVE SLANTED EQUAL
" U+02AA9 	⪩ 	\gescc 	GREATER-THAN CLOSED BY CURVE ABOVE SLANTED EQUAL
" U+02AAA 	⪪ 	\smt 	SMALLER THAN
" U+02AAB 	⪫ 	\lat 	LARGER THAN
" U+02AAC 	⪬ 	\smte 	SMALLER THAN OR EQUAL TO
" U+02AAD 	⪭ 	\late 	LARGER THAN OR EQUAL TO
" U+02AAE 	⪮ 	\bumpeqq 	EQUALS SIGN WITH BUMPY ABOVE
" U+02AAF 	⪯ 	\preceq 	PRECEDES ABOVE SINGLE-LINE EQUALS SIGN
" U+02AAF + U+00338 	⪯̸ 	\npreceq 	PRECEDES ABOVE SINGLE-LINE EQUALS SIGN + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+02AB0 	⪰ 	\succeq 	SUCCEEDS ABOVE SINGLE-LINE EQUALS SIGN
" U+02AB0 + U+00338 	⪰̸ 	\nsucceq 	SUCCEEDS ABOVE SINGLE-LINE EQUALS SIGN + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+02AB1 	⪱ 	\precneq 	PRECEDES ABOVE SINGLE-LINE NOT EQUAL TO
" U+02AB2 	⪲ 	\succneq 	SUCCEEDS ABOVE SINGLE-LINE NOT EQUAL TO
" U+02AB3 	⪳ 	\preceqq 	PRECEDES ABOVE EQUALS SIGN
" U+02AB4 	⪴ 	\succeqq 	SUCCEEDS ABOVE EQUALS SIGN
" U+02AB5 	⪵ 	\precneqq 	PRECEDES ABOVE NOT EQUAL TO
" U+02AB6 	⪶ 	\succneqq 	SUCCEEDS ABOVE NOT EQUAL TO
" U+02AB7 	⪷ 	\precapprox 	PRECEDES ABOVE ALMOST EQUAL TO
" U+02AB8 	⪸ 	\succapprox 	SUCCEEDS ABOVE ALMOST EQUAL TO
" U+02AB9 	⪹ 	\precnapprox 	PRECEDES ABOVE NOT ALMOST EQUAL TO
" U+02ABA 	⪺ 	\succnapprox 	SUCCEEDS ABOVE NOT ALMOST EQUAL TO
" U+02ABB 	⪻ 	\Prec 	DOUBLE PRECEDES
" U+02ABC 	⪼ 	\Succ 	DOUBLE SUCCEEDS
" U+02ABD 	⪽ 	\subsetdot 	SUBSET WITH DOT
" U+02ABE 	⪾ 	\supsetdot 	SUPERSET WITH DOT
" U+02ABF 	⪿ 	\subsetplus 	SUBSET WITH PLUS SIGN BELOW
" U+02AC0 	⫀ 	\supsetplus 	SUPERSET WITH PLUS SIGN BELOW
" U+02AC1 	⫁ 	\submult 	SUBSET WITH MULTIPLICATION SIGN BELOW
" U+02AC2 	⫂ 	\supmult 	SUPERSET WITH MULTIPLICATION SIGN BELOW
" U+02AC3 	⫃ 	\subedot 	SUBSET OF OR EQUAL TO WITH DOT ABOVE
" U+02AC4 	⫄ 	\supedot 	SUPERSET OF OR EQUAL TO WITH DOT ABOVE
" U+02AC5 	⫅ 	\subseteqq 	SUBSET OF ABOVE EQUALS SIGN
" U+02AC5 + U+00338 	⫅̸ 	\nsubseteqq 	SUBSET OF ABOVE EQUALS SIGN + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+02AC6 	⫆ 	\supseteqq 	SUPERSET OF ABOVE EQUALS SIGN
" U+02AC6 + U+00338 	⫆̸ 	\nsupseteqq 	SUPERSET OF ABOVE EQUALS SIGN + COMBINING LONG SOLIDUS OVERLAY / NON-SPACING LONG SLASH OVERLAY
" U+02AC7 	⫇ 	\subsim 	SUBSET OF ABOVE TILDE OPERATOR
" U+02AC8 	⫈ 	\supsim 	SUPERSET OF ABOVE TILDE OPERATOR
" U+02AC9 	⫉ 	\subsetapprox 	SUBSET OF ABOVE ALMOST EQUAL TO
" U+02ACA 	⫊ 	\supsetapprox 	SUPERSET OF ABOVE ALMOST EQUAL TO
" U+02ACB 	⫋ 	\subsetneqq 	SUBSET OF ABOVE NOT EQUAL TO
" U+02ACC 	⫌ 	\supsetneqq 	SUPERSET OF ABOVE NOT EQUAL TO
" U+02ACD 	⫍ 	\lsqhook 	SQUARE LEFT OPEN BOX OPERATOR
" U+02ACE 	⫎ 	\rsqhook 	SQUARE RIGHT OPEN BOX OPERATOR
" U+02ACF 	⫏ 	\csub 	CLOSED SUBSET
" U+02AD0 	⫐ 	\csup 	CLOSED SUPERSET
" U+02AD1 	⫑ 	\csube 	CLOSED SUBSET OR EQUAL TO
" U+02AD2 	⫒ 	\csupe 	CLOSED SUPERSET OR EQUAL TO
" U+02AD3 	⫓ 	\subsup 	SUBSET ABOVE SUPERSET
" U+02AD4 	⫔ 	\supsub 	SUPERSET ABOVE SUBSET
" U+02AD5 	⫕ 	\subsub 	SUBSET ABOVE SUBSET
" U+02AD6 	⫖ 	\supsup 	SUPERSET ABOVE SUPERSET
" U+02AD7 	⫗ 	\suphsub 	SUPERSET BESIDE SUBSET
" U+02AD8 	⫘ 	\supdsub 	SUPERSET BESIDE AND JOINED BY DASH WITH SUBSET
" U+02AD9 	⫙ 	\forkv 	ELEMENT OF OPENING DOWNWARDS
" U+02ADB 	⫛ 	\mlcp 	TRANSVERSAL INTERSECTION
" U+02ADC 	⫝̸ 	\forks 	FORKING
" U+02ADD 	⫝ 	\forksnot 	NONFORKING
" U+02AE3 	⫣ 	\dashV 	DOUBLE VERTICAL BAR LEFT TURNSTILE
" U+02AE4 	⫤ 	\Dashv 	VERTICAL BAR DOUBLE LEFT TURNSTILE
" U+02AF4 	⫴ 	\interleave 	TRIPLE VERTICAL BAR BINARY RELATION
" U+02AF6 	⫶ 	\Elztdcol 	TRIPLE COLON OPERATOR
" U+02AF7 	⫷ 	\lllnest 	TRIPLE NESTED LESS-THAN
" U+02AF8 	⫸ 	\gggnest 	TRIPLE NESTED GREATER-THAN
" U+02AF9 	⫹ 	\leqqslant 	DOUBLE-LINE SLANTED LESS-THAN OR EQUAL TO
" U+02AFA 	⫺ 	\geqqslant 	DOUBLE-LINE SLANTED GREATER-THAN OR EQUAL TO
" U+02B05 	⬅ 	\:arrow_left: 	LEFTWARDS BLACK ARROW
" U+02B06 	⬆ 	\:arrow_up: 	UPWARDS BLACK ARROW
" U+02B07 	⬇ 	\:arrow_down: 	DOWNWARDS BLACK ARROW
" U+02B12 	⬒ 	\squaretopblack 	SQUARE WITH TOP HALF BLACK
" U+02B13 	⬓ 	\squarebotblack 	SQUARE WITH BOTTOM HALF BLACK
" U+02B14 	⬔ 	\squareurblack 	SQUARE WITH UPPER RIGHT DIAGONAL HALF BLACK
" U+02B15 	⬕ 	\squarellblack 	SQUARE WITH LOWER LEFT DIAGONAL HALF BLACK
" U+02B16 	⬖ 	\diamondleftblack 	DIAMOND WITH LEFT HALF BLACK
" U+02B17 	⬗ 	\diamondrightblack 	DIAMOND WITH RIGHT HALF BLACK
" U+02B18 	⬘ 	\diamondtopblack 	DIAMOND WITH TOP HALF BLACK
" U+02B19 	⬙ 	\diamondbotblack 	DIAMOND WITH BOTTOM HALF BLACK
" U+02B1A 	⬚ 	\dottedsquare 	DOTTED SQUARE
" U+02B1B 	⬛ 	\lgblksquare, \:black_large_square: 	BLACK LARGE SQUARE
" U+02B1C 	⬜ 	\lgwhtsquare, \:white_large_square: 	WHITE LARGE SQUARE
" U+02B1D 	⬝ 	\vysmblksquare 	BLACK VERY SMALL SQUARE
" U+02B1E 	⬞ 	\vysmwhtsquare 	WHITE VERY SMALL SQUARE
" U+02B1F 	⬟ 	\pentagonblack 	BLACK PENTAGON
" U+02B20 	⬠ 	\pentagon 	WHITE PENTAGON
" U+02B21 	⬡ 	\varhexagon 	WHITE HEXAGON
" U+02B22 	⬢ 	\varhexagonblack 	BLACK HEXAGON
" U+02B23 	⬣ 	\hexagonblack 	HORIZONTAL BLACK HEXAGON
" U+02B24 	⬤ 	\lgblkcircle 	BLACK LARGE CIRCLE
" U+02B25 	⬥ 	\mdblkdiamond 	BLACK MEDIUM DIAMOND
" U+02B26 	⬦ 	\mdwhtdiamond 	WHITE MEDIUM DIAMOND
" U+02B27 	⬧ 	\mdblklozenge 	BLACK MEDIUM LOZENGE
" U+02B28 	⬨ 	\mdwhtlozenge 	WHITE MEDIUM LOZENGE
" U+02B29 	⬩ 	\smblkdiamond 	BLACK SMALL DIAMOND
" U+02B2A 	⬪ 	\smblklozenge 	BLACK SMALL LOZENGE
" U+02B2B 	⬫ 	\smwhtlozenge 	WHITE SMALL LOZENGE
" U+02B2C 	⬬ 	\blkhorzoval 	BLACK HORIZONTAL ELLIPSE
" U+02B2D 	⬭ 	\whthorzoval 	WHITE HORIZONTAL ELLIPSE
" U+02B2E 	⬮ 	\blkvertoval 	BLACK VERTICAL ELLIPSE
" U+02B2F 	⬯ 	\whtvertoval 	WHITE VERTICAL ELLIPSE
" U+02B30 	⬰ 	\circleonleftarrow 	LEFT ARROW WITH SMALL CIRCLE
" U+02B31 	⬱ 	\leftthreearrows 	THREE LEFTWARDS ARROWS
" U+02B32 	⬲ 	\leftarrowonoplus 	LEFT ARROW WITH CIRCLED PLUS
" U+02B33 	⬳ 	\longleftsquigarrow 	LONG LEFTWARDS SQUIGGLE ARROW
" U+02B34 	⬴ 	\nvtwoheadleftarrow 	LEFTWARDS TWO-HEADED ARROW WITH VERTICAL STROKE
" U+02B35 	⬵ 	\nVtwoheadleftarrow 	LEFTWARDS TWO-HEADED ARROW WITH DOUBLE VERTICAL STROKE
" U+02B36 	⬶ 	\twoheadmapsfrom 	LEFTWARDS TWO-HEADED ARROW FROM BAR
" U+02B37 	⬷ 	\twoheadleftdbkarrow 	LEFTWARDS TWO-HEADED TRIPLE DASH ARROW
" U+02B38 	⬸ 	\leftdotarrow 	LEFTWARDS ARROW WITH DOTTED STEM
" U+02B39 	⬹ 	\nvleftarrowtail 	LEFTWARDS ARROW WITH TAIL WITH VERTICAL STROKE
" U+02B3A 	⬺ 	\nVleftarrowtail 	LEFTWARDS ARROW WITH TAIL WITH DOUBLE VERTICAL STROKE
" U+02B3B 	⬻ 	\twoheadleftarrowtail 	LEFTWARDS TWO-HEADED ARROW WITH TAIL
" U+02B3C 	⬼ 	\nvtwoheadleftarrowtail 	LEFTWARDS TWO-HEADED ARROW WITH TAIL WITH VERTICAL STROKE
" U+02B3D 	⬽ 	\nVtwoheadleftarrowtail 	LEFTWARDS TWO-HEADED ARROW WITH TAIL WITH DOUBLE VERTICAL STROKE
" U+02B3E 	⬾ 	\leftarrowx 	LEFTWARDS ARROW THROUGH X
" U+02B3F 	⬿ 	\leftcurvedarrow 	WAVE ARROW POINTING DIRECTLY LEFT
" U+02B40 	⭀ 	\equalleftarrow 	EQUALS SIGN ABOVE LEFTWARDS ARROW
" U+02B41 	⭁ 	\bsimilarleftarrow 	REVERSE TILDE OPERATOR ABOVE LEFTWARDS ARROW
" U+02B42 	⭂ 	\leftarrowbackapprox 	LEFTWARDS ARROW ABOVE REVERSE ALMOST EQUAL TO
" U+02B43 	⭃ 	\rightarrowgtr 	RIGHTWARDS ARROW THROUGH GREATER-THAN
" U+02B44 	⭄ 	\rightarrowsupset 	RIGHTWARDS ARROW THROUGH SUPERSET
" U+02B45 	⭅ 	\LLeftarrow 	LEFTWARDS QUADRUPLE ARROW
" U+02B46 	⭆ 	\RRightarrow 	RIGHTWARDS QUADRUPLE ARROW
" U+02B47 	⭇ 	\bsimilarrightarrow 	REVERSE TILDE OPERATOR ABOVE RIGHTWARDS ARROW
" U+02B48 	⭈ 	\rightarrowbackapprox 	RIGHTWARDS ARROW ABOVE REVERSE ALMOST EQUAL TO
" U+02B49 	⭉ 	\similarleftarrow 	TILDE OPERATOR ABOVE LEFTWARDS ARROW
" U+02B4A 	⭊ 	\leftarrowapprox 	LEFTWARDS ARROW ABOVE ALMOST EQUAL TO
" U+02B4B 	⭋ 	\leftarrowbsimilar 	LEFTWARDS ARROW ABOVE REVERSE TILDE OPERATOR
" U+02B4C 	⭌ 	\rightarrowbsimilar 	RIGHTWARDS ARROW ABOVE REVERSE TILDE OPERATOR
" U+02B50 	⭐ 	\medwhitestar, \:star: 	WHITE MEDIUM STAR
" U+02B51 	⭑ 	\medblackstar 	BLACK SMALL STAR
" U+02B52 	⭒ 	\smwhitestar 	WHITE SMALL STAR
" U+02B53 	⭓ 	\rightpentagonblack 	BLACK RIGHT-POINTING PENTAGON
" U+02B54 	⭔ 	\rightpentagon 	WHITE RIGHT-POINTING PENTAGON
" U+02B55 	⭕ 	\:o: 	HEAVY LARGE CIRCLE
" U+02C7C 	ⱼ 	\_j 	LATIN SUBSCRIPT SMALL LETTER J
" U+02C7D 	ⱽ 	\^V 	MODIFIER LETTER CAPITAL V
" U+03012 	〒 	\postalmark 	POSTAL MARK
" U+03030 	〰 	\:wavy_dash: 	WAVY DASH
" U+0303D 	〽 	\:part_alternation_mark: 	PART ALTERNATION MARK
" U+03297 	㊗ 	\:congratulations: 	CIRCLED IDEOGRAPH CONGRATULATION
" U+03299 	㊙ 	\:secret: 	CIRCLED IDEOGRAPH SECRET
" U+1D400 	𝐀 	\mbfA 	MATHEMATICAL BOLD CAPITAL A
" U+1D401 	𝐁 	\mbfB 	MATHEMATICAL BOLD CAPITAL B
" U+1D402 	𝐂 	\mbfC 	MATHEMATICAL BOLD CAPITAL C
" U+1D403 	𝐃 	\mbfD 	MATHEMATICAL BOLD CAPITAL D
" U+1D404 	𝐄 	\mbfE 	MATHEMATICAL BOLD CAPITAL E
" U+1D405 	𝐅 	\mbfF 	MATHEMATICAL BOLD CAPITAL F
" U+1D406 	𝐆 	\mbfG 	MATHEMATICAL BOLD CAPITAL G
" U+1D407 	𝐇 	\mbfH 	MATHEMATICAL BOLD CAPITAL H
" U+1D408 	𝐈 	\mbfI 	MATHEMATICAL BOLD CAPITAL I
" U+1D409 	𝐉 	\mbfJ 	MATHEMATICAL BOLD CAPITAL J
" U+1D40A 	𝐊 	\mbfK 	MATHEMATICAL BOLD CAPITAL K
" U+1D40B 	𝐋 	\mbfL 	MATHEMATICAL BOLD CAPITAL L
" U+1D40C 	𝐌 	\mbfM 	MATHEMATICAL BOLD CAPITAL M
" U+1D40D 	𝐍 	\mbfN 	MATHEMATICAL BOLD CAPITAL N
" U+1D40E 	𝐎 	\mbfO 	MATHEMATICAL BOLD CAPITAL O
" U+1D40F 	𝐏 	\mbfP 	MATHEMATICAL BOLD CAPITAL P
" U+1D410 	𝐐 	\mbfQ 	MATHEMATICAL BOLD CAPITAL Q
" U+1D411 	𝐑 	\mbfR 	MATHEMATICAL BOLD CAPITAL R
" U+1D412 	𝐒 	\mbfS 	MATHEMATICAL BOLD CAPITAL S
" U+1D413 	𝐓 	\mbfT 	MATHEMATICAL BOLD CAPITAL T
" U+1D414 	𝐔 	\mbfU 	MATHEMATICAL BOLD CAPITAL U
" U+1D415 	𝐕 	\mbfV 	MATHEMATICAL BOLD CAPITAL V
" U+1D416 	𝐖 	\mbfW 	MATHEMATICAL BOLD CAPITAL W
" U+1D417 	𝐗 	\mbfX 	MATHEMATICAL BOLD CAPITAL X
" U+1D418 	𝐘 	\mbfY 	MATHEMATICAL BOLD CAPITAL Y
" U+1D419 	𝐙 	\mbfZ 	MATHEMATICAL BOLD CAPITAL Z
" U+1D41A 	𝐚 	\mbfa 	MATHEMATICAL BOLD SMALL A
" U+1D41B 	𝐛 	\mbfb 	MATHEMATICAL BOLD SMALL B
" U+1D41C 	𝐜 	\mbfc 	MATHEMATICAL BOLD SMALL C
" U+1D41D 	𝐝 	\mbfd 	MATHEMATICAL BOLD SMALL D
" U+1D41E 	𝐞 	\mbfe 	MATHEMATICAL BOLD SMALL E
" U+1D41F 	𝐟 	\mbff 	MATHEMATICAL BOLD SMALL F
" U+1D420 	𝐠 	\mbfg 	MATHEMATICAL BOLD SMALL G
" U+1D421 	𝐡 	\mbfh 	MATHEMATICAL BOLD SMALL H
" U+1D422 	𝐢 	\mbfi 	MATHEMATICAL BOLD SMALL I
" U+1D423 	𝐣 	\mbfj 	MATHEMATICAL BOLD SMALL J
" U+1D424 	𝐤 	\mbfk 	MATHEMATICAL BOLD SMALL K
" U+1D425 	𝐥 	\mbfl 	MATHEMATICAL BOLD SMALL L
" U+1D426 	𝐦 	\mbfm 	MATHEMATICAL BOLD SMALL M
" U+1D427 	𝐧 	\mbfn 	MATHEMATICAL BOLD SMALL N
" U+1D428 	𝐨 	\mbfo 	MATHEMATICAL BOLD SMALL O
" U+1D429 	𝐩 	\mbfp 	MATHEMATICAL BOLD SMALL P
" U+1D42A 	𝐪 	\mbfq 	MATHEMATICAL BOLD SMALL Q
" U+1D42B 	𝐫 	\mbfr 	MATHEMATICAL BOLD SMALL R
" U+1D42C 	𝐬 	\mbfs 	MATHEMATICAL BOLD SMALL S
" U+1D42D 	𝐭 	\mbft 	MATHEMATICAL BOLD SMALL T
" U+1D42E 	𝐮 	\mbfu 	MATHEMATICAL BOLD SMALL U
" U+1D42F 	𝐯 	\mbfv 	MATHEMATICAL BOLD SMALL V
" U+1D430 	𝐰 	\mbfw 	MATHEMATICAL BOLD SMALL W
" U+1D431 	𝐱 	\mbfx 	MATHEMATICAL BOLD SMALL X
" U+1D432 	𝐲 	\mbfy 	MATHEMATICAL BOLD SMALL Y
" U+1D433 	𝐳 	\mbfz 	MATHEMATICAL BOLD SMALL Z
" U+1D434 	𝐴 	\mitA 	MATHEMATICAL ITALIC CAPITAL A
" U+1D435 	𝐵 	\mitB 	MATHEMATICAL ITALIC CAPITAL B
" U+1D436 	𝐶 	\mitC 	MATHEMATICAL ITALIC CAPITAL C
" U+1D437 	𝐷 	\mitD 	MATHEMATICAL ITALIC CAPITAL D
" U+1D438 	𝐸 	\mitE 	MATHEMATICAL ITALIC CAPITAL E
" U+1D439 	𝐹 	\mitF 	MATHEMATICAL ITALIC CAPITAL F
" U+1D43A 	𝐺 	\mitG 	MATHEMATICAL ITALIC CAPITAL G
" U+1D43B 	𝐻 	\mitH 	MATHEMATICAL ITALIC CAPITAL H
" U+1D43C 	𝐼 	\mitI 	MATHEMATICAL ITALIC CAPITAL I
" U+1D43D 	𝐽 	\mitJ 	MATHEMATICAL ITALIC CAPITAL J
" U+1D43E 	𝐾 	\mitK 	MATHEMATICAL ITALIC CAPITAL K
" U+1D43F 	𝐿 	\mitL 	MATHEMATICAL ITALIC CAPITAL L
" U+1D440 	𝑀 	\mitM 	MATHEMATICAL ITALIC CAPITAL M
" U+1D441 	𝑁 	\mitN 	MATHEMATICAL ITALIC CAPITAL N
" U+1D442 	𝑂 	\mitO 	MATHEMATICAL ITALIC CAPITAL O
" U+1D443 	𝑃 	\mitP 	MATHEMATICAL ITALIC CAPITAL P
" U+1D444 	𝑄 	\mitQ 	MATHEMATICAL ITALIC CAPITAL Q
" U+1D445 	𝑅 	\mitR 	MATHEMATICAL ITALIC CAPITAL R
" U+1D446 	𝑆 	\mitS 	MATHEMATICAL ITALIC CAPITAL S
" U+1D447 	𝑇 	\mitT 	MATHEMATICAL ITALIC CAPITAL T
" U+1D448 	𝑈 	\mitU 	MATHEMATICAL ITALIC CAPITAL U
" U+1D449 	𝑉 	\mitV 	MATHEMATICAL ITALIC CAPITAL V
" U+1D44A 	𝑊 	\mitW 	MATHEMATICAL ITALIC CAPITAL W
" U+1D44B 	𝑋 	\mitX 	MATHEMATICAL ITALIC CAPITAL X
" U+1D44C 	𝑌 	\mitY 	MATHEMATICAL ITALIC CAPITAL Y
" U+1D44D 	𝑍 	\mitZ 	MATHEMATICAL ITALIC CAPITAL Z
" U+1D44E 	𝑎 	\mita 	MATHEMATICAL ITALIC SMALL A
" U+1D44F 	𝑏 	\mitb 	MATHEMATICAL ITALIC SMALL B
" U+1D450 	𝑐 	\mitc 	MATHEMATICAL ITALIC SMALL C
" U+1D451 	𝑑 	\mitd 	MATHEMATICAL ITALIC SMALL D
" U+1D452 	𝑒 	\mite 	MATHEMATICAL ITALIC SMALL E
" U+1D453 	𝑓 	\mitf 	MATHEMATICAL ITALIC SMALL F
" U+1D454 	𝑔 	\mitg 	MATHEMATICAL ITALIC SMALL G
" U+1D456 	𝑖 	\miti 	MATHEMATICAL ITALIC SMALL I
" U+1D457 	𝑗 	\mitj 	MATHEMATICAL ITALIC SMALL J
" U+1D458 	𝑘 	\mitk 	MATHEMATICAL ITALIC SMALL K
" U+1D459 	𝑙 	\mitl 	MATHEMATICAL ITALIC SMALL L
" U+1D45A 	𝑚 	\mitm 	MATHEMATICAL ITALIC SMALL M
" U+1D45B 	𝑛 	\mitn 	MATHEMATICAL ITALIC SMALL N
" U+1D45C 	𝑜 	\mito 	MATHEMATICAL ITALIC SMALL O
" U+1D45D 	𝑝 	\mitp 	MATHEMATICAL ITALIC SMALL P
" U+1D45E 	𝑞 	\mitq 	MATHEMATICAL ITALIC SMALL Q
" U+1D45F 	𝑟 	\mitr 	MATHEMATICAL ITALIC SMALL R
" U+1D460 	𝑠 	\mits 	MATHEMATICAL ITALIC SMALL S
" U+1D461 	𝑡 	\mitt 	MATHEMATICAL ITALIC SMALL T
" U+1D462 	𝑢 	\mitu 	MATHEMATICAL ITALIC SMALL U
" U+1D463 	𝑣 	\mitv 	MATHEMATICAL ITALIC SMALL V
" U+1D464 	𝑤 	\mitw 	MATHEMATICAL ITALIC SMALL W
" U+1D465 	𝑥 	\mitx 	MATHEMATICAL ITALIC SMALL X
" U+1D466 	𝑦 	\mity 	MATHEMATICAL ITALIC SMALL Y
" U+1D467 	𝑧 	\mitz 	MATHEMATICAL ITALIC SMALL Z
" U+1D468 	𝑨 	\mbfitA 	MATHEMATICAL BOLD ITALIC CAPITAL A
" U+1D469 	𝑩 	\mbfitB 	MATHEMATICAL BOLD ITALIC CAPITAL B
" U+1D46A 	𝑪 	\mbfitC 	MATHEMATICAL BOLD ITALIC CAPITAL C
" U+1D46B 	𝑫 	\mbfitD 	MATHEMATICAL BOLD ITALIC CAPITAL D
" U+1D46C 	𝑬 	\mbfitE 	MATHEMATICAL BOLD ITALIC CAPITAL E
" U+1D46D 	𝑭 	\mbfitF 	MATHEMATICAL BOLD ITALIC CAPITAL F
" U+1D46E 	𝑮 	\mbfitG 	MATHEMATICAL BOLD ITALIC CAPITAL G
" U+1D46F 	𝑯 	\mbfitH 	MATHEMATICAL BOLD ITALIC CAPITAL H
" U+1D470 	𝑰 	\mbfitI 	MATHEMATICAL BOLD ITALIC CAPITAL I
" U+1D471 	𝑱 	\mbfitJ 	MATHEMATICAL BOLD ITALIC CAPITAL J
" U+1D472 	𝑲 	\mbfitK 	MATHEMATICAL BOLD ITALIC CAPITAL K
" U+1D473 	𝑳 	\mbfitL 	MATHEMATICAL BOLD ITALIC CAPITAL L
" U+1D474 	𝑴 	\mbfitM 	MATHEMATICAL BOLD ITALIC CAPITAL M
" U+1D475 	𝑵 	\mbfitN 	MATHEMATICAL BOLD ITALIC CAPITAL N
" U+1D476 	𝑶 	\mbfitO 	MATHEMATICAL BOLD ITALIC CAPITAL O
" U+1D477 	𝑷 	\mbfitP 	MATHEMATICAL BOLD ITALIC CAPITAL P
" U+1D478 	𝑸 	\mbfitQ 	MATHEMATICAL BOLD ITALIC CAPITAL Q
" U+1D479 	𝑹 	\mbfitR 	MATHEMATICAL BOLD ITALIC CAPITAL R
" U+1D47A 	𝑺 	\mbfitS 	MATHEMATICAL BOLD ITALIC CAPITAL S
" U+1D47B 	𝑻 	\mbfitT 	MATHEMATICAL BOLD ITALIC CAPITAL T
" U+1D47C 	𝑼 	\mbfitU 	MATHEMATICAL BOLD ITALIC CAPITAL U
" U+1D47D 	𝑽 	\mbfitV 	MATHEMATICAL BOLD ITALIC CAPITAL V
" U+1D47E 	𝑾 	\mbfitW 	MATHEMATICAL BOLD ITALIC CAPITAL W
" U+1D47F 	𝑿 	\mbfitX 	MATHEMATICAL BOLD ITALIC CAPITAL X
" U+1D480 	𝒀 	\mbfitY 	MATHEMATICAL BOLD ITALIC CAPITAL Y
" U+1D481 	𝒁 	\mbfitZ 	MATHEMATICAL BOLD ITALIC CAPITAL Z
" U+1D482 	𝒂 	\mbfita 	MATHEMATICAL BOLD ITALIC SMALL A
" U+1D483 	𝒃 	\mbfitb 	MATHEMATICAL BOLD ITALIC SMALL B
" U+1D484 	𝒄 	\mbfitc 	MATHEMATICAL BOLD ITALIC SMALL C
" U+1D485 	𝒅 	\mbfitd 	MATHEMATICAL BOLD ITALIC SMALL D
" U+1D486 	𝒆 	\mbfite 	MATHEMATICAL BOLD ITALIC SMALL E
" U+1D487 	𝒇 	\mbfitf 	MATHEMATICAL BOLD ITALIC SMALL F
" U+1D488 	𝒈 	\mbfitg 	MATHEMATICAL BOLD ITALIC SMALL G
" U+1D489 	𝒉 	\mbfith 	MATHEMATICAL BOLD ITALIC SMALL H
" U+1D48A 	𝒊 	\mbfiti 	MATHEMATICAL BOLD ITALIC SMALL I
" U+1D48B 	𝒋 	\mbfitj 	MATHEMATICAL BOLD ITALIC SMALL J
" U+1D48C 	𝒌 	\mbfitk 	MATHEMATICAL BOLD ITALIC SMALL K
" U+1D48D 	𝒍 	\mbfitl 	MATHEMATICAL BOLD ITALIC SMALL L
" U+1D48E 	𝒎 	\mbfitm 	MATHEMATICAL BOLD ITALIC SMALL M
" U+1D48F 	𝒏 	\mbfitn 	MATHEMATICAL BOLD ITALIC SMALL N
" U+1D490 	𝒐 	\mbfito 	MATHEMATICAL BOLD ITALIC SMALL O
" U+1D491 	𝒑 	\mbfitp 	MATHEMATICAL BOLD ITALIC SMALL P
" U+1D492 	𝒒 	\mbfitq 	MATHEMATICAL BOLD ITALIC SMALL Q
" U+1D493 	𝒓 	\mbfitr 	MATHEMATICAL BOLD ITALIC SMALL R
" U+1D494 	𝒔 	\mbfits 	MATHEMATICAL BOLD ITALIC SMALL S
" U+1D495 	𝒕 	\mbfitt 	MATHEMATICAL BOLD ITALIC SMALL T
" U+1D496 	𝒖 	\mbfitu 	MATHEMATICAL BOLD ITALIC SMALL U
" U+1D497 	𝒗 	\mbfitv 	MATHEMATICAL BOLD ITALIC SMALL V
" U+1D498 	𝒘 	\mbfitw 	MATHEMATICAL BOLD ITALIC SMALL W
" U+1D499 	𝒙 	\mbfitx 	MATHEMATICAL BOLD ITALIC SMALL X
" U+1D49A 	𝒚 	\mbfity 	MATHEMATICAL BOLD ITALIC SMALL Y
" U+1D49B 	𝒛 	\mbfitz 	MATHEMATICAL BOLD ITALIC SMALL Z
" U+1D49C 	𝒜 	\mscrA 	MATHEMATICAL SCRIPT CAPITAL A
" U+1D49E 	𝒞 	\mscrC 	MATHEMATICAL SCRIPT CAPITAL C
" U+1D49F 	𝒟 	\mscrD 	MATHEMATICAL SCRIPT CAPITAL D
" U+1D4A2 	𝒢 	\mscrG 	MATHEMATICAL SCRIPT CAPITAL G
" U+1D4A5 	𝒥 	\mscrJ 	MATHEMATICAL SCRIPT CAPITAL J
" U+1D4A6 	𝒦 	\mscrK 	MATHEMATICAL SCRIPT CAPITAL K
" U+1D4A9 	𝒩 	\mscrN 	MATHEMATICAL SCRIPT CAPITAL N
" U+1D4AA 	𝒪 	\mscrO 	MATHEMATICAL SCRIPT CAPITAL O
" U+1D4AB 	𝒫 	\mscrP 	MATHEMATICAL SCRIPT CAPITAL P
" U+1D4AC 	𝒬 	\mscrQ 	MATHEMATICAL SCRIPT CAPITAL Q
" U+1D4AE 	𝒮 	\mscrS 	MATHEMATICAL SCRIPT CAPITAL S
" U+1D4AF 	𝒯 	\mscrT 	MATHEMATICAL SCRIPT CAPITAL T
" U+1D4B0 	𝒰 	\mscrU 	MATHEMATICAL SCRIPT CAPITAL U
" U+1D4B1 	𝒱 	\mscrV 	MATHEMATICAL SCRIPT CAPITAL V
" U+1D4B2 	𝒲 	\mscrW 	MATHEMATICAL SCRIPT CAPITAL W
" U+1D4B3 	𝒳 	\mscrX 	MATHEMATICAL SCRIPT CAPITAL X
" U+1D4B4 	𝒴 	\mscrY 	MATHEMATICAL SCRIPT CAPITAL Y
" U+1D4B5 	𝒵 	\mscrZ 	MATHEMATICAL SCRIPT CAPITAL Z
" U+1D4B6 	𝒶 	\mscra 	MATHEMATICAL SCRIPT SMALL A
" U+1D4B7 	𝒷 	\mscrb 	MATHEMATICAL SCRIPT SMALL B
" U+1D4B8 	𝒸 	\mscrc 	MATHEMATICAL SCRIPT SMALL C
" U+1D4B9 	𝒹 	\mscrd 	MATHEMATICAL SCRIPT SMALL D
" U+1D4BB 	𝒻 	\mscrf 	MATHEMATICAL SCRIPT SMALL F
" U+1D4BD 	𝒽 	\mscrh 	MATHEMATICAL SCRIPT SMALL H
" U+1D4BE 	𝒾 	\mscri 	MATHEMATICAL SCRIPT SMALL I
" U+1D4BF 	𝒿 	\mscrj 	MATHEMATICAL SCRIPT SMALL J
" U+1D4C0 	𝓀 	\mscrk 	MATHEMATICAL SCRIPT SMALL K
" U+1D4C1 	𝓁 	\mscrl 	MATHEMATICAL SCRIPT SMALL L
" U+1D4C2 	𝓂 	\mscrm 	MATHEMATICAL SCRIPT SMALL M
" U+1D4C3 	𝓃 	\mscrn 	MATHEMATICAL SCRIPT SMALL N
" U+1D4C5 	𝓅 	\mscrp 	MATHEMATICAL SCRIPT SMALL P
" U+1D4C6 	𝓆 	\mscrq 	MATHEMATICAL SCRIPT SMALL Q
" U+1D4C7 	𝓇 	\mscrr 	MATHEMATICAL SCRIPT SMALL R
" U+1D4C8 	𝓈 	\mscrs 	MATHEMATICAL SCRIPT SMALL S
" U+1D4C9 	𝓉 	\mscrt 	MATHEMATICAL SCRIPT SMALL T
" U+1D4CA 	𝓊 	\mscru 	MATHEMATICAL SCRIPT SMALL U
" U+1D4CB 	𝓋 	\mscrv 	MATHEMATICAL SCRIPT SMALL V
" U+1D4CC 	𝓌 	\mscrw 	MATHEMATICAL SCRIPT SMALL W
" U+1D4CD 	𝓍 	\mscrx 	MATHEMATICAL SCRIPT SMALL X
" U+1D4CE 	𝓎 	\mscry 	MATHEMATICAL SCRIPT SMALL Y
" U+1D4CF 	𝓏 	\mscrz 	MATHEMATICAL SCRIPT SMALL Z
" U+1D4D0 	𝓐 	\mbfscrA 	MATHEMATICAL BOLD SCRIPT CAPITAL A
" U+1D4D1 	𝓑 	\mbfscrB 	MATHEMATICAL BOLD SCRIPT CAPITAL B
" U+1D4D2 	𝓒 	\mbfscrC 	MATHEMATICAL BOLD SCRIPT CAPITAL C
" U+1D4D3 	𝓓 	\mbfscrD 	MATHEMATICAL BOLD SCRIPT CAPITAL D
" U+1D4D4 	𝓔 	\mbfscrE 	MATHEMATICAL BOLD SCRIPT CAPITAL E
" U+1D4D5 	𝓕 	\mbfscrF 	MATHEMATICAL BOLD SCRIPT CAPITAL F
" U+1D4D6 	𝓖 	\mbfscrG 	MATHEMATICAL BOLD SCRIPT CAPITAL G
" U+1D4D7 	𝓗 	\mbfscrH 	MATHEMATICAL BOLD SCRIPT CAPITAL H
" U+1D4D8 	𝓘 	\mbfscrI 	MATHEMATICAL BOLD SCRIPT CAPITAL I
" U+1D4D9 	𝓙 	\mbfscrJ 	MATHEMATICAL BOLD SCRIPT CAPITAL J
" U+1D4DA 	𝓚 	\mbfscrK 	MATHEMATICAL BOLD SCRIPT CAPITAL K
" U+1D4DB 	𝓛 	\mbfscrL 	MATHEMATICAL BOLD SCRIPT CAPITAL L
" U+1D4DC 	𝓜 	\mbfscrM 	MATHEMATICAL BOLD SCRIPT CAPITAL M
" U+1D4DD 	𝓝 	\mbfscrN 	MATHEMATICAL BOLD SCRIPT CAPITAL N
" U+1D4DE 	𝓞 	\mbfscrO 	MATHEMATICAL BOLD SCRIPT CAPITAL O
" U+1D4DF 	𝓟 	\mbfscrP 	MATHEMATICAL BOLD SCRIPT CAPITAL P
" U+1D4E0 	𝓠 	\mbfscrQ 	MATHEMATICAL BOLD SCRIPT CAPITAL Q
" U+1D4E1 	𝓡 	\mbfscrR 	MATHEMATICAL BOLD SCRIPT CAPITAL R
" U+1D4E2 	𝓢 	\mbfscrS 	MATHEMATICAL BOLD SCRIPT CAPITAL S
" U+1D4E3 	𝓣 	\mbfscrT 	MATHEMATICAL BOLD SCRIPT CAPITAL T
" U+1D4E4 	𝓤 	\mbfscrU 	MATHEMATICAL BOLD SCRIPT CAPITAL U
" U+1D4E5 	𝓥 	\mbfscrV 	MATHEMATICAL BOLD SCRIPT CAPITAL V
" U+1D4E6 	𝓦 	\mbfscrW 	MATHEMATICAL BOLD SCRIPT CAPITAL W
" U+1D4E7 	𝓧 	\mbfscrX 	MATHEMATICAL BOLD SCRIPT CAPITAL X
" U+1D4E8 	𝓨 	\mbfscrY 	MATHEMATICAL BOLD SCRIPT CAPITAL Y
" U+1D4E9 	𝓩 	\mbfscrZ 	MATHEMATICAL BOLD SCRIPT CAPITAL Z
" U+1D4EA 	𝓪 	\mbfscra 	MATHEMATICAL BOLD SCRIPT SMALL A
" U+1D4EB 	𝓫 	\mbfscrb 	MATHEMATICAL BOLD SCRIPT SMALL B
" U+1D4EC 	𝓬 	\mbfscrc 	MATHEMATICAL BOLD SCRIPT SMALL C
" U+1D4ED 	𝓭 	\mbfscrd 	MATHEMATICAL BOLD SCRIPT SMALL D
" U+1D4EE 	𝓮 	\mbfscre 	MATHEMATICAL BOLD SCRIPT SMALL E
" U+1D4EF 	𝓯 	\mbfscrf 	MATHEMATICAL BOLD SCRIPT SMALL F
" U+1D4F0 	𝓰 	\mbfscrg 	MATHEMATICAL BOLD SCRIPT SMALL G
" U+1D4F1 	𝓱 	\mbfscrh 	MATHEMATICAL BOLD SCRIPT SMALL H
" U+1D4F2 	𝓲 	\mbfscri 	MATHEMATICAL BOLD SCRIPT SMALL I
" U+1D4F3 	𝓳 	\mbfscrj 	MATHEMATICAL BOLD SCRIPT SMALL J
" U+1D4F4 	𝓴 	\mbfscrk 	MATHEMATICAL BOLD SCRIPT SMALL K
" U+1D4F5 	𝓵 	\mbfscrl 	MATHEMATICAL BOLD SCRIPT SMALL L
" U+1D4F6 	𝓶 	\mbfscrm 	MATHEMATICAL BOLD SCRIPT SMALL M
" U+1D4F7 	𝓷 	\mbfscrn 	MATHEMATICAL BOLD SCRIPT SMALL N
" U+1D4F8 	𝓸 	\mbfscro 	MATHEMATICAL BOLD SCRIPT SMALL O
" U+1D4F9 	𝓹 	\mbfscrp 	MATHEMATICAL BOLD SCRIPT SMALL P
" U+1D4FA 	𝓺 	\mbfscrq 	MATHEMATICAL BOLD SCRIPT SMALL Q
" U+1D4FB 	𝓻 	\mbfscrr 	MATHEMATICAL BOLD SCRIPT SMALL R
" U+1D4FC 	𝓼 	\mbfscrs 	MATHEMATICAL BOLD SCRIPT SMALL S
" U+1D4FD 	𝓽 	\mbfscrt 	MATHEMATICAL BOLD SCRIPT SMALL T
" U+1D4FE 	𝓾 	\mbfscru 	MATHEMATICAL BOLD SCRIPT SMALL U
" U+1D4FF 	𝓿 	\mbfscrv 	MATHEMATICAL BOLD SCRIPT SMALL V
" U+1D500 	𝔀 	\mbfscrw 	MATHEMATICAL BOLD SCRIPT SMALL W
" U+1D501 	𝔁 	\mbfscrx 	MATHEMATICAL BOLD SCRIPT SMALL X
" U+1D502 	𝔂 	\mbfscry 	MATHEMATICAL BOLD SCRIPT SMALL Y
" U+1D503 	𝔃 	\mbfscrz 	MATHEMATICAL BOLD SCRIPT SMALL Z
" U+1D504 	𝔄 	\mfrakA 	MATHEMATICAL FRAKTUR CAPITAL A
" U+1D505 	𝔅 	\mfrakB 	MATHEMATICAL FRAKTUR CAPITAL B
" U+1D507 	𝔇 	\mfrakD 	MATHEMATICAL FRAKTUR CAPITAL D
" U+1D508 	𝔈 	\mfrakE 	MATHEMATICAL FRAKTUR CAPITAL E
" U+1D509 	𝔉 	\mfrakF 	MATHEMATICAL FRAKTUR CAPITAL F
" U+1D50A 	𝔊 	\mfrakG 	MATHEMATICAL FRAKTUR CAPITAL G
" U+1D50D 	𝔍 	\mfrakJ 	MATHEMATICAL FRAKTUR CAPITAL J
" U+1D50E 	𝔎 	\mfrakK 	MATHEMATICAL FRAKTUR CAPITAL K
" U+1D50F 	𝔏 	\mfrakL 	MATHEMATICAL FRAKTUR CAPITAL L
" U+1D510 	𝔐 	\mfrakM 	MATHEMATICAL FRAKTUR CAPITAL M
" U+1D511 	𝔑 	\mfrakN 	MATHEMATICAL FRAKTUR CAPITAL N
" U+1D512 	𝔒 	\mfrakO 	MATHEMATICAL FRAKTUR CAPITAL O
" U+1D513 	𝔓 	\mfrakP 	MATHEMATICAL FRAKTUR CAPITAL P
" U+1D514 	𝔔 	\mfrakQ 	MATHEMATICAL FRAKTUR CAPITAL Q
" U+1D516 	𝔖 	\mfrakS 	MATHEMATICAL FRAKTUR CAPITAL S
" U+1D517 	𝔗 	\mfrakT 	MATHEMATICAL FRAKTUR CAPITAL T
" U+1D518 	𝔘 	\mfrakU 	MATHEMATICAL FRAKTUR CAPITAL U
" U+1D519 	𝔙 	\mfrakV 	MATHEMATICAL FRAKTUR CAPITAL V
" U+1D51A 	𝔚 	\mfrakW 	MATHEMATICAL FRAKTUR CAPITAL W
" U+1D51B 	𝔛 	\mfrakX 	MATHEMATICAL FRAKTUR CAPITAL X
" U+1D51C 	𝔜 	\mfrakY 	MATHEMATICAL FRAKTUR CAPITAL Y
" U+1D51E 	𝔞 	\mfraka 	MATHEMATICAL FRAKTUR SMALL A
" U+1D51F 	𝔟 	\mfrakb 	MATHEMATICAL FRAKTUR SMALL B
" U+1D520 	𝔠 	\mfrakc 	MATHEMATICAL FRAKTUR SMALL C
" U+1D521 	𝔡 	\mfrakd 	MATHEMATICAL FRAKTUR SMALL D
" U+1D522 	𝔢 	\mfrake 	MATHEMATICAL FRAKTUR SMALL E
" U+1D523 	𝔣 	\mfrakf 	MATHEMATICAL FRAKTUR SMALL F
" U+1D524 	𝔤 	\mfrakg 	MATHEMATICAL FRAKTUR SMALL G
" U+1D525 	𝔥 	\mfrakh 	MATHEMATICAL FRAKTUR SMALL H
" U+1D526 	𝔦 	\mfraki 	MATHEMATICAL FRAKTUR SMALL I
" U+1D527 	𝔧 	\mfrakj 	MATHEMATICAL FRAKTUR SMALL J
" U+1D528 	𝔨 	\mfrakk 	MATHEMATICAL FRAKTUR SMALL K
" U+1D529 	𝔩 	\mfrakl 	MATHEMATICAL FRAKTUR SMALL L
" U+1D52A 	𝔪 	\mfrakm 	MATHEMATICAL FRAKTUR SMALL M
" U+1D52B 	𝔫 	\mfrakn 	MATHEMATICAL FRAKTUR SMALL N
" U+1D52C 	𝔬 	\mfrako 	MATHEMATICAL FRAKTUR SMALL O
" U+1D52D 	𝔭 	\mfrakp 	MATHEMATICAL FRAKTUR SMALL P
" U+1D52E 	𝔮 	\mfrakq 	MATHEMATICAL FRAKTUR SMALL Q
" U+1D52F 	𝔯 	\mfrakr 	MATHEMATICAL FRAKTUR SMALL R
" U+1D530 	𝔰 	\mfraks 	MATHEMATICAL FRAKTUR SMALL S
" U+1D531 	𝔱 	\mfrakt 	MATHEMATICAL FRAKTUR SMALL T
" U+1D532 	𝔲 	\mfraku 	MATHEMATICAL FRAKTUR SMALL U
" U+1D533 	𝔳 	\mfrakv 	MATHEMATICAL FRAKTUR SMALL V
" U+1D534 	𝔴 	\mfrakw 	MATHEMATICAL FRAKTUR SMALL W
" U+1D535 	𝔵 	\mfrakx 	MATHEMATICAL FRAKTUR SMALL X
" U+1D536 	𝔶 	\mfraky 	MATHEMATICAL FRAKTUR SMALL Y
" U+1D537 	𝔷 	\mfrakz 	MATHEMATICAL FRAKTUR SMALL Z
" U+1D538 	𝔸 	\BbbA 	MATHEMATICAL DOUBLE-STRUCK CAPITAL A
" U+1D539 	𝔹 	\BbbB 	MATHEMATICAL DOUBLE-STRUCK CAPITAL B
" U+1D53B 	𝔻 	\BbbD 	MATHEMATICAL DOUBLE-STRUCK CAPITAL D
" U+1D53C 	𝔼 	\BbbE 	MATHEMATICAL DOUBLE-STRUCK CAPITAL E
" U+1D53D 	𝔽 	\BbbF 	MATHEMATICAL DOUBLE-STRUCK CAPITAL F
" U+1D53E 	𝔾 	\BbbG 	MATHEMATICAL DOUBLE-STRUCK CAPITAL G
" U+1D540 	𝕀 	\BbbI 	MATHEMATICAL DOUBLE-STRUCK CAPITAL I
" U+1D541 	𝕁 	\BbbJ 	MATHEMATICAL DOUBLE-STRUCK CAPITAL J
" U+1D542 	𝕂 	\BbbK 	MATHEMATICAL DOUBLE-STRUCK CAPITAL K
" U+1D543 	𝕃 	\BbbL 	MATHEMATICAL DOUBLE-STRUCK CAPITAL L
" U+1D544 	𝕄 	\BbbM 	MATHEMATICAL DOUBLE-STRUCK CAPITAL M
" U+1D546 	𝕆 	\BbbO 	MATHEMATICAL DOUBLE-STRUCK CAPITAL O
" U+1D54A 	𝕊 	\BbbS 	MATHEMATICAL DOUBLE-STRUCK CAPITAL S
" U+1D54B 	𝕋 	\BbbT 	MATHEMATICAL DOUBLE-STRUCK CAPITAL T
" U+1D54C 	𝕌 	\BbbU 	MATHEMATICAL DOUBLE-STRUCK CAPITAL U
" U+1D54D 	𝕍 	\BbbV 	MATHEMATICAL DOUBLE-STRUCK CAPITAL V
" U+1D54E 	𝕎 	\BbbW 	MATHEMATICAL DOUBLE-STRUCK CAPITAL W
" U+1D54F 	𝕏 	\BbbX 	MATHEMATICAL DOUBLE-STRUCK CAPITAL X
" U+1D550 	𝕐 	\BbbY 	MATHEMATICAL DOUBLE-STRUCK CAPITAL Y
" U+1D552 	𝕒 	\Bbba 	MATHEMATICAL DOUBLE-STRUCK SMALL A
" U+1D553 	𝕓 	\Bbbb 	MATHEMATICAL DOUBLE-STRUCK SMALL B
" U+1D554 	𝕔 	\Bbbc 	MATHEMATICAL DOUBLE-STRUCK SMALL C
" U+1D555 	𝕕 	\Bbbd 	MATHEMATICAL DOUBLE-STRUCK SMALL D
" U+1D556 	𝕖 	\Bbbe 	MATHEMATICAL DOUBLE-STRUCK SMALL E
" U+1D557 	𝕗 	\Bbbf 	MATHEMATICAL DOUBLE-STRUCK SMALL F
" U+1D558 	𝕘 	\Bbbg 	MATHEMATICAL DOUBLE-STRUCK SMALL G
" U+1D559 	𝕙 	\Bbbh 	MATHEMATICAL DOUBLE-STRUCK SMALL H
" U+1D55A 	𝕚 	\Bbbi 	MATHEMATICAL DOUBLE-STRUCK SMALL I
" U+1D55B 	𝕛 	\Bbbj 	MATHEMATICAL DOUBLE-STRUCK SMALL J
" U+1D55C 	𝕜 	\Bbbk 	MATHEMATICAL DOUBLE-STRUCK SMALL K
" U+1D55D 	𝕝 	\Bbbl 	MATHEMATICAL DOUBLE-STRUCK SMALL L
" U+1D55E 	𝕞 	\Bbbm 	MATHEMATICAL DOUBLE-STRUCK SMALL M
" U+1D55F 	𝕟 	\Bbbn 	MATHEMATICAL DOUBLE-STRUCK SMALL N
" U+1D560 	𝕠 	\Bbbo 	MATHEMATICAL DOUBLE-STRUCK SMALL O
" U+1D561 	𝕡 	\Bbbp 	MATHEMATICAL DOUBLE-STRUCK SMALL P
" U+1D562 	𝕢 	\Bbbq 	MATHEMATICAL DOUBLE-STRUCK SMALL Q
" U+1D563 	𝕣 	\Bbbr 	MATHEMATICAL DOUBLE-STRUCK SMALL R
" U+1D564 	𝕤 	\Bbbs 	MATHEMATICAL DOUBLE-STRUCK SMALL S
" U+1D565 	𝕥 	\Bbbt 	MATHEMATICAL DOUBLE-STRUCK SMALL T
" U+1D566 	𝕦 	\Bbbu 	MATHEMATICAL DOUBLE-STRUCK SMALL U
" U+1D567 	𝕧 	\Bbbv 	MATHEMATICAL DOUBLE-STRUCK SMALL V
" U+1D568 	𝕨 	\Bbbw 	MATHEMATICAL DOUBLE-STRUCK SMALL W
" U+1D569 	𝕩 	\Bbbx 	MATHEMATICAL DOUBLE-STRUCK SMALL X
" U+1D56A 	𝕪 	\Bbby 	MATHEMATICAL DOUBLE-STRUCK SMALL Y
" U+1D56B 	𝕫 	\Bbbz 	MATHEMATICAL DOUBLE-STRUCK SMALL Z
" U+1D56C 	𝕬 	\mbffrakA 	MATHEMATICAL BOLD FRAKTUR CAPITAL A
" U+1D56D 	𝕭 	\mbffrakB 	MATHEMATICAL BOLD FRAKTUR CAPITAL B
" U+1D56E 	𝕮 	\mbffrakC 	MATHEMATICAL BOLD FRAKTUR CAPITAL C
" U+1D56F 	𝕯 	\mbffrakD 	MATHEMATICAL BOLD FRAKTUR CAPITAL D
" U+1D570 	𝕰 	\mbffrakE 	MATHEMATICAL BOLD FRAKTUR CAPITAL E
" U+1D571 	𝕱 	\mbffrakF 	MATHEMATICAL BOLD FRAKTUR CAPITAL F
" U+1D572 	𝕲 	\mbffrakG 	MATHEMATICAL BOLD FRAKTUR CAPITAL G
" U+1D573 	𝕳 	\mbffrakH 	MATHEMATICAL BOLD FRAKTUR CAPITAL H
" U+1D574 	𝕴 	\mbffrakI 	MATHEMATICAL BOLD FRAKTUR CAPITAL I
" U+1D575 	𝕵 	\mbffrakJ 	MATHEMATICAL BOLD FRAKTUR CAPITAL J
" U+1D576 	𝕶 	\mbffrakK 	MATHEMATICAL BOLD FRAKTUR CAPITAL K
" U+1D577 	𝕷 	\mbffrakL 	MATHEMATICAL BOLD FRAKTUR CAPITAL L
" U+1D578 	𝕸 	\mbffrakM 	MATHEMATICAL BOLD FRAKTUR CAPITAL M
" U+1D579 	𝕹 	\mbffrakN 	MATHEMATICAL BOLD FRAKTUR CAPITAL N
" U+1D57A 	𝕺 	\mbffrakO 	MATHEMATICAL BOLD FRAKTUR CAPITAL O
" U+1D57B 	𝕻 	\mbffrakP 	MATHEMATICAL BOLD FRAKTUR CAPITAL P
" U+1D57C 	𝕼 	\mbffrakQ 	MATHEMATICAL BOLD FRAKTUR CAPITAL Q
" U+1D57D 	𝕽 	\mbffrakR 	MATHEMATICAL BOLD FRAKTUR CAPITAL R
" U+1D57E 	𝕾 	\mbffrakS 	MATHEMATICAL BOLD FRAKTUR CAPITAL S
" U+1D57F 	𝕿 	\mbffrakT 	MATHEMATICAL BOLD FRAKTUR CAPITAL T
" U+1D580 	𝖀 	\mbffrakU 	MATHEMATICAL BOLD FRAKTUR CAPITAL U
" U+1D581 	𝖁 	\mbffrakV 	MATHEMATICAL BOLD FRAKTUR CAPITAL V
" U+1D582 	𝖂 	\mbffrakW 	MATHEMATICAL BOLD FRAKTUR CAPITAL W
" U+1D583 	𝖃 	\mbffrakX 	MATHEMATICAL BOLD FRAKTUR CAPITAL X
" U+1D584 	𝖄 	\mbffrakY 	MATHEMATICAL BOLD FRAKTUR CAPITAL Y
" U+1D585 	𝖅 	\mbffrakZ 	MATHEMATICAL BOLD FRAKTUR CAPITAL Z
" U+1D586 	𝖆 	\mbffraka 	MATHEMATICAL BOLD FRAKTUR SMALL A
" U+1D587 	𝖇 	\mbffrakb 	MATHEMATICAL BOLD FRAKTUR SMALL B
" U+1D588 	𝖈 	\mbffrakc 	MATHEMATICAL BOLD FRAKTUR SMALL C
" U+1D589 	𝖉 	\mbffrakd 	MATHEMATICAL BOLD FRAKTUR SMALL D
" U+1D58A 	𝖊 	\mbffrake 	MATHEMATICAL BOLD FRAKTUR SMALL E
" U+1D58B 	𝖋 	\mbffrakf 	MATHEMATICAL BOLD FRAKTUR SMALL F
" U+1D58C 	𝖌 	\mbffrakg 	MATHEMATICAL BOLD FRAKTUR SMALL G
" U+1D58D 	𝖍 	\mbffrakh 	MATHEMATICAL BOLD FRAKTUR SMALL H
" U+1D58E 	𝖎 	\mbffraki 	MATHEMATICAL BOLD FRAKTUR SMALL I
" U+1D58F 	𝖏 	\mbffrakj 	MATHEMATICAL BOLD FRAKTUR SMALL J
" U+1D590 	𝖐 	\mbffrakk 	MATHEMATICAL BOLD FRAKTUR SMALL K
" U+1D591 	𝖑 	\mbffrakl 	MATHEMATICAL BOLD FRAKTUR SMALL L
" U+1D592 	𝖒 	\mbffrakm 	MATHEMATICAL BOLD FRAKTUR SMALL M
" U+1D593 	𝖓 	\mbffrakn 	MATHEMATICAL BOLD FRAKTUR SMALL N
" U+1D594 	𝖔 	\mbffrako 	MATHEMATICAL BOLD FRAKTUR SMALL O
" U+1D595 	𝖕 	\mbffrakp 	MATHEMATICAL BOLD FRAKTUR SMALL P
" U+1D596 	𝖖 	\mbffrakq 	MATHEMATICAL BOLD FRAKTUR SMALL Q
" U+1D597 	𝖗 	\mbffrakr 	MATHEMATICAL BOLD FRAKTUR SMALL R
" U+1D598 	𝖘 	\mbffraks 	MATHEMATICAL BOLD FRAKTUR SMALL S
" U+1D599 	𝖙 	\mbffrakt 	MATHEMATICAL BOLD FRAKTUR SMALL T
" U+1D59A 	𝖚 	\mbffraku 	MATHEMATICAL BOLD FRAKTUR SMALL U
" U+1D59B 	𝖛 	\mbffrakv 	MATHEMATICAL BOLD FRAKTUR SMALL V
" U+1D59C 	𝖜 	\mbffrakw 	MATHEMATICAL BOLD FRAKTUR SMALL W
" U+1D59D 	𝖝 	\mbffrakx 	MATHEMATICAL BOLD FRAKTUR SMALL X
" U+1D59E 	𝖞 	\mbffraky 	MATHEMATICAL BOLD FRAKTUR SMALL Y
" U+1D59F 	𝖟 	\mbffrakz 	MATHEMATICAL BOLD FRAKTUR SMALL Z
" U+1D5A0 	𝖠 	\msansA 	MATHEMATICAL SANS-SERIF CAPITAL A
" U+1D5A1 	𝖡 	\msansB 	MATHEMATICAL SANS-SERIF CAPITAL B
" U+1D5A2 	𝖢 	\msansC 	MATHEMATICAL SANS-SERIF CAPITAL C
" U+1D5A3 	𝖣 	\msansD 	MATHEMATICAL SANS-SERIF CAPITAL D
" U+1D5A4 	𝖤 	\msansE 	MATHEMATICAL SANS-SERIF CAPITAL E
" U+1D5A5 	𝖥 	\msansF 	MATHEMATICAL SANS-SERIF CAPITAL F
" U+1D5A6 	𝖦 	\msansG 	MATHEMATICAL SANS-SERIF CAPITAL G
" U+1D5A7 	𝖧 	\msansH 	MATHEMATICAL SANS-SERIF CAPITAL H
" U+1D5A8 	𝖨 	\msansI 	MATHEMATICAL SANS-SERIF CAPITAL I
" U+1D5A9 	𝖩 	\msansJ 	MATHEMATICAL SANS-SERIF CAPITAL J
" U+1D5AA 	𝖪 	\msansK 	MATHEMATICAL SANS-SERIF CAPITAL K
" U+1D5AB 	𝖫 	\msansL 	MATHEMATICAL SANS-SERIF CAPITAL L
" U+1D5AC 	𝖬 	\msansM 	MATHEMATICAL SANS-SERIF CAPITAL M
" U+1D5AD 	𝖭 	\msansN 	MATHEMATICAL SANS-SERIF CAPITAL N
" U+1D5AE 	𝖮 	\msansO 	MATHEMATICAL SANS-SERIF CAPITAL O
" U+1D5AF 	𝖯 	\msansP 	MATHEMATICAL SANS-SERIF CAPITAL P
" U+1D5B0 	𝖰 	\msansQ 	MATHEMATICAL SANS-SERIF CAPITAL Q
" U+1D5B1 	𝖱 	\msansR 	MATHEMATICAL SANS-SERIF CAPITAL R
" U+1D5B2 	𝖲 	\msansS 	MATHEMATICAL SANS-SERIF CAPITAL S
" U+1D5B3 	𝖳 	\msansT 	MATHEMATICAL SANS-SERIF CAPITAL T
" U+1D5B4 	𝖴 	\msansU 	MATHEMATICAL SANS-SERIF CAPITAL U
" U+1D5B5 	𝖵 	\msansV 	MATHEMATICAL SANS-SERIF CAPITAL V
" U+1D5B6 	𝖶 	\msansW 	MATHEMATICAL SANS-SERIF CAPITAL W
" U+1D5B7 	𝖷 	\msansX 	MATHEMATICAL SANS-SERIF CAPITAL X
" U+1D5B8 	𝖸 	\msansY 	MATHEMATICAL SANS-SERIF CAPITAL Y
" U+1D5B9 	𝖹 	\msansZ 	MATHEMATICAL SANS-SERIF CAPITAL Z
" U+1D5BA 	𝖺 	\msansa 	MATHEMATICAL SANS-SERIF SMALL A
" U+1D5BB 	𝖻 	\msansb 	MATHEMATICAL SANS-SERIF SMALL B
" U+1D5BC 	𝖼 	\msansc 	MATHEMATICAL SANS-SERIF SMALL C
" U+1D5BD 	𝖽 	\msansd 	MATHEMATICAL SANS-SERIF SMALL D
" U+1D5BE 	𝖾 	\msanse 	MATHEMATICAL SANS-SERIF SMALL E
" U+1D5BF 	𝖿 	\msansf 	MATHEMATICAL SANS-SERIF SMALL F
" U+1D5C0 	𝗀 	\msansg 	MATHEMATICAL SANS-SERIF SMALL G
" U+1D5C1 	𝗁 	\msansh 	MATHEMATICAL SANS-SERIF SMALL H
" U+1D5C2 	𝗂 	\msansi 	MATHEMATICAL SANS-SERIF SMALL I
" U+1D5C3 	𝗃 	\msansj 	MATHEMATICAL SANS-SERIF SMALL J
" U+1D5C4 	𝗄 	\msansk 	MATHEMATICAL SANS-SERIF SMALL K
" U+1D5C5 	𝗅 	\msansl 	MATHEMATICAL SANS-SERIF SMALL L
" U+1D5C6 	𝗆 	\msansm 	MATHEMATICAL SANS-SERIF SMALL M
" U+1D5C7 	𝗇 	\msansn 	MATHEMATICAL SANS-SERIF SMALL N
" U+1D5C8 	𝗈 	\msanso 	MATHEMATICAL SANS-SERIF SMALL O
" U+1D5C9 	𝗉 	\msansp 	MATHEMATICAL SANS-SERIF SMALL P
" U+1D5CA 	𝗊 	\msansq 	MATHEMATICAL SANS-SERIF SMALL Q
" U+1D5CB 	𝗋 	\msansr 	MATHEMATICAL SANS-SERIF SMALL R
" U+1D5CC 	𝗌 	\msanss 	MATHEMATICAL SANS-SERIF SMALL S
" U+1D5CD 	𝗍 	\msanst 	MATHEMATICAL SANS-SERIF SMALL T
" U+1D5CE 	𝗎 	\msansu 	MATHEMATICAL SANS-SERIF SMALL U
" U+1D5CF 	𝗏 	\msansv 	MATHEMATICAL SANS-SERIF SMALL V
" U+1D5D0 	𝗐 	\msansw 	MATHEMATICAL SANS-SERIF SMALL W
" U+1D5D1 	𝗑 	\msansx 	MATHEMATICAL SANS-SERIF SMALL X
" U+1D5D2 	𝗒 	\msansy 	MATHEMATICAL SANS-SERIF SMALL Y
" U+1D5D3 	𝗓 	\msansz 	MATHEMATICAL SANS-SERIF SMALL Z
" U+1D5D4 	𝗔 	\mbfsansA 	MATHEMATICAL SANS-SERIF BOLD CAPITAL A
" U+1D5D5 	𝗕 	\mbfsansB 	MATHEMATICAL SANS-SERIF BOLD CAPITAL B
" U+1D5D6 	𝗖 	\mbfsansC 	MATHEMATICAL SANS-SERIF BOLD CAPITAL C
" U+1D5D7 	𝗗 	\mbfsansD 	MATHEMATICAL SANS-SERIF BOLD CAPITAL D
" U+1D5D8 	𝗘 	\mbfsansE 	MATHEMATICAL SANS-SERIF BOLD CAPITAL E
" U+1D5D9 	𝗙 	\mbfsansF 	MATHEMATICAL SANS-SERIF BOLD CAPITAL F
" U+1D5DA 	𝗚 	\mbfsansG 	MATHEMATICAL SANS-SERIF BOLD CAPITAL G
" U+1D5DB 	𝗛 	\mbfsansH 	MATHEMATICAL SANS-SERIF BOLD CAPITAL H
" U+1D5DC 	𝗜 	\mbfsansI 	MATHEMATICAL SANS-SERIF BOLD CAPITAL I
" U+1D5DD 	𝗝 	\mbfsansJ 	MATHEMATICAL SANS-SERIF BOLD CAPITAL J
" U+1D5DE 	𝗞 	\mbfsansK 	MATHEMATICAL SANS-SERIF BOLD CAPITAL K
" U+1D5DF 	𝗟 	\mbfsansL 	MATHEMATICAL SANS-SERIF BOLD CAPITAL L
" U+1D5E0 	𝗠 	\mbfsansM 	MATHEMATICAL SANS-SERIF BOLD CAPITAL M
" U+1D5E1 	𝗡 	\mbfsansN 	MATHEMATICAL SANS-SERIF BOLD CAPITAL N
" U+1D5E2 	𝗢 	\mbfsansO 	MATHEMATICAL SANS-SERIF BOLD CAPITAL O
" U+1D5E3 	𝗣 	\mbfsansP 	MATHEMATICAL SANS-SERIF BOLD CAPITAL P
" U+1D5E4 	𝗤 	\mbfsansQ 	MATHEMATICAL SANS-SERIF BOLD CAPITAL Q
" U+1D5E5 	𝗥 	\mbfsansR 	MATHEMATICAL SANS-SERIF BOLD CAPITAL R
" U+1D5E6 	𝗦 	\mbfsansS 	MATHEMATICAL SANS-SERIF BOLD CAPITAL S
" U+1D5E7 	𝗧 	\mbfsansT 	MATHEMATICAL SANS-SERIF BOLD CAPITAL T
" U+1D5E8 	𝗨 	\mbfsansU 	MATHEMATICAL SANS-SERIF BOLD CAPITAL U
" U+1D5E9 	𝗩 	\mbfsansV 	MATHEMATICAL SANS-SERIF BOLD CAPITAL V
" U+1D5EA 	𝗪 	\mbfsansW 	MATHEMATICAL SANS-SERIF BOLD CAPITAL W
" U+1D5EB 	𝗫 	\mbfsansX 	MATHEMATICAL SANS-SERIF BOLD CAPITAL X
" U+1D5EC 	𝗬 	\mbfsansY 	MATHEMATICAL SANS-SERIF BOLD CAPITAL Y
" U+1D5ED 	𝗭 	\mbfsansZ 	MATHEMATICAL SANS-SERIF BOLD CAPITAL Z
" U+1D5EE 	𝗮 	\mbfsansa 	MATHEMATICAL SANS-SERIF BOLD SMALL A
" U+1D5EF 	𝗯 	\mbfsansb 	MATHEMATICAL SANS-SERIF BOLD SMALL B
" U+1D5F0 	𝗰 	\mbfsansc 	MATHEMATICAL SANS-SERIF BOLD SMALL C
" U+1D5F1 	𝗱 	\mbfsansd 	MATHEMATICAL SANS-SERIF BOLD SMALL D
" U+1D5F2 	𝗲 	\mbfsanse 	MATHEMATICAL SANS-SERIF BOLD SMALL E
" U+1D5F3 	𝗳 	\mbfsansf 	MATHEMATICAL SANS-SERIF BOLD SMALL F
" U+1D5F4 	𝗴 	\mbfsansg 	MATHEMATICAL SANS-SERIF BOLD SMALL G
" U+1D5F5 	𝗵 	\mbfsansh 	MATHEMATICAL SANS-SERIF BOLD SMALL H
" U+1D5F6 	𝗶 	\mbfsansi 	MATHEMATICAL SANS-SERIF BOLD SMALL I
" U+1D5F7 	𝗷 	\mbfsansj 	MATHEMATICAL SANS-SERIF BOLD SMALL J
" U+1D5F8 	𝗸 	\mbfsansk 	MATHEMATICAL SANS-SERIF BOLD SMALL K
" U+1D5F9 	𝗹 	\mbfsansl 	MATHEMATICAL SANS-SERIF BOLD SMALL L
" U+1D5FA 	𝗺 	\mbfsansm 	MATHEMATICAL SANS-SERIF BOLD SMALL M
" U+1D5FB 	𝗻 	\mbfsansn 	MATHEMATICAL SANS-SERIF BOLD SMALL N
" U+1D5FC 	𝗼 	\mbfsanso 	MATHEMATICAL SANS-SERIF BOLD SMALL O
" U+1D5FD 	𝗽 	\mbfsansp 	MATHEMATICAL SANS-SERIF BOLD SMALL P
" U+1D5FE 	𝗾 	\mbfsansq 	MATHEMATICAL SANS-SERIF BOLD SMALL Q
" U+1D5FF 	𝗿 	\mbfsansr 	MATHEMATICAL SANS-SERIF BOLD SMALL R
" U+1D600 	𝘀 	\mbfsanss 	MATHEMATICAL SANS-SERIF BOLD SMALL S
" U+1D601 	𝘁 	\mbfsanst 	MATHEMATICAL SANS-SERIF BOLD SMALL T
" U+1D602 	𝘂 	\mbfsansu 	MATHEMATICAL SANS-SERIF BOLD SMALL U
" U+1D603 	𝘃 	\mbfsansv 	MATHEMATICAL SANS-SERIF BOLD SMALL V
" U+1D604 	𝘄 	\mbfsansw 	MATHEMATICAL SANS-SERIF BOLD SMALL W
" U+1D605 	𝘅 	\mbfsansx 	MATHEMATICAL SANS-SERIF BOLD SMALL X
" U+1D606 	𝘆 	\mbfsansy 	MATHEMATICAL SANS-SERIF BOLD SMALL Y
" U+1D607 	𝘇 	\mbfsansz 	MATHEMATICAL SANS-SERIF BOLD SMALL Z
" U+1D608 	𝘈 	\mitsansA 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL A
" U+1D609 	𝘉 	\mitsansB 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL B
" U+1D60A 	𝘊 	\mitsansC 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL C
" U+1D60B 	𝘋 	\mitsansD 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL D
" U+1D60C 	𝘌 	\mitsansE 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL E
" U+1D60D 	𝘍 	\mitsansF 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL F
" U+1D60E 	𝘎 	\mitsansG 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL G
" U+1D60F 	𝘏 	\mitsansH 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL H
" U+1D610 	𝘐 	\mitsansI 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL I
" U+1D611 	𝘑 	\mitsansJ 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL J
" U+1D612 	𝘒 	\mitsansK 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL K
" U+1D613 	𝘓 	\mitsansL 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL L
" U+1D614 	𝘔 	\mitsansM 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL M
" U+1D615 	𝘕 	\mitsansN 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL N
" U+1D616 	𝘖 	\mitsansO 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL O
" U+1D617 	𝘗 	\mitsansP 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL P
" U+1D618 	𝘘 	\mitsansQ 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL Q
" U+1D619 	𝘙 	\mitsansR 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL R
" U+1D61A 	𝘚 	\mitsansS 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL S
" U+1D61B 	𝘛 	\mitsansT 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL T
" U+1D61C 	𝘜 	\mitsansU 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL U
" U+1D61D 	𝘝 	\mitsansV 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL V
" U+1D61E 	𝘞 	\mitsansW 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL W
" U+1D61F 	𝘟 	\mitsansX 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL X
" U+1D620 	𝘠 	\mitsansY 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL Y
" U+1D621 	𝘡 	\mitsansZ 	MATHEMATICAL SANS-SERIF ITALIC CAPITAL Z
" U+1D622 	𝘢 	\mitsansa 	MATHEMATICAL SANS-SERIF ITALIC SMALL A
" U+1D623 	𝘣 	\mitsansb 	MATHEMATICAL SANS-SERIF ITALIC SMALL B
" U+1D624 	𝘤 	\mitsansc 	MATHEMATICAL SANS-SERIF ITALIC SMALL C
" U+1D625 	𝘥 	\mitsansd 	MATHEMATICAL SANS-SERIF ITALIC SMALL D
" U+1D626 	𝘦 	\mitsanse 	MATHEMATICAL SANS-SERIF ITALIC SMALL E
" U+1D627 	𝘧 	\mitsansf 	MATHEMATICAL SANS-SERIF ITALIC SMALL F
" U+1D628 	𝘨 	\mitsansg 	MATHEMATICAL SANS-SERIF ITALIC SMALL G
" U+1D629 	𝘩 	\mitsansh 	MATHEMATICAL SANS-SERIF ITALIC SMALL H
" U+1D62A 	𝘪 	\mitsansi 	MATHEMATICAL SANS-SERIF ITALIC SMALL I
" U+1D62B 	𝘫 	\mitsansj 	MATHEMATICAL SANS-SERIF ITALIC SMALL J
" U+1D62C 	𝘬 	\mitsansk 	MATHEMATICAL SANS-SERIF ITALIC SMALL K
" U+1D62D 	𝘭 	\mitsansl 	MATHEMATICAL SANS-SERIF ITALIC SMALL L
" U+1D62E 	𝘮 	\mitsansm 	MATHEMATICAL SANS-SERIF ITALIC SMALL M
" U+1D62F 	𝘯 	\mitsansn 	MATHEMATICAL SANS-SERIF ITALIC SMALL N
" U+1D630 	𝘰 	\mitsanso 	MATHEMATICAL SANS-SERIF ITALIC SMALL O
" U+1D631 	𝘱 	\mitsansp 	MATHEMATICAL SANS-SERIF ITALIC SMALL P
" U+1D632 	𝘲 	\mitsansq 	MATHEMATICAL SANS-SERIF ITALIC SMALL Q
" U+1D633 	𝘳 	\mitsansr 	MATHEMATICAL SANS-SERIF ITALIC SMALL R
" U+1D634 	𝘴 	\mitsanss 	MATHEMATICAL SANS-SERIF ITALIC SMALL S
" U+1D635 	𝘵 	\mitsanst 	MATHEMATICAL SANS-SERIF ITALIC SMALL T
" U+1D636 	𝘶 	\mitsansu 	MATHEMATICAL SANS-SERIF ITALIC SMALL U
" U+1D637 	𝘷 	\mitsansv 	MATHEMATICAL SANS-SERIF ITALIC SMALL V
" U+1D638 	𝘸 	\mitsansw 	MATHEMATICAL SANS-SERIF ITALIC SMALL W
" U+1D639 	𝘹 	\mitsansx 	MATHEMATICAL SANS-SERIF ITALIC SMALL X
" U+1D63A 	𝘺 	\mitsansy 	MATHEMATICAL SANS-SERIF ITALIC SMALL Y
" U+1D63B 	𝘻 	\mitsansz 	MATHEMATICAL SANS-SERIF ITALIC SMALL Z
" U+1D63C 	𝘼 	\mbfitsansA 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL A
" U+1D63D 	𝘽 	\mbfitsansB 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL B
" U+1D63E 	𝘾 	\mbfitsansC 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL C
" U+1D63F 	𝘿 	\mbfitsansD 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL D
" U+1D640 	𝙀 	\mbfitsansE 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL E
" U+1D641 	𝙁 	\mbfitsansF 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL F
" U+1D642 	𝙂 	\mbfitsansG 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL G
" U+1D643 	𝙃 	\mbfitsansH 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL H
" U+1D644 	𝙄 	\mbfitsansI 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL I
" U+1D645 	𝙅 	\mbfitsansJ 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL J
" U+1D646 	𝙆 	\mbfitsansK 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL K
" U+1D647 	𝙇 	\mbfitsansL 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL L
" U+1D648 	𝙈 	\mbfitsansM 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL M
" U+1D649 	𝙉 	\mbfitsansN 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL N
" U+1D64A 	𝙊 	\mbfitsansO 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL O
" U+1D64B 	𝙋 	\mbfitsansP 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL P
" U+1D64C 	𝙌 	\mbfitsansQ 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL Q
" U+1D64D 	𝙍 	\mbfitsansR 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL R
" U+1D64E 	𝙎 	\mbfitsansS 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL S
" U+1D64F 	𝙏 	\mbfitsansT 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL T
" U+1D650 	𝙐 	\mbfitsansU 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL U
" U+1D651 	𝙑 	\mbfitsansV 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL V
" U+1D652 	𝙒 	\mbfitsansW 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL W
" U+1D653 	𝙓 	\mbfitsansX 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL X
" U+1D654 	𝙔 	\mbfitsansY 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL Y
" U+1D655 	𝙕 	\mbfitsansZ 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL Z
" U+1D656 	𝙖 	\mbfitsansa 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL A
" U+1D657 	𝙗 	\mbfitsansb 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL B
" U+1D658 	𝙘 	\mbfitsansc 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL C
" U+1D659 	𝙙 	\mbfitsansd 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL D
" U+1D65A 	𝙚 	\mbfitsanse 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL E
" U+1D65B 	𝙛 	\mbfitsansf 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL F
" U+1D65C 	𝙜 	\mbfitsansg 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL G
" U+1D65D 	𝙝 	\mbfitsansh 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL H
" U+1D65E 	𝙞 	\mbfitsansi 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL I
" U+1D65F 	𝙟 	\mbfitsansj 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL J
" U+1D660 	𝙠 	\mbfitsansk 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL K
" U+1D661 	𝙡 	\mbfitsansl 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL L
" U+1D662 	𝙢 	\mbfitsansm 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL M
" U+1D663 	𝙣 	\mbfitsansn 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL N
" U+1D664 	𝙤 	\mbfitsanso 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL O
" U+1D665 	𝙥 	\mbfitsansp 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL P
" U+1D666 	𝙦 	\mbfitsansq 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL Q
" U+1D667 	𝙧 	\mbfitsansr 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL R
" U+1D668 	𝙨 	\mbfitsanss 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL S
" U+1D669 	𝙩 	\mbfitsanst 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL T
" U+1D66A 	𝙪 	\mbfitsansu 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL U
" U+1D66B 	𝙫 	\mbfitsansv 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL V
" U+1D66C 	𝙬 	\mbfitsansw 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL W
" U+1D66D 	𝙭 	\mbfitsansx 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL X
" U+1D66E 	𝙮 	\mbfitsansy 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL Y
" U+1D66F 	𝙯 	\mbfitsansz 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL Z
" U+1D670 	𝙰 	\mttA 	MATHEMATICAL MONOSPACE CAPITAL A
" U+1D671 	𝙱 	\mttB 	MATHEMATICAL MONOSPACE CAPITAL B
" U+1D672 	𝙲 	\mttC 	MATHEMATICAL MONOSPACE CAPITAL C
" U+1D673 	𝙳 	\mttD 	MATHEMATICAL MONOSPACE CAPITAL D
" U+1D674 	𝙴 	\mttE 	MATHEMATICAL MONOSPACE CAPITAL E
" U+1D675 	𝙵 	\mttF 	MATHEMATICAL MONOSPACE CAPITAL F
" U+1D676 	𝙶 	\mttG 	MATHEMATICAL MONOSPACE CAPITAL G
" U+1D677 	𝙷 	\mttH 	MATHEMATICAL MONOSPACE CAPITAL H
" U+1D678 	𝙸 	\mttI 	MATHEMATICAL MONOSPACE CAPITAL I
" U+1D679 	𝙹 	\mttJ 	MATHEMATICAL MONOSPACE CAPITAL J
" U+1D67A 	𝙺 	\mttK 	MATHEMATICAL MONOSPACE CAPITAL K
" U+1D67B 	𝙻 	\mttL 	MATHEMATICAL MONOSPACE CAPITAL L
" U+1D67C 	𝙼 	\mttM 	MATHEMATICAL MONOSPACE CAPITAL M
" U+1D67D 	𝙽 	\mttN 	MATHEMATICAL MONOSPACE CAPITAL N
" U+1D67E 	𝙾 	\mttO 	MATHEMATICAL MONOSPACE CAPITAL O
" U+1D67F 	𝙿 	\mttP 	MATHEMATICAL MONOSPACE CAPITAL P
" U+1D680 	𝚀 	\mttQ 	MATHEMATICAL MONOSPACE CAPITAL Q
" U+1D681 	𝚁 	\mttR 	MATHEMATICAL MONOSPACE CAPITAL R
" U+1D682 	𝚂 	\mttS 	MATHEMATICAL MONOSPACE CAPITAL S
" U+1D683 	𝚃 	\mttT 	MATHEMATICAL MONOSPACE CAPITAL T
" U+1D684 	𝚄 	\mttU 	MATHEMATICAL MONOSPACE CAPITAL U
" U+1D685 	𝚅 	\mttV 	MATHEMATICAL MONOSPACE CAPITAL V
" U+1D686 	𝚆 	\mttW 	MATHEMATICAL MONOSPACE CAPITAL W
" U+1D687 	𝚇 	\mttX 	MATHEMATICAL MONOSPACE CAPITAL X
" U+1D688 	𝚈 	\mttY 	MATHEMATICAL MONOSPACE CAPITAL Y
" U+1D689 	𝚉 	\mttZ 	MATHEMATICAL MONOSPACE CAPITAL Z
" U+1D68A 	𝚊 	\mtta 	MATHEMATICAL MONOSPACE SMALL A
" U+1D68B 	𝚋 	\mttb 	MATHEMATICAL MONOSPACE SMALL B
" U+1D68C 	𝚌 	\mttc 	MATHEMATICAL MONOSPACE SMALL C
" U+1D68D 	𝚍 	\mttd 	MATHEMATICAL MONOSPACE SMALL D
" U+1D68E 	𝚎 	\mtte 	MATHEMATICAL MONOSPACE SMALL E
" U+1D68F 	𝚏 	\mttf 	MATHEMATICAL MONOSPACE SMALL F
" U+1D690 	𝚐 	\mttg 	MATHEMATICAL MONOSPACE SMALL G
" U+1D691 	𝚑 	\mtth 	MATHEMATICAL MONOSPACE SMALL H
" U+1D692 	𝚒 	\mtti 	MATHEMATICAL MONOSPACE SMALL I
" U+1D693 	𝚓 	\mttj 	MATHEMATICAL MONOSPACE SMALL J
" U+1D694 	𝚔 	\mttk 	MATHEMATICAL MONOSPACE SMALL K
" U+1D695 	𝚕 	\mttl 	MATHEMATICAL MONOSPACE SMALL L
" U+1D696 	𝚖 	\mttm 	MATHEMATICAL MONOSPACE SMALL M
" U+1D697 	𝚗 	\mttn 	MATHEMATICAL MONOSPACE SMALL N
" U+1D698 	𝚘 	\mtto 	MATHEMATICAL MONOSPACE SMALL O
" U+1D699 	𝚙 	\mttp 	MATHEMATICAL MONOSPACE SMALL P
" U+1D69A 	𝚚 	\mttq 	MATHEMATICAL MONOSPACE SMALL Q
" U+1D69B 	𝚛 	\mttr 	MATHEMATICAL MONOSPACE SMALL R
" U+1D69C 	𝚜 	\mtts 	MATHEMATICAL MONOSPACE SMALL S
" U+1D69D 	𝚝 	\mttt 	MATHEMATICAL MONOSPACE SMALL T
" U+1D69E 	𝚞 	\mttu 	MATHEMATICAL MONOSPACE SMALL U
" U+1D69F 	𝚟 	\mttv 	MATHEMATICAL MONOSPACE SMALL V
" U+1D6A0 	𝚠 	\mttw 	MATHEMATICAL MONOSPACE SMALL W
" U+1D6A1 	𝚡 	\mttx 	MATHEMATICAL MONOSPACE SMALL X
" U+1D6A2 	𝚢 	\mtty 	MATHEMATICAL MONOSPACE SMALL Y
" U+1D6A3 	𝚣 	\mttz 	MATHEMATICAL MONOSPACE SMALL Z
" U+1D6A4 	𝚤 	\imath 	MATHEMATICAL ITALIC SMALL DOTLESS I
" U+1D6A5 	𝚥 	\jmath 	MATHEMATICAL ITALIC SMALL DOTLESS J
" U+1D6A8 	𝚨 	\mbfAlpha 	MATHEMATICAL BOLD CAPITAL ALPHA
" U+1D6A9 	𝚩 	\mbfBeta 	MATHEMATICAL BOLD CAPITAL BETA
" U+1D6AA 	𝚪 	\mbfGamma 	MATHEMATICAL BOLD CAPITAL GAMMA
" U+1D6AB 	𝚫 	\mbfDelta 	MATHEMATICAL BOLD CAPITAL DELTA
" U+1D6AC 	𝚬 	\mbfEpsilon 	MATHEMATICAL BOLD CAPITAL EPSILON
" U+1D6AD 	𝚭 	\mbfZeta 	MATHEMATICAL BOLD CAPITAL ZETA
" U+1D6AE 	𝚮 	\mbfEta 	MATHEMATICAL BOLD CAPITAL ETA
" U+1D6AF 	𝚯 	\mbfTheta 	MATHEMATICAL BOLD CAPITAL THETA
" U+1D6B0 	𝚰 	\mbfIota 	MATHEMATICAL BOLD CAPITAL IOTA
" U+1D6B1 	𝚱 	\mbfKappa 	MATHEMATICAL BOLD CAPITAL KAPPA
" U+1D6B2 	𝚲 	\mbfLambda 	MATHEMATICAL BOLD CAPITAL LAMDA
" U+1D6B3 	𝚳 	\mbfMu 	MATHEMATICAL BOLD CAPITAL MU
" U+1D6B4 	𝚴 	\mbfNu 	MATHEMATICAL BOLD CAPITAL NU
" U+1D6B5 	𝚵 	\mbfXi 	MATHEMATICAL BOLD CAPITAL XI
" U+1D6B6 	𝚶 	\mbfOmicron 	MATHEMATICAL BOLD CAPITAL OMICRON
" U+1D6B7 	𝚷 	\mbfPi 	MATHEMATICAL BOLD CAPITAL PI
" U+1D6B8 	𝚸 	\mbfRho 	MATHEMATICAL BOLD CAPITAL RHO
" U+1D6B9 	𝚹 	\mbfvarTheta 	MATHEMATICAL BOLD CAPITAL THETA SYMBOL
" U+1D6BA 	𝚺 	\mbfSigma 	MATHEMATICAL BOLD CAPITAL SIGMA
" U+1D6BB 	𝚻 	\mbfTau 	MATHEMATICAL BOLD CAPITAL TAU
" U+1D6BC 	𝚼 	\mbfUpsilon 	MATHEMATICAL BOLD CAPITAL UPSILON
" U+1D6BD 	𝚽 	\mbfPhi 	MATHEMATICAL BOLD CAPITAL PHI
" U+1D6BE 	𝚾 	\mbfChi 	MATHEMATICAL BOLD CAPITAL CHI
" U+1D6BF 	𝚿 	\mbfPsi 	MATHEMATICAL BOLD CAPITAL PSI
" U+1D6C0 	𝛀 	\mbfOmega 	MATHEMATICAL BOLD CAPITAL OMEGA
" U+1D6C1 	𝛁 	\mbfnabla 	MATHEMATICAL BOLD NABLA
" U+1D6C2 	𝛂 	\mbfalpha 	MATHEMATICAL BOLD SMALL ALPHA
" U+1D6C3 	𝛃 	\mbfbeta 	MATHEMATICAL BOLD SMALL BETA
" U+1D6C4 	𝛄 	\mbfgamma 	MATHEMATICAL BOLD SMALL GAMMA
" U+1D6C5 	𝛅 	\mbfdelta 	MATHEMATICAL BOLD SMALL DELTA
" U+1D6C6 	𝛆 	\mbfepsilon 	MATHEMATICAL BOLD SMALL EPSILON
" U+1D6C7 	𝛇 	\mbfzeta 	MATHEMATICAL BOLD SMALL ZETA
" U+1D6C8 	𝛈 	\mbfeta 	MATHEMATICAL BOLD SMALL ETA
" U+1D6C9 	𝛉 	\mbftheta 	MATHEMATICAL BOLD SMALL THETA
" U+1D6CA 	𝛊 	\mbfiota 	MATHEMATICAL BOLD SMALL IOTA
" U+1D6CB 	𝛋 	\mbfkappa 	MATHEMATICAL BOLD SMALL KAPPA
" U+1D6CC 	𝛌 	\mbflambda 	MATHEMATICAL BOLD SMALL LAMDA
" U+1D6CD 	𝛍 	\mbfmu 	MATHEMATICAL BOLD SMALL MU
" U+1D6CE 	𝛎 	\mbfnu 	MATHEMATICAL BOLD SMALL NU
" U+1D6CF 	𝛏 	\mbfxi 	MATHEMATICAL BOLD SMALL XI
" U+1D6D0 	𝛐 	\mbfomicron 	MATHEMATICAL BOLD SMALL OMICRON
" U+1D6D1 	𝛑 	\mbfpi 	MATHEMATICAL BOLD SMALL PI
" U+1D6D2 	𝛒 	\mbfrho 	MATHEMATICAL BOLD SMALL RHO
" U+1D6D3 	𝛓 	\mbfvarsigma 	MATHEMATICAL BOLD SMALL FINAL SIGMA
" U+1D6D4 	𝛔 	\mbfsigma 	MATHEMATICAL BOLD SMALL SIGMA
" U+1D6D5 	𝛕 	\mbftau 	MATHEMATICAL BOLD SMALL TAU
" U+1D6D6 	𝛖 	\mbfupsilon 	MATHEMATICAL BOLD SMALL UPSILON
" U+1D6D7 	𝛗 	\mbfvarphi 	MATHEMATICAL BOLD SMALL PHI
" U+1D6D8 	𝛘 	\mbfchi 	MATHEMATICAL BOLD SMALL CHI
" U+1D6D9 	𝛙 	\mbfpsi 	MATHEMATICAL BOLD SMALL PSI
" U+1D6DA 	𝛚 	\mbfomega 	MATHEMATICAL BOLD SMALL OMEGA
" U+1D6DB 	𝛛 	\mbfpartial 	MATHEMATICAL BOLD PARTIAL DIFFERENTIAL
" U+1D6DC 	𝛜 	\mbfvarepsilon 	MATHEMATICAL BOLD EPSILON SYMBOL
" U+1D6DD 	𝛝 	\mbfvartheta 	MATHEMATICAL BOLD THETA SYMBOL
" U+1D6DE 	𝛞 	\mbfvarkappa 	MATHEMATICAL BOLD KAPPA SYMBOL
" U+1D6DF 	𝛟 	\mbfphi 	MATHEMATICAL BOLD PHI SYMBOL
" U+1D6E0 	𝛠 	\mbfvarrho 	MATHEMATICAL BOLD RHO SYMBOL
" U+1D6E1 	𝛡 	\mbfvarpi 	MATHEMATICAL BOLD PI SYMBOL
" U+1D6E2 	𝛢 	\mitAlpha 	MATHEMATICAL ITALIC CAPITAL ALPHA
" U+1D6E3 	𝛣 	\mitBeta 	MATHEMATICAL ITALIC CAPITAL BETA
" U+1D6E4 	𝛤 	\mitGamma 	MATHEMATICAL ITALIC CAPITAL GAMMA
" U+1D6E5 	𝛥 	\mitDelta 	MATHEMATICAL ITALIC CAPITAL DELTA
" U+1D6E6 	𝛦 	\mitEpsilon 	MATHEMATICAL ITALIC CAPITAL EPSILON
" U+1D6E7 	𝛧 	\mitZeta 	MATHEMATICAL ITALIC CAPITAL ZETA
" U+1D6E8 	𝛨 	\mitEta 	MATHEMATICAL ITALIC CAPITAL ETA
" U+1D6E9 	𝛩 	\mitTheta 	MATHEMATICAL ITALIC CAPITAL THETA
" U+1D6EA 	𝛪 	\mitIota 	MATHEMATICAL ITALIC CAPITAL IOTA
" U+1D6EB 	𝛫 	\mitKappa 	MATHEMATICAL ITALIC CAPITAL KAPPA
" U+1D6EC 	𝛬 	\mitLambda 	MATHEMATICAL ITALIC CAPITAL LAMDA
" U+1D6ED 	𝛭 	\mitMu 	MATHEMATICAL ITALIC CAPITAL MU
" U+1D6EE 	𝛮 	\mitNu 	MATHEMATICAL ITALIC CAPITAL NU
" U+1D6EF 	𝛯 	\mitXi 	MATHEMATICAL ITALIC CAPITAL XI
" U+1D6F0 	𝛰 	\mitOmicron 	MATHEMATICAL ITALIC CAPITAL OMICRON
" U+1D6F1 	𝛱 	\mitPi 	MATHEMATICAL ITALIC CAPITAL PI
" U+1D6F2 	𝛲 	\mitRho 	MATHEMATICAL ITALIC CAPITAL RHO
" U+1D6F3 	𝛳 	\mitvarTheta 	MATHEMATICAL ITALIC CAPITAL THETA SYMBOL
" U+1D6F4 	𝛴 	\mitSigma 	MATHEMATICAL ITALIC CAPITAL SIGMA
" U+1D6F5 	𝛵 	\mitTau 	MATHEMATICAL ITALIC CAPITAL TAU
" U+1D6F6 	𝛶 	\mitUpsilon 	MATHEMATICAL ITALIC CAPITAL UPSILON
" U+1D6F7 	𝛷 	\mitPhi 	MATHEMATICAL ITALIC CAPITAL PHI
" U+1D6F8 	𝛸 	\mitChi 	MATHEMATICAL ITALIC CAPITAL CHI
" U+1D6F9 	𝛹 	\mitPsi 	MATHEMATICAL ITALIC CAPITAL PSI
" U+1D6FA 	𝛺 	\mitOmega 	MATHEMATICAL ITALIC CAPITAL OMEGA
" U+1D6FB 	𝛻 	\mitnabla 	MATHEMATICAL ITALIC NABLA
" U+1D6FC 	𝛼 	\mitalpha 	MATHEMATICAL ITALIC SMALL ALPHA
" U+1D6FD 	𝛽 	\mitbeta 	MATHEMATICAL ITALIC SMALL BETA
" U+1D6FE 	𝛾 	\mitgamma 	MATHEMATICAL ITALIC SMALL GAMMA
" U+1D6FF 	𝛿 	\mitdelta 	MATHEMATICAL ITALIC SMALL DELTA
" U+1D700 	𝜀 	\mitepsilon 	MATHEMATICAL ITALIC SMALL EPSILON
" U+1D701 	𝜁 	\mitzeta 	MATHEMATICAL ITALIC SMALL ZETA
" U+1D702 	𝜂 	\miteta 	MATHEMATICAL ITALIC SMALL ETA
" U+1D703 	𝜃 	\mittheta 	MATHEMATICAL ITALIC SMALL THETA
" U+1D704 	𝜄 	\mitiota 	MATHEMATICAL ITALIC SMALL IOTA
" U+1D705 	𝜅 	\mitkappa 	MATHEMATICAL ITALIC SMALL KAPPA
" U+1D706 	𝜆 	\mitlambda 	MATHEMATICAL ITALIC SMALL LAMDA
" U+1D707 	𝜇 	\mitmu 	MATHEMATICAL ITALIC SMALL MU
" U+1D708 	𝜈 	\mitnu 	MATHEMATICAL ITALIC SMALL NU
" U+1D709 	𝜉 	\mitxi 	MATHEMATICAL ITALIC SMALL XI
" U+1D70A 	𝜊 	\mitomicron 	MATHEMATICAL ITALIC SMALL OMICRON
" U+1D70B 	𝜋 	\mitpi 	MATHEMATICAL ITALIC SMALL PI
" U+1D70C 	𝜌 	\mitrho 	MATHEMATICAL ITALIC SMALL RHO
" U+1D70D 	𝜍 	\mitvarsigma 	MATHEMATICAL ITALIC SMALL FINAL SIGMA
" U+1D70E 	𝜎 	\mitsigma 	MATHEMATICAL ITALIC SMALL SIGMA
" U+1D70F 	𝜏 	\mittau 	MATHEMATICAL ITALIC SMALL TAU
" U+1D710 	𝜐 	\mitupsilon 	MATHEMATICAL ITALIC SMALL UPSILON
" U+1D711 	𝜑 	\mitphi 	MATHEMATICAL ITALIC SMALL PHI
" U+1D712 	𝜒 	\mitchi 	MATHEMATICAL ITALIC SMALL CHI
" U+1D713 	𝜓 	\mitpsi 	MATHEMATICAL ITALIC SMALL PSI
" U+1D714 	𝜔 	\mitomega 	MATHEMATICAL ITALIC SMALL OMEGA
" U+1D715 	𝜕 	\mitpartial 	MATHEMATICAL ITALIC PARTIAL DIFFERENTIAL
" U+1D716 	𝜖 	\mitvarepsilon 	MATHEMATICAL ITALIC EPSILON SYMBOL
" U+1D717 	𝜗 	\mitvartheta 	MATHEMATICAL ITALIC THETA SYMBOL
" U+1D718 	𝜘 	\mitvarkappa 	MATHEMATICAL ITALIC KAPPA SYMBOL
" U+1D719 	𝜙 	\mitvarphi 	MATHEMATICAL ITALIC PHI SYMBOL
" U+1D71A 	𝜚 	\mitvarrho 	MATHEMATICAL ITALIC RHO SYMBOL
" U+1D71B 	𝜛 	\mitvarpi 	MATHEMATICAL ITALIC PI SYMBOL
" U+1D71C 	𝜜 	\mbfitAlpha 	MATHEMATICAL BOLD ITALIC CAPITAL ALPHA
" U+1D71D 	𝜝 	\mbfitBeta 	MATHEMATICAL BOLD ITALIC CAPITAL BETA
" U+1D71E 	𝜞 	\mbfitGamma 	MATHEMATICAL BOLD ITALIC CAPITAL GAMMA
" U+1D71F 	𝜟 	\mbfitDelta 	MATHEMATICAL BOLD ITALIC CAPITAL DELTA
" U+1D720 	𝜠 	\mbfitEpsilon 	MATHEMATICAL BOLD ITALIC CAPITAL EPSILON
" U+1D721 	𝜡 	\mbfitZeta 	MATHEMATICAL BOLD ITALIC CAPITAL ZETA
" U+1D722 	𝜢 	\mbfitEta 	MATHEMATICAL BOLD ITALIC CAPITAL ETA
" U+1D723 	𝜣 	\mbfitTheta 	MATHEMATICAL BOLD ITALIC CAPITAL THETA
" U+1D724 	𝜤 	\mbfitIota 	MATHEMATICAL BOLD ITALIC CAPITAL IOTA
" U+1D725 	𝜥 	\mbfitKappa 	MATHEMATICAL BOLD ITALIC CAPITAL KAPPA
" U+1D726 	𝜦 	\mbfitLambda 	MATHEMATICAL BOLD ITALIC CAPITAL LAMDA
" U+1D727 	𝜧 	\mbfitMu 	MATHEMATICAL BOLD ITALIC CAPITAL MU
" U+1D728 	𝜨 	\mbfitNu 	MATHEMATICAL BOLD ITALIC CAPITAL NU
" U+1D729 	𝜩 	\mbfitXi 	MATHEMATICAL BOLD ITALIC CAPITAL XI
" U+1D72A 	𝜪 	\mbfitOmicron 	MATHEMATICAL BOLD ITALIC CAPITAL OMICRON
" U+1D72B 	𝜫 	\mbfitPi 	MATHEMATICAL BOLD ITALIC CAPITAL PI
" U+1D72C 	𝜬 	\mbfitRho 	MATHEMATICAL BOLD ITALIC CAPITAL RHO
" U+1D72D 	𝜭 	\mbfitvarTheta 	MATHEMATICAL BOLD ITALIC CAPITAL THETA SYMBOL
" U+1D72E 	𝜮 	\mbfitSigma 	MATHEMATICAL BOLD ITALIC CAPITAL SIGMA
" U+1D72F 	𝜯 	\mbfitTau 	MATHEMATICAL BOLD ITALIC CAPITAL TAU
" U+1D730 	𝜰 	\mbfitUpsilon 	MATHEMATICAL BOLD ITALIC CAPITAL UPSILON
" U+1D731 	𝜱 	\mbfitPhi 	MATHEMATICAL BOLD ITALIC CAPITAL PHI
" U+1D732 	𝜲 	\mbfitChi 	MATHEMATICAL BOLD ITALIC CAPITAL CHI
" U+1D733 	𝜳 	\mbfitPsi 	MATHEMATICAL BOLD ITALIC CAPITAL PSI
" U+1D734 	𝜴 	\mbfitOmega 	MATHEMATICAL BOLD ITALIC CAPITAL OMEGA
" U+1D735 	𝜵 	\mbfitnabla 	MATHEMATICAL BOLD ITALIC NABLA
" U+1D736 	𝜶 	\mbfitalpha 	MATHEMATICAL BOLD ITALIC SMALL ALPHA
" U+1D737 	𝜷 	\mbfitbeta 	MATHEMATICAL BOLD ITALIC SMALL BETA
" U+1D738 	𝜸 	\mbfitgamma 	MATHEMATICAL BOLD ITALIC SMALL GAMMA
" U+1D739 	𝜹 	\mbfitdelta 	MATHEMATICAL BOLD ITALIC SMALL DELTA
" U+1D73A 	𝜺 	\mbfitepsilon 	MATHEMATICAL BOLD ITALIC SMALL EPSILON
" U+1D73B 	𝜻 	\mbfitzeta 	MATHEMATICAL BOLD ITALIC SMALL ZETA
" U+1D73C 	𝜼 	\mbfiteta 	MATHEMATICAL BOLD ITALIC SMALL ETA
" U+1D73D 	𝜽 	\mbfittheta 	MATHEMATICAL BOLD ITALIC SMALL THETA
" U+1D73E 	𝜾 	\mbfitiota 	MATHEMATICAL BOLD ITALIC SMALL IOTA
" U+1D73F 	𝜿 	\mbfitkappa 	MATHEMATICAL BOLD ITALIC SMALL KAPPA
" U+1D740 	𝝀 	\mbfitlambda 	MATHEMATICAL BOLD ITALIC SMALL LAMDA
" U+1D741 	𝝁 	\mbfitmu 	MATHEMATICAL BOLD ITALIC SMALL MU
" U+1D742 	𝝂 	\mbfitnu 	MATHEMATICAL BOLD ITALIC SMALL NU
" U+1D743 	𝝃 	\mbfitxi 	MATHEMATICAL BOLD ITALIC SMALL XI
" U+1D744 	𝝄 	\mbfitomicron 	MATHEMATICAL BOLD ITALIC SMALL OMICRON
" U+1D745 	𝝅 	\mbfitpi 	MATHEMATICAL BOLD ITALIC SMALL PI
" U+1D746 	𝝆 	\mbfitrho 	MATHEMATICAL BOLD ITALIC SMALL RHO
" U+1D747 	𝝇 	\mbfitvarsigma 	MATHEMATICAL BOLD ITALIC SMALL FINAL SIGMA
" U+1D748 	𝝈 	\mbfitsigma 	MATHEMATICAL BOLD ITALIC SMALL SIGMA
" U+1D749 	𝝉 	\mbfittau 	MATHEMATICAL BOLD ITALIC SMALL TAU
" U+1D74A 	𝝊 	\mbfitupsilon 	MATHEMATICAL BOLD ITALIC SMALL UPSILON
" U+1D74B 	𝝋 	\mbfitphi 	MATHEMATICAL BOLD ITALIC SMALL PHI
" U+1D74C 	𝝌 	\mbfitchi 	MATHEMATICAL BOLD ITALIC SMALL CHI
" U+1D74D 	𝝍 	\mbfitpsi 	MATHEMATICAL BOLD ITALIC SMALL PSI
" U+1D74E 	𝝎 	\mbfitomega 	MATHEMATICAL BOLD ITALIC SMALL OMEGA
" U+1D74F 	𝝏 	\mbfitpartial 	MATHEMATICAL BOLD ITALIC PARTIAL DIFFERENTIAL
" U+1D750 	𝝐 	\mbfitvarepsilon 	MATHEMATICAL BOLD ITALIC EPSILON SYMBOL
" U+1D751 	𝝑 	\mbfitvartheta 	MATHEMATICAL BOLD ITALIC THETA SYMBOL
" U+1D752 	𝝒 	\mbfitvarkappa 	MATHEMATICAL BOLD ITALIC KAPPA SYMBOL
" U+1D753 	𝝓 	\mbfitvarphi 	MATHEMATICAL BOLD ITALIC PHI SYMBOL
" U+1D754 	𝝔 	\mbfitvarrho 	MATHEMATICAL BOLD ITALIC RHO SYMBOL
" U+1D755 	𝝕 	\mbfitvarpi 	MATHEMATICAL BOLD ITALIC PI SYMBOL
" U+1D756 	𝝖 	\mbfsansAlpha 	MATHEMATICAL SANS-SERIF BOLD CAPITAL ALPHA
" U+1D757 	𝝗 	\mbfsansBeta 	MATHEMATICAL SANS-SERIF BOLD CAPITAL BETA
" U+1D758 	𝝘 	\mbfsansGamma 	MATHEMATICAL SANS-SERIF BOLD CAPITAL GAMMA
" U+1D759 	𝝙 	\mbfsansDelta 	MATHEMATICAL SANS-SERIF BOLD CAPITAL DELTA
" U+1D75A 	𝝚 	\mbfsansEpsilon 	MATHEMATICAL SANS-SERIF BOLD CAPITAL EPSILON
" U+1D75B 	𝝛 	\mbfsansZeta 	MATHEMATICAL SANS-SERIF BOLD CAPITAL ZETA
" U+1D75C 	𝝜 	\mbfsansEta 	MATHEMATICAL SANS-SERIF BOLD CAPITAL ETA
" U+1D75D 	𝝝 	\mbfsansTheta 	MATHEMATICAL SANS-SERIF BOLD CAPITAL THETA
" U+1D75E 	𝝞 	\mbfsansIota 	MATHEMATICAL SANS-SERIF BOLD CAPITAL IOTA
" U+1D75F 	𝝟 	\mbfsansKappa 	MATHEMATICAL SANS-SERIF BOLD CAPITAL KAPPA
" U+1D760 	𝝠 	\mbfsansLambda 	MATHEMATICAL SANS-SERIF BOLD CAPITAL LAMDA
" U+1D761 	𝝡 	\mbfsansMu 	MATHEMATICAL SANS-SERIF BOLD CAPITAL MU
" U+1D762 	𝝢 	\mbfsansNu 	MATHEMATICAL SANS-SERIF BOLD CAPITAL NU
" U+1D763 	𝝣 	\mbfsansXi 	MATHEMATICAL SANS-SERIF BOLD CAPITAL XI
" U+1D764 	𝝤 	\mbfsansOmicron 	MATHEMATICAL SANS-SERIF BOLD CAPITAL OMICRON
" U+1D765 	𝝥 	\mbfsansPi 	MATHEMATICAL SANS-SERIF BOLD CAPITAL PI
" U+1D766 	𝝦 	\mbfsansRho 	MATHEMATICAL SANS-SERIF BOLD CAPITAL RHO
" U+1D767 	𝝧 	\mbfsansvarTheta 	MATHEMATICAL SANS-SERIF BOLD CAPITAL THETA SYMBOL
" U+1D768 	𝝨 	\mbfsansSigma 	MATHEMATICAL SANS-SERIF BOLD CAPITAL SIGMA
" U+1D769 	𝝩 	\mbfsansTau 	MATHEMATICAL SANS-SERIF BOLD CAPITAL TAU
" U+1D76A 	𝝪 	\mbfsansUpsilon 	MATHEMATICAL SANS-SERIF BOLD CAPITAL UPSILON
" U+1D76B 	𝝫 	\mbfsansPhi 	MATHEMATICAL SANS-SERIF BOLD CAPITAL PHI
" U+1D76C 	𝝬 	\mbfsansChi 	MATHEMATICAL SANS-SERIF BOLD CAPITAL CHI
" U+1D76D 	𝝭 	\mbfsansPsi 	MATHEMATICAL SANS-SERIF BOLD CAPITAL PSI
" U+1D76E 	𝝮 	\mbfsansOmega 	MATHEMATICAL SANS-SERIF BOLD CAPITAL OMEGA
" U+1D76F 	𝝯 	\mbfsansnabla 	MATHEMATICAL SANS-SERIF BOLD NABLA
" U+1D770 	𝝰 	\mbfsansalpha 	MATHEMATICAL SANS-SERIF BOLD SMALL ALPHA
" U+1D771 	𝝱 	\mbfsansbeta 	MATHEMATICAL SANS-SERIF BOLD SMALL BETA
" U+1D772 	𝝲 	\mbfsansgamma 	MATHEMATICAL SANS-SERIF BOLD SMALL GAMMA
" U+1D773 	𝝳 	\mbfsansdelta 	MATHEMATICAL SANS-SERIF BOLD SMALL DELTA
" U+1D774 	𝝴 	\mbfsansepsilon 	MATHEMATICAL SANS-SERIF BOLD SMALL EPSILON
" U+1D775 	𝝵 	\mbfsanszeta 	MATHEMATICAL SANS-SERIF BOLD SMALL ZETA
" U+1D776 	𝝶 	\mbfsanseta 	MATHEMATICAL SANS-SERIF BOLD SMALL ETA
" U+1D777 	𝝷 	\mbfsanstheta 	MATHEMATICAL SANS-SERIF BOLD SMALL THETA
" U+1D778 	𝝸 	\mbfsansiota 	MATHEMATICAL SANS-SERIF BOLD SMALL IOTA
" U+1D779 	𝝹 	\mbfsanskappa 	MATHEMATICAL SANS-SERIF BOLD SMALL KAPPA
" U+1D77A 	𝝺 	\mbfsanslambda 	MATHEMATICAL SANS-SERIF BOLD SMALL LAMDA
" U+1D77B 	𝝻 	\mbfsansmu 	MATHEMATICAL SANS-SERIF BOLD SMALL MU
" U+1D77C 	𝝼 	\mbfsansnu 	MATHEMATICAL SANS-SERIF BOLD SMALL NU
" U+1D77D 	𝝽 	\mbfsansxi 	MATHEMATICAL SANS-SERIF BOLD SMALL XI
" U+1D77E 	𝝾 	\mbfsansomicron 	MATHEMATICAL SANS-SERIF BOLD SMALL OMICRON
" U+1D77F 	𝝿 	\mbfsanspi 	MATHEMATICAL SANS-SERIF BOLD SMALL PI
" U+1D780 	𝞀 	\mbfsansrho 	MATHEMATICAL SANS-SERIF BOLD SMALL RHO
" U+1D781 	𝞁 	\mbfsansvarsigma 	MATHEMATICAL SANS-SERIF BOLD SMALL FINAL SIGMA
" U+1D782 	𝞂 	\mbfsanssigma 	MATHEMATICAL SANS-SERIF BOLD SMALL SIGMA
" U+1D783 	𝞃 	\mbfsanstau 	MATHEMATICAL SANS-SERIF BOLD SMALL TAU
" U+1D784 	𝞄 	\mbfsansupsilon 	MATHEMATICAL SANS-SERIF BOLD SMALL UPSILON
" U+1D785 	𝞅 	\mbfsansphi 	MATHEMATICAL SANS-SERIF BOLD SMALL PHI
" U+1D786 	𝞆 	\mbfsanschi 	MATHEMATICAL SANS-SERIF BOLD SMALL CHI
" U+1D787 	𝞇 	\mbfsanspsi 	MATHEMATICAL SANS-SERIF BOLD SMALL PSI
" U+1D788 	𝞈 	\mbfsansomega 	MATHEMATICAL SANS-SERIF BOLD SMALL OMEGA
" U+1D789 	𝞉 	\mbfsanspartial 	MATHEMATICAL SANS-SERIF BOLD PARTIAL DIFFERENTIAL
" U+1D78A 	𝞊 	\mbfsansvarepsilon 	MATHEMATICAL SANS-SERIF BOLD EPSILON SYMBOL
" U+1D78B 	𝞋 	\mbfsansvartheta 	MATHEMATICAL SANS-SERIF BOLD THETA SYMBOL
" U+1D78C 	𝞌 	\mbfsansvarkappa 	MATHEMATICAL SANS-SERIF BOLD KAPPA SYMBOL
" U+1D78D 	𝞍 	\mbfsansvarphi 	MATHEMATICAL SANS-SERIF BOLD PHI SYMBOL
" U+1D78E 	𝞎 	\mbfsansvarrho 	MATHEMATICAL SANS-SERIF BOLD RHO SYMBOL
" U+1D78F 	𝞏 	\mbfsansvarpi 	MATHEMATICAL SANS-SERIF BOLD PI SYMBOL
" U+1D790 	𝞐 	\mbfitsansAlpha 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL ALPHA
" U+1D791 	𝞑 	\mbfitsansBeta 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL BETA
" U+1D792 	𝞒 	\mbfitsansGamma 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL GAMMA
" U+1D793 	𝞓 	\mbfitsansDelta 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL DELTA
" U+1D794 	𝞔 	\mbfitsansEpsilon 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL EPSILON
" U+1D795 	𝞕 	\mbfitsansZeta 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL ZETA
" U+1D796 	𝞖 	\mbfitsansEta 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL ETA
" U+1D797 	𝞗 	\mbfitsansTheta 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL THETA
" U+1D798 	𝞘 	\mbfitsansIota 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL IOTA
" U+1D799 	𝞙 	\mbfitsansKappa 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL KAPPA
" U+1D79A 	𝞚 	\mbfitsansLambda 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL LAMDA
" U+1D79B 	𝞛 	\mbfitsansMu 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL MU
" U+1D79C 	𝞜 	\mbfitsansNu 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL NU
" U+1D79D 	𝞝 	\mbfitsansXi 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL XI
" U+1D79E 	𝞞 	\mbfitsansOmicron 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL OMICRON
" U+1D79F 	𝞟 	\mbfitsansPi 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL PI
" U+1D7A0 	𝞠 	\mbfitsansRho 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL RHO
" U+1D7A1 	𝞡 	\mbfitsansvarTheta 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL THETA SYMBOL
" U+1D7A2 	𝞢 	\mbfitsansSigma 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL SIGMA
" U+1D7A3 	𝞣 	\mbfitsansTau 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL TAU
" U+1D7A4 	𝞤 	\mbfitsansUpsilon 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL UPSILON
" U+1D7A5 	𝞥 	\mbfitsansPhi 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL PHI
" U+1D7A6 	𝞦 	\mbfitsansChi 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL CHI
" U+1D7A7 	𝞧 	\mbfitsansPsi 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL PSI
" U+1D7A8 	𝞨 	\mbfitsansOmega 	MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL OMEGA
" U+1D7A9 	𝞩 	\mbfitsansnabla 	MATHEMATICAL SANS-SERIF BOLD ITALIC NABLA
" U+1D7AA 	𝞪 	\mbfitsansalpha 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL ALPHA
" U+1D7AB 	𝞫 	\mbfitsansbeta 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL BETA
" U+1D7AC 	𝞬 	\mbfitsansgamma 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL GAMMA
" U+1D7AD 	𝞭 	\mbfitsansdelta 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL DELTA
" U+1D7AE 	𝞮 	\mbfitsansepsilon 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL EPSILON
" U+1D7AF 	𝞯 	\mbfitsanszeta 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL ZETA
" U+1D7B0 	𝞰 	\mbfitsanseta 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL ETA
" U+1D7B1 	𝞱 	\mbfitsanstheta 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL THETA
" U+1D7B2 	𝞲 	\mbfitsansiota 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL IOTA
" U+1D7B3 	𝞳 	\mbfitsanskappa 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL KAPPA
" U+1D7B4 	𝞴 	\mbfitsanslambda 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL LAMDA
" U+1D7B5 	𝞵 	\mbfitsansmu 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL MU
" U+1D7B6 	𝞶 	\mbfitsansnu 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL NU
" U+1D7B7 	𝞷 	\mbfitsansxi 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL XI
" U+1D7B8 	𝞸 	\mbfitsansomicron 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL OMICRON
" U+1D7B9 	𝞹 	\mbfitsanspi 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL PI
" U+1D7BA 	𝞺 	\mbfitsansrho 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL RHO
" U+1D7BB 	𝞻 	\mbfitsansvarsigma 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL FINAL SIGMA
" U+1D7BC 	𝞼 	\mbfitsanssigma 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL SIGMA
" U+1D7BD 	𝞽 	\mbfitsanstau 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL TAU
" U+1D7BE 	𝞾 	\mbfitsansupsilon 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL UPSILON
" U+1D7BF 	𝞿 	\mbfitsansphi 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL PHI
" U+1D7C0 	𝟀 	\mbfitsanschi 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL CHI
" U+1D7C1 	𝟁 	\mbfitsanspsi 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL PSI
" U+1D7C2 	𝟂 	\mbfitsansomega 	MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL OMEGA
" U+1D7C3 	𝟃 	\mbfitsanspartial 	MATHEMATICAL SANS-SERIF BOLD ITALIC PARTIAL DIFFERENTIAL
" U+1D7C4 	𝟄 	\mbfitsansvarepsilon 	MATHEMATICAL SANS-SERIF BOLD ITALIC EPSILON SYMBOL
" U+1D7C5 	𝟅 	\mbfitsansvartheta 	MATHEMATICAL SANS-SERIF BOLD ITALIC THETA SYMBOL
" U+1D7C6 	𝟆 	\mbfitsansvarkappa 	MATHEMATICAL SANS-SERIF BOLD ITALIC KAPPA SYMBOL
" U+1D7C7 	𝟇 	\mbfitsansvarphi 	MATHEMATICAL SANS-SERIF BOLD ITALIC PHI SYMBOL
" U+1D7C8 	𝟈 	\mbfitsansvarrho 	MATHEMATICAL SANS-SERIF BOLD ITALIC RHO SYMBOL
" U+1D7C9 	𝟉 	\mbfitsansvarpi 	MATHEMATICAL SANS-SERIF BOLD ITALIC PI SYMBOL
" U+1D7CA 	𝟊 	\mbfDigamma 	MATHEMATICAL BOLD CAPITAL DIGAMMA
" U+1D7CB 	𝟋 	\mbfdigamma 	MATHEMATICAL BOLD SMALL DIGAMMA
" U+1D7CE 	𝟎 	\mbfzero 	MATHEMATICAL BOLD DIGIT ZERO
" U+1D7CF 	𝟏 	\mbfone 	MATHEMATICAL BOLD DIGIT ONE
" U+1D7D0 	𝟐 	\mbftwo 	MATHEMATICAL BOLD DIGIT TWO
" U+1D7D1 	𝟑 	\mbfthree 	MATHEMATICAL BOLD DIGIT THREE
" U+1D7D2 	𝟒 	\mbffour 	MATHEMATICAL BOLD DIGIT FOUR
" U+1D7D3 	𝟓 	\mbffive 	MATHEMATICAL BOLD DIGIT FIVE
" U+1D7D4 	𝟔 	\mbfsix 	MATHEMATICAL BOLD DIGIT SIX
" U+1D7D5 	𝟕 	\mbfseven 	MATHEMATICAL BOLD DIGIT SEVEN
" U+1D7D6 	𝟖 	\mbfeight 	MATHEMATICAL BOLD DIGIT EIGHT
" U+1D7D7 	𝟗 	\mbfnine 	MATHEMATICAL BOLD DIGIT NINE
" U+1D7D8 	𝟘 	\Bbbzero 	MATHEMATICAL DOUBLE-STRUCK DIGIT ZERO
" U+1D7D9 	𝟙 	\Bbbone 	MATHEMATICAL DOUBLE-STRUCK DIGIT ONE
" U+1D7DA 	𝟚 	\Bbbtwo 	MATHEMATICAL DOUBLE-STRUCK DIGIT TWO
" U+1D7DB 	𝟛 	\Bbbthree 	MATHEMATICAL DOUBLE-STRUCK DIGIT THREE
" U+1D7DC 	𝟜 	\Bbbfour 	MATHEMATICAL DOUBLE-STRUCK DIGIT FOUR
" U+1D7DD 	𝟝 	\Bbbfive 	MATHEMATICAL DOUBLE-STRUCK DIGIT FIVE
" U+1D7DE 	𝟞 	\Bbbsix 	MATHEMATICAL DOUBLE-STRUCK DIGIT SIX
" U+1D7DF 	𝟟 	\Bbbseven 	MATHEMATICAL DOUBLE-STRUCK DIGIT SEVEN
" U+1D7E0 	𝟠 	\Bbbeight 	MATHEMATICAL DOUBLE-STRUCK DIGIT EIGHT
" U+1D7E1 	𝟡 	\Bbbnine 	MATHEMATICAL DOUBLE-STRUCK DIGIT NINE
" U+1D7E2 	𝟢 	\msanszero 	MATHEMATICAL SANS-SERIF DIGIT ZERO
" U+1D7E3 	𝟣 	\msansone 	MATHEMATICAL SANS-SERIF DIGIT ONE
" U+1D7E4 	𝟤 	\msanstwo 	MATHEMATICAL SANS-SERIF DIGIT TWO
" U+1D7E5 	𝟥 	\msansthree 	MATHEMATICAL SANS-SERIF DIGIT THREE
" U+1D7E6 	𝟦 	\msansfour 	MATHEMATICAL SANS-SERIF DIGIT FOUR
" U+1D7E7 	𝟧 	\msansfive 	MATHEMATICAL SANS-SERIF DIGIT FIVE
" U+1D7E8 	𝟨 	\msanssix 	MATHEMATICAL SANS-SERIF DIGIT SIX
" U+1D7E9 	𝟩 	\msansseven 	MATHEMATICAL SANS-SERIF DIGIT SEVEN
" U+1D7EA 	𝟪 	\msanseight 	MATHEMATICAL SANS-SERIF DIGIT EIGHT
" U+1D7EB 	𝟫 	\msansnine 	MATHEMATICAL SANS-SERIF DIGIT NINE
" U+1D7EC 	𝟬 	\mbfsanszero 	MATHEMATICAL SANS-SERIF BOLD DIGIT ZERO
" U+1D7ED 	𝟭 	\mbfsansone 	MATHEMATICAL SANS-SERIF BOLD DIGIT ONE
" U+1D7EE 	𝟮 	\mbfsanstwo 	MATHEMATICAL SANS-SERIF BOLD DIGIT TWO
" U+1D7EF 	𝟯 	\mbfsansthree 	MATHEMATICAL SANS-SERIF BOLD DIGIT THREE
" U+1D7F0 	𝟰 	\mbfsansfour 	MATHEMATICAL SANS-SERIF BOLD DIGIT FOUR
" U+1D7F1 	𝟱 	\mbfsansfive 	MATHEMATICAL SANS-SERIF BOLD DIGIT FIVE
" U+1D7F2 	𝟲 	\mbfsanssix 	MATHEMATICAL SANS-SERIF BOLD DIGIT SIX
" U+1D7F3 	𝟳 	\mbfsansseven 	MATHEMATICAL SANS-SERIF BOLD DIGIT SEVEN
" U+1D7F4 	𝟴 	\mbfsanseight 	MATHEMATICAL SANS-SERIF BOLD DIGIT EIGHT
" U+1D7F5 	𝟵 	\mbfsansnine 	MATHEMATICAL SANS-SERIF BOLD DIGIT NINE
" U+1D7F6 	𝟶 	\mttzero 	MATHEMATICAL MONOSPACE DIGIT ZERO
" U+1D7F7 	𝟷 	\mttone 	MATHEMATICAL MONOSPACE DIGIT ONE
" U+1D7F8 	𝟸 	\mtttwo 	MATHEMATICAL MONOSPACE DIGIT TWO
" U+1D7F9 	𝟹 	\mttthree 	MATHEMATICAL MONOSPACE DIGIT THREE
" U+1D7FA 	𝟺 	\mttfour 	MATHEMATICAL MONOSPACE DIGIT FOUR
" U+1D7FB 	𝟻 	\mttfive 	MATHEMATICAL MONOSPACE DIGIT FIVE
" U+1D7FC 	𝟼 	\mttsix 	MATHEMATICAL MONOSPACE DIGIT SIX
" U+1D7FD 	𝟽 	\mttseven 	MATHEMATICAL MONOSPACE DIGIT SEVEN
" U+1D7FE 	𝟾 	\mtteight 	MATHEMATICAL MONOSPACE DIGIT EIGHT
" U+1D7FF 	𝟿 	\mttnine 	MATHEMATICAL MONOSPACE DIGIT NINE
" U+1F004 	🀄 	\:mahjong: 	MAHJONG TILE RED DRAGON
" U+1F0CF 	🃏 	\:black_joker: 	PLAYING CARD BLACK JOKER
" U+1F170 	🅰 	\:a: 	NEGATIVE SQUARED LATIN CAPITAL LETTER A
" U+1F171 	🅱 	\:b: 	NEGATIVE SQUARED LATIN CAPITAL LETTER B
" U+1F17E 	🅾 	\:o2: 	NEGATIVE SQUARED LATIN CAPITAL LETTER O
" U+1F17F 	🅿 	\:parking: 	NEGATIVE SQUARED LATIN CAPITAL LETTER P
" U+1F18E 	🆎 	\:ab: 	NEGATIVE SQUARED AB
" U+1F191 	🆑 	\:cl: 	SQUARED CL
" U+1F192 	🆒 	\:cool: 	SQUARED COOL
" U+1F193 	🆓 	\:free: 	SQUARED FREE
" U+1F194 	🆔 	\:id: 	SQUARED ID
" U+1F195 	🆕 	\:new: 	SQUARED NEW
" U+1F196 	🆖 	\:ng: 	SQUARED NG
" U+1F197 	🆗 	\:ok: 	SQUARED OK
" U+1F198 	🆘 	\:sos: 	SQUARED SOS
" U+1F199 	🆙 	\:up: 	SQUARED UP WITH EXCLAMATION MARK
" U+1F19A 	🆚 	\:vs: 	SQUARED VS
" U+1F201 	🈁 	\:koko: 	SQUARED KATAKANA KOKO
" U+1F202 	🈂 	\:sa: 	SQUARED KATAKANA SA
" U+1F21A 	🈚 	\:u7121: 	SQUARED CJK UNIFIED IDEOGRAPH-7121
" U+1F22F 	🈯 	\:u6307: 	SQUARED CJK UNIFIED IDEOGRAPH-6307
" U+1F232 	🈲 	\:u7981: 	SQUARED CJK UNIFIED IDEOGRAPH-7981
" U+1F233 	🈳 	\:u7a7a: 	SQUARED CJK UNIFIED IDEOGRAPH-7A7A
" U+1F234 	🈴 	\:u5408: 	SQUARED CJK UNIFIED IDEOGRAPH-5408
" U+1F235 	🈵 	\:u6e80: 	SQUARED CJK UNIFIED IDEOGRAPH-6E80
" U+1F236 	🈶 	\:u6709: 	SQUARED CJK UNIFIED IDEOGRAPH-6709
" U+1F237 	🈷 	\:u6708: 	SQUARED CJK UNIFIED IDEOGRAPH-6708
" U+1F238 	🈸 	\:u7533: 	SQUARED CJK UNIFIED IDEOGRAPH-7533
" U+1F239 	🈹 	\:u5272: 	SQUARED CJK UNIFIED IDEOGRAPH-5272
" U+1F23A 	🈺 	\:u55b6: 	SQUARED CJK UNIFIED IDEOGRAPH-55B6
" U+1F250 	🉐 	\:ideograph_advantage: 	CIRCLED IDEOGRAPH ADVANTAGE
" U+1F251 	🉑 	\:accept: 	CIRCLED IDEOGRAPH ACCEPT
" U+1F300 	🌀 	\:cyclone: 	CYCLONE
" U+1F301 	🌁 	\:foggy: 	FOGGY
" U+1F302 	🌂 	\:closed_umbrella: 	CLOSED UMBRELLA
" U+1F303 	🌃 	\:night_with_stars: 	NIGHT WITH STARS
" U+1F304 	🌄 	\:sunrise_over_mountains: 	SUNRISE OVER MOUNTAINS
" U+1F305 	🌅 	\:sunrise: 	SUNRISE
" U+1F306 	🌆 	\:city_sunset: 	CITYSCAPE AT DUSK
" U+1F307 	🌇 	\:city_sunrise: 	SUNSET OVER BUILDINGS
" U+1F308 	🌈 	\:rainbow: 	RAINBOW
" U+1F309 	🌉 	\:bridge_at_night: 	BRIDGE AT NIGHT
" U+1F30A 	🌊 	\:ocean: 	WATER WAVE
" U+1F30B 	🌋 	\:volcano: 	VOLCANO
" U+1F30C 	🌌 	\:milky_way: 	MILKY WAY
" U+1F30D 	🌍 	\:earth_africa: 	EARTH GLOBE EUROPE-AFRICA
" U+1F30E 	🌎 	\:earth_americas: 	EARTH GLOBE AMERICAS
" U+1F30F 	🌏 	\:earth_asia: 	EARTH GLOBE ASIA-AUSTRALIA
" U+1F310 	🌐 	\:globe_with_meridians: 	GLOBE WITH MERIDIANS
" U+1F311 	🌑 	\:new_moon: 	NEW MOON SYMBOL
" U+1F312 	🌒 	\:waxing_crescent_moon: 	WAXING CRESCENT MOON SYMBOL
" U+1F313 	🌓 	\:first_quarter_moon: 	FIRST QUARTER MOON SYMBOL
" U+1F314 	🌔 	\:moon: 	WAXING GIBBOUS MOON SYMBOL
" U+1F315 	🌕 	\:full_moon: 	FULL MOON SYMBOL
" U+1F316 	🌖 	\:waning_gibbous_moon: 	WANING GIBBOUS MOON SYMBOL
" U+1F317 	🌗 	\:last_quarter_moon: 	LAST QUARTER MOON SYMBOL
" U+1F318 	🌘 	\:waning_crescent_moon: 	WANING CRESCENT MOON SYMBOL
" U+1F319 	🌙 	\:crescent_moon: 	CRESCENT MOON
" U+1F31A 	🌚 	\:new_moon_with_face: 	NEW MOON WITH FACE
" U+1F31B 	🌛 	\:first_quarter_moon_with_face: 	FIRST QUARTER MOON WITH FACE
" U+1F31C 	🌜 	\:last_quarter_moon_with_face: 	LAST QUARTER MOON WITH FACE
" U+1F31D 	🌝 	\:full_moon_with_face: 	FULL MOON WITH FACE
" U+1F31E 	🌞 	\:sun_with_face: 	SUN WITH FACE
" U+1F31F 	🌟 	\:star2: 	GLOWING STAR
" U+1F320 	🌠 	\:stars: 	SHOOTING STAR
" U+1F330 	🌰 	\:chestnut: 	CHESTNUT
" U+1F331 	🌱 	\:seedling: 	SEEDLING
" U+1F332 	🌲 	\:evergreen_tree: 	EVERGREEN TREE
" U+1F333 	🌳 	\:deciduous_tree: 	DECIDUOUS TREE
" U+1F334 	🌴 	\:palm_tree: 	PALM TREE
" U+1F335 	🌵 	\:cactus: 	CACTUS
" U+1F337 	🌷 	\:tulip: 	TULIP
" U+1F338 	🌸 	\:cherry_blossom: 	CHERRY BLOSSOM
" U+1F339 	🌹 	\:rose: 	ROSE
" U+1F33A 	🌺 	\:hibiscus: 	HIBISCUS
" U+1F33B 	🌻 	\:sunflower: 	SUNFLOWER
" U+1F33C 	🌼 	\:blossom: 	BLOSSOM
" U+1F33D 	🌽 	\:corn: 	EAR OF MAIZE
" U+1F33E 	🌾 	\:ear_of_rice: 	EAR OF RICE
" U+1F33F 	🌿 	\:herb: 	HERB
" U+1F340 	🍀 	\:four_leaf_clover: 	FOUR LEAF CLOVER
" U+1F341 	🍁 	\:maple_leaf: 	MAPLE LEAF
" U+1F342 	🍂 	\:fallen_leaf: 	FALLEN LEAF
" U+1F343 	🍃 	\:leaves: 	LEAF FLUTTERING IN WIND
" U+1F344 	🍄 	\:mushroom: 	MUSHROOM
" U+1F345 	🍅 	\:tomato: 	TOMATO
" U+1F346 	🍆 	\:eggplant: 	AUBERGINE
" U+1F347 	🍇 	\:grapes: 	GRAPES
" U+1F348 	🍈 	\:melon: 	MELON
" U+1F349 	🍉 	\:watermelon: 	WATERMELON
" U+1F34A 	🍊 	\:tangerine: 	TANGERINE
" U+1F34B 	🍋 	\:lemon: 	LEMON
" U+1F34C 	🍌 	\:banana: 	BANANA
" U+1F34D 	🍍 	\:pineapple: 	PINEAPPLE
" U+1F34E 	🍎 	\:apple: 	RED APPLE
" U+1F34F 	🍏 	\:green_apple: 	GREEN APPLE
" U+1F350 	🍐 	\:pear: 	PEAR
" U+1F351 	🍑 	\:peach: 	PEACH
" U+1F352 	🍒 	\:cherries: 	CHERRIES
" U+1F353 	🍓 	\:strawberry: 	STRAWBERRY
" U+1F354 	🍔 	\:hamburger: 	HAMBURGER
" U+1F355 	🍕 	\:pizza: 	SLICE OF PIZZA
" U+1F356 	🍖 	\:meat_on_bone: 	MEAT ON BONE
" U+1F357 	🍗 	\:poultry_leg: 	POULTRY LEG
" U+1F358 	🍘 	\:rice_cracker: 	RICE CRACKER
" U+1F359 	🍙 	\:rice_ball: 	RICE BALL
" U+1F35A 	🍚 	\:rice: 	COOKED RICE
" U+1F35B 	🍛 	\:curry: 	CURRY AND RICE
" U+1F35C 	🍜 	\:ramen: 	STEAMING BOWL
" U+1F35D 	🍝 	\:spaghetti: 	SPAGHETTI
" U+1F35E 	🍞 	\:bread: 	BREAD
" U+1F35F 	🍟 	\:fries: 	FRENCH FRIES
" U+1F360 	🍠 	\:sweet_potato: 	ROASTED SWEET POTATO
" U+1F361 	🍡 	\:dango: 	DANGO
" U+1F362 	🍢 	\:oden: 	ODEN
" U+1F363 	🍣 	\:sushi: 	SUSHI
" U+1F364 	🍤 	\:fried_shrimp: 	FRIED SHRIMP
" U+1F365 	🍥 	\:fish_cake: 	FISH CAKE WITH SWIRL DESIGN
" U+1F366 	🍦 	\:icecream: 	SOFT ICE CREAM
" U+1F367 	🍧 	\:shaved_ice: 	SHAVED ICE
" U+1F368 	🍨 	\:ice_cream: 	ICE CREAM
" U+1F369 	🍩 	\:doughnut: 	DOUGHNUT
" U+1F36A 	🍪 	\:cookie: 	COOKIE
" U+1F36B 	🍫 	\:chocolate_bar: 	CHOCOLATE BAR
" U+1F36C 	🍬 	\:candy: 	CANDY
" U+1F36D 	🍭 	\:lollipop: 	LOLLIPOP
" U+1F36E 	🍮 	\:custard: 	CUSTARD
" U+1F36F 	🍯 	\:honey_pot: 	HONEY POT
" U+1F370 	🍰 	\:cake: 	SHORTCAKE
" U+1F371 	🍱 	\:bento: 	BENTO BOX
" U+1F372 	🍲 	\:stew: 	POT OF FOOD
" U+1F373 	🍳 	\:egg: 	COOKING
" U+1F374 	🍴 	\:fork_and_knife: 	FORK AND KNIFE
" U+1F375 	🍵 	\:tea: 	TEACUP WITHOUT HANDLE
" U+1F376 	🍶 	\:sake: 	SAKE BOTTLE AND CUP
" U+1F377 	🍷 	\:wine_glass: 	WINE GLASS
" U+1F378 	🍸 	\:cocktail: 	COCKTAIL GLASS
" U+1F379 	🍹 	\:tropical_drink: 	TROPICAL DRINK
" U+1F37A 	🍺 	\:beer: 	BEER MUG
" U+1F37B 	🍻 	\:beers: 	CLINKING BEER MUGS
" U+1F37C 	🍼 	\:baby_bottle: 	BABY BOTTLE
" U+1F380 	🎀 	\:ribbon: 	RIBBON
" U+1F381 	🎁 	\:gift: 	WRAPPED PRESENT
" U+1F382 	🎂 	\:birthday: 	BIRTHDAY CAKE
" U+1F383 	🎃 	\:jack_o_lantern: 	JACK-O-LANTERN
" U+1F384 	🎄 	\:christmas_tree: 	CHRISTMAS TREE
" U+1F385 	🎅 	\:santa: 	FATHER CHRISTMAS
" U+1F386 	🎆 	\:fireworks: 	FIREWORKS
" U+1F387 	🎇 	\:sparkler: 	FIREWORK SPARKLER
" U+1F388 	🎈 	\:balloon: 	BALLOON
" U+1F389 	🎉 	\:tada: 	PARTY POPPER
" U+1F38A 	🎊 	\:confetti_ball: 	CONFETTI BALL
" U+1F38B 	🎋 	\:tanabata_tree: 	TANABATA TREE
" U+1F38C 	🎌 	\:crossed_flags: 	CROSSED FLAGS
" U+1F38D 	🎍 	\:bamboo: 	PINE DECORATION
" U+1F38E 	🎎 	\:dolls: 	JAPANESE DOLLS
" U+1F38F 	🎏 	\:flags: 	CARP STREAMER
" U+1F390 	🎐 	\:wind_chime: 	WIND CHIME
" U+1F391 	🎑 	\:rice_scene: 	MOON VIEWING CEREMONY
" U+1F392 	🎒 	\:school_satchel: 	SCHOOL SATCHEL
" U+1F393 	🎓 	\:mortar_board: 	GRADUATION CAP
" U+1F3A0 	🎠 	\:carousel_horse: 	CAROUSEL HORSE
" U+1F3A1 	🎡 	\:ferris_wheel: 	FERRIS WHEEL
" U+1F3A2 	🎢 	\:roller_coaster: 	ROLLER COASTER
" U+1F3A3 	🎣 	\:fishing_pole_and_fish: 	FISHING POLE AND FISH
" U+1F3A4 	🎤 	\:microphone: 	MICROPHONE
" U+1F3A5 	🎥 	\:movie_camera: 	MOVIE CAMERA
" U+1F3A6 	🎦 	\:cinema: 	CINEMA
" U+1F3A7 	🎧 	\:headphones: 	HEADPHONE
" U+1F3A8 	🎨 	\:art: 	ARTIST PALETTE
" U+1F3A9 	🎩 	\:tophat: 	TOP HAT
" U+1F3AA 	🎪 	\:circus_tent: 	CIRCUS TENT
" U+1F3AB 	🎫 	\:ticket: 	TICKET
" U+1F3AC 	🎬 	\:clapper: 	CLAPPER BOARD
" U+1F3AD 	🎭 	\:performing_arts: 	PERFORMING ARTS
" U+1F3AE 	🎮 	\:video_game: 	VIDEO GAME
" U+1F3AF 	🎯 	\:dart: 	DIRECT HIT
" U+1F3B0 	🎰 	\:slot_machine: 	SLOT MACHINE
" U+1F3B1 	🎱 	\:8ball: 	BILLIARDS
" U+1F3B2 	🎲 	\:game_die: 	GAME DIE
" U+1F3B3 	🎳 	\:bowling: 	BOWLING
" U+1F3B4 	🎴 	\:flower_playing_cards: 	FLOWER PLAYING CARDS
" U+1F3B5 	🎵 	\:musical_note: 	MUSICAL NOTE
" U+1F3B6 	🎶 	\:notes: 	MULTIPLE MUSICAL NOTES
" U+1F3B7 	🎷 	\:saxophone: 	SAXOPHONE
" U+1F3B8 	🎸 	\:guitar: 	GUITAR
" U+1F3B9 	🎹 	\:musical_keyboard: 	MUSICAL KEYBOARD
" U+1F3BA 	🎺 	\:trumpet: 	TRUMPET
" U+1F3BB 	🎻 	\:violin: 	VIOLIN
" U+1F3BC 	🎼 	\:musical_score: 	MUSICAL SCORE
" U+1F3BD 	🎽 	\:running_shirt_with_sash: 	RUNNING SHIRT WITH SASH
" U+1F3BE 	🎾 	\:tennis: 	TENNIS RACQUET AND BALL
" U+1F3BF 	🎿 	\:ski: 	SKI AND SKI BOOT
" U+1F3C0 	🏀 	\:basketball: 	BASKETBALL AND HOOP
" U+1F3C1 	🏁 	\:checkered_flag: 	CHEQUERED FLAG
" U+1F3C2 	🏂 	\:snowboarder: 	SNOWBOARDER
" U+1F3C3 	🏃 	\:runner: 	RUNNER
" U+1F3C4 	🏄 	\:surfer: 	SURFER
" U+1F3C6 	🏆 	\:trophy: 	TROPHY
" U+1F3C7 	🏇 	\:horse_racing: 	HORSE RACING
" U+1F3C8 	🏈 	\:football: 	AMERICAN FOOTBALL
" U+1F3C9 	🏉 	\:rugby_football: 	RUGBY FOOTBALL
" U+1F3CA 	🏊 	\:swimmer: 	SWIMMER
" U+1F3E0 	🏠 	\:house: 	HOUSE BUILDING
" U+1F3E1 	🏡 	\:house_with_garden: 	HOUSE WITH GARDEN
" U+1F3E2 	🏢 	\:office: 	OFFICE BUILDING
" U+1F3E3 	🏣 	\:post_office: 	JAPANESE POST OFFICE
" U+1F3E4 	🏤 	\:european_post_office: 	EUROPEAN POST OFFICE
" U+1F3E5 	🏥 	\:hospital: 	HOSPITAL
" U+1F3E6 	🏦 	\:bank: 	BANK
" U+1F3E7 	🏧 	\:atm: 	AUTOMATED TELLER MACHINE
" U+1F3E8 	🏨 	\:hotel: 	HOTEL
" U+1F3E9 	🏩 	\:love_hotel: 	LOVE HOTEL
" U+1F3EA 	🏪 	\:convenience_store: 	CONVENIENCE STORE
" U+1F3EB 	🏫 	\:school: 	SCHOOL
" U+1F3EC 	🏬 	\:department_store: 	DEPARTMENT STORE
" U+1F3ED 	🏭 	\:factory: 	FACTORY
" U+1F3EE 	🏮 	\:izakaya_lantern: 	IZAKAYA LANTERN
" U+1F3EF 	🏯 	\:japanese_castle: 	JAPANESE CASTLE
" U+1F3F0 	🏰 	\:european_castle: 	EUROPEAN CASTLE
" U+1F3FB 	🏻 	\:skin-tone-2: 	EMOJI MODIFIER FITZPATRICK TYPE-1-2
" U+1F3FC 	🏼 	\:skin-tone-3: 	EMOJI MODIFIER FITZPATRICK TYPE-3
" U+1F3FD 	🏽 	\:skin-tone-4: 	EMOJI MODIFIER FITZPATRICK TYPE-4
" U+1F3FE 	🏾 	\:skin-tone-5: 	EMOJI MODIFIER FITZPATRICK TYPE-5
" U+1F3FF 	🏿 	\:skin-tone-6: 	EMOJI MODIFIER FITZPATRICK TYPE-6
" U+1F400 	🐀 	\:rat: 	RAT
" U+1F401 	🐁 	\:mouse2: 	MOUSE
" U+1F402 	🐂 	\:ox: 	OX
" U+1F403 	🐃 	\:water_buffalo: 	WATER BUFFALO
" U+1F404 	🐄 	\:cow2: 	COW
" U+1F405 	🐅 	\:tiger2: 	TIGER
" U+1F406 	🐆 	\:leopard: 	LEOPARD
" U+1F407 	🐇 	\:rabbit2: 	RABBIT
" U+1F408 	🐈 	\:cat2: 	CAT
" U+1F409 	🐉 	\:dragon: 	DRAGON
" U+1F40A 	🐊 	\:crocodile: 	CROCODILE
" U+1F40B 	🐋 	\:whale2: 	WHALE
" U+1F40C 	🐌 	\:snail: 	SNAIL
" U+1F40D 	🐍 	\:snake: 	SNAKE
" U+1F40E 	🐎 	\:racehorse: 	HORSE
" U+1F40F 	🐏 	\:ram: 	RAM
" U+1F410 	🐐 	\:goat: 	GOAT
" U+1F411 	🐑 	\:sheep: 	SHEEP
" U+1F412 	🐒 	\:monkey: 	MONKEY
" U+1F413 	🐓 	\:rooster: 	ROOSTER
" U+1F414 	🐔 	\:chicken: 	CHICKEN
" U+1F415 	🐕 	\:dog2: 	DOG
" U+1F416 	🐖 	\:pig2: 	PIG
" U+1F417 	🐗 	\:boar: 	BOAR
" U+1F418 	🐘 	\:elephant: 	ELEPHANT
" U+1F419 	🐙 	\:octopus: 	OCTOPUS
" U+1F41A 	🐚 	\:shell: 	SPIRAL SHELL
" U+1F41B 	🐛 	\:bug: 	BUG
" U+1F41C 	🐜 	\:ant: 	ANT
" U+1F41D 	🐝 	\:bee: 	HONEYBEE
" U+1F41E 	🐞 	\:beetle: 	LADY BEETLE
" U+1F41F 	🐟 	\:fish: 	FISH
" U+1F420 	🐠 	\:tropical_fish: 	TROPICAL FISH
" U+1F421 	🐡 	\:blowfish: 	BLOWFISH
" U+1F422 	🐢 	\:turtle: 	TURTLE
" U+1F423 	🐣 	\:hatching_chick: 	HATCHING CHICK
" U+1F424 	🐤 	\:baby_chick: 	BABY CHICK
" U+1F425 	🐥 	\:hatched_chick: 	FRONT-FACING BABY CHICK
" U+1F426 	🐦 	\:bird: 	BIRD
" U+1F427 	🐧 	\:penguin: 	PENGUIN
" U+1F428 	🐨 	\:koala: 	KOALA
" U+1F429 	🐩 	\:poodle: 	POODLE
" U+1F42A 	🐪 	\:dromedary_camel: 	DROMEDARY CAMEL
" U+1F42B 	🐫 	\:camel: 	BACTRIAN CAMEL
" U+1F42C 	🐬 	\:dolphin: 	DOLPHIN
" U+1F42D 	🐭 	\:mouse: 	MOUSE FACE
" U+1F42E 	🐮 	\:cow: 	COW FACE
" U+1F42F 	🐯 	\:tiger: 	TIGER FACE
" U+1F430 	🐰 	\:rabbit: 	RABBIT FACE
" U+1F431 	🐱 	\:cat: 	CAT FACE
" U+1F432 	🐲 	\:dragon_face: 	DRAGON FACE
" U+1F433 	🐳 	\:whale: 	SPOUTING WHALE
" U+1F434 	🐴 	\:horse: 	HORSE FACE
" U+1F435 	🐵 	\:monkey_face: 	MONKEY FACE
" U+1F436 	🐶 	\:dog: 	DOG FACE
" U+1F437 	🐷 	\:pig: 	PIG FACE
" U+1F438 	🐸 	\:frog: 	FROG FACE
" U+1F439 	🐹 	\:hamster: 	HAMSTER FACE
" U+1F43A 	🐺 	\:wolf: 	WOLF FACE
" U+1F43B 	🐻 	\:bear: 	BEAR FACE
" U+1F43C 	🐼 	\:panda_face: 	PANDA FACE
" U+1F43D 	🐽 	\:pig_nose: 	PIG NOSE
" U+1F43E 	🐾 	\:feet: 	PAW PRINTS
" U+1F440 	👀 	\:eyes: 	EYES
" U+1F442 	👂 	\:ear: 	EAR
" U+1F443 	👃 	\:nose: 	NOSE
" U+1F444 	👄 	\:lips: 	MOUTH
" U+1F445 	👅 	\:tongue: 	TONGUE
" U+1F446 	👆 	\:point_up_2: 	WHITE UP POINTING BACKHAND INDEX
" U+1F447 	👇 	\:point_down: 	WHITE DOWN POINTING BACKHAND INDEX
" U+1F448 	👈 	\:point_left: 	WHITE LEFT POINTING BACKHAND INDEX
" U+1F449 	👉 	\:point_right: 	WHITE RIGHT POINTING BACKHAND INDEX
" U+1F44A 	👊 	\:facepunch: 	FISTED HAND SIGN
" U+1F44B 	👋 	\:wave: 	WAVING HAND SIGN
" U+1F44C 	👌 	\:ok_hand: 	OK HAND SIGN
" U+1F44D 	👍 	\:+1: 	THUMBS UP SIGN
" U+1F44E 	👎 	\:-1: 	THUMBS DOWN SIGN
" U+1F44F 	👏 	\:clap: 	CLAPPING HANDS SIGN
" U+1F450 	👐 	\:open_hands: 	OPEN HANDS SIGN
" U+1F451 	👑 	\:crown: 	CROWN
" U+1F452 	👒 	\:womans_hat: 	WOMANS HAT
" U+1F453 	👓 	\:eyeglasses: 	EYEGLASSES
" U+1F454 	👔 	\:necktie: 	NECKTIE
" U+1F455 	👕 	\:shirt: 	T-SHIRT
" U+1F456 	👖 	\:jeans: 	JEANS
" U+1F457 	👗 	\:dress: 	DRESS
" U+1F458 	👘 	\:kimono: 	KIMONO
" U+1F459 	👙 	\:bikini: 	BIKINI
" U+1F45A 	👚 	\:womans_clothes: 	WOMANS CLOTHES
" U+1F45B 	👛 	\:purse: 	PURSE
" U+1F45C 	👜 	\:handbag: 	HANDBAG
" U+1F45D 	👝 	\:pouch: 	POUCH
" U+1F45E 	👞 	\:mans_shoe: 	MANS SHOE
" U+1F45F 	👟 	\:athletic_shoe: 	ATHLETIC SHOE
" U+1F460 	👠 	\:high_heel: 	HIGH-HEELED SHOE
" U+1F461 	👡 	\:sandal: 	WOMANS SANDAL
" U+1F462 	👢 	\:boot: 	WOMANS BOOTS
" U+1F463 	👣 	\:footprints: 	FOOTPRINTS
" U+1F464 	👤 	\:bust_in_silhouette: 	BUST IN SILHOUETTE
" U+1F465 	👥 	\:busts_in_silhouette: 	BUSTS IN SILHOUETTE
" U+1F466 	👦 	\:boy: 	BOY
" U+1F467 	👧 	\:girl: 	GIRL
" U+1F468 	👨 	\:man: 	MAN
" U+1F469 	👩 	\:woman: 	WOMAN
" U+1F46A 	👪 	\:family: 	FAMILY
" U+1F46B 	👫 	\:couple: 	MAN AND WOMAN HOLDING HANDS
" U+1F46C 	👬 	\:two_men_holding_hands: 	TWO MEN HOLDING HANDS
" U+1F46D 	👭 	\:two_women_holding_hands: 	TWO WOMEN HOLDING HANDS
" U+1F46E 	👮 	\:cop: 	POLICE OFFICER
" U+1F46F 	👯 	\:dancers: 	WOMAN WITH BUNNY EARS
" U+1F470 	👰 	\:bride_with_veil: 	BRIDE WITH VEIL
" U+1F471 	👱 	\:person_with_blond_hair: 	PERSON WITH BLOND HAIR
" U+1F472 	👲 	\:man_with_gua_pi_mao: 	MAN WITH GUA PI MAO
" U+1F473 	👳 	\:man_with_turban: 	MAN WITH TURBAN
" U+1F474 	👴 	\:older_man: 	OLDER MAN
" U+1F475 	👵 	\:older_woman: 	OLDER WOMAN
" U+1F476 	👶 	\:baby: 	BABY
" U+1F477 	👷 	\:construction_worker: 	CONSTRUCTION WORKER
" U+1F478 	👸 	\:princess: 	PRINCESS
" U+1F479 	👹 	\:japanese_ogre: 	JAPANESE OGRE
" U+1F47A 	👺 	\:japanese_goblin: 	JAPANESE GOBLIN
" U+1F47B 	👻 	\:ghost: 	GHOST
" U+1F47C 	👼 	\:angel: 	BABY ANGEL
" U+1F47D 	👽 	\:alien: 	EXTRATERRESTRIAL ALIEN
" U+1F47E 	👾 	\:space_invader: 	ALIEN MONSTER
" U+1F47F 	👿 	\:imp: 	IMP
" U+1F480 	💀 	\:skull: 	SKULL
" U+1F481 	💁 	\:information_desk_person: 	INFORMATION DESK PERSON
" U+1F482 	💂 	\:guardsman: 	GUARDSMAN
" U+1F483 	💃 	\:dancer: 	DANCER
" U+1F484 	💄 	\:lipstick: 	LIPSTICK
" U+1F485 	💅 	\:nail_care: 	NAIL POLISH
" U+1F486 	💆 	\:massage: 	FACE MASSAGE
" U+1F487 	💇 	\:haircut: 	HAIRCUT
" U+1F488 	💈 	\:barber: 	BARBER POLE
" U+1F489 	💉 	\:syringe: 	SYRINGE
" U+1F48A 	💊 	\:pill: 	PILL
" U+1F48B 	💋 	\:kiss: 	KISS MARK
" U+1F48C 	💌 	\:love_letter: 	LOVE LETTER
" U+1F48D 	💍 	\:ring: 	RING
" U+1F48E 	💎 	\:gem: 	GEM STONE
" U+1F48F 	💏 	\:couplekiss: 	KISS
" U+1F490 	💐 	\:bouquet: 	BOUQUET
" U+1F491 	💑 	\:couple_with_heart: 	COUPLE WITH HEART
" U+1F492 	💒 	\:wedding: 	WEDDING
" U+1F493 	💓 	\:heartbeat: 	BEATING HEART
" U+1F494 	💔 	\:broken_heart: 	BROKEN HEART
" U+1F495 	💕 	\:two_hearts: 	TWO HEARTS
" U+1F496 	💖 	\:sparkling_heart: 	SPARKLING HEART
" U+1F497 	💗 	\:heartpulse: 	GROWING HEART
" U+1F498 	💘 	\:cupid: 	HEART WITH ARROW
" U+1F499 	💙 	\:blue_heart: 	BLUE HEART
" U+1F49A 	💚 	\:green_heart: 	GREEN HEART
" U+1F49B 	💛 	\:yellow_heart: 	YELLOW HEART
" U+1F49C 	💜 	\:purple_heart: 	PURPLE HEART
" U+1F49D 	💝 	\:gift_heart: 	HEART WITH RIBBON
" U+1F49E 	💞 	\:revolving_hearts: 	REVOLVING HEARTS
" U+1F49F 	💟 	\:heart_decoration: 	HEART DECORATION
" U+1F4A0 	💠 	\:diamond_shape_with_a_dot_inside: 	DIAMOND SHAPE WITH A DOT INSIDE
" U+1F4A1 	💡 	\:bulb: 	ELECTRIC LIGHT BULB
" U+1F4A2 	💢 	\:anger: 	ANGER SYMBOL
" U+1F4A3 	💣 	\:bomb: 	BOMB
" U+1F4A4 	💤 	\:zzz: 	SLEEPING SYMBOL
" U+1F4A5 	💥 	\:boom: 	COLLISION SYMBOL
" U+1F4A6 	💦 	\:sweat_drops: 	SPLASHING SWEAT SYMBOL
" U+1F4A7 	💧 	\:droplet: 	DROPLET
" U+1F4A8 	💨 	\:dash: 	DASH SYMBOL
" U+1F4A9 	💩 	\:hankey: 	PILE OF POO
" U+1F4AA 	💪 	\:muscle: 	FLEXED BICEPS
" U+1F4AB 	💫 	\:dizzy: 	DIZZY SYMBOL
" U+1F4AC 	💬 	\:speech_balloon: 	SPEECH BALLOON
" U+1F4AD 	💭 	\:thought_balloon: 	THOUGHT BALLOON
" U+1F4AE 	💮 	\:white_flower: 	WHITE FLOWER
" U+1F4AF 	💯 	\:100: 	HUNDRED POINTS SYMBOL
" U+1F4B0 	💰 	\:moneybag: 	MONEY BAG
" U+1F4B1 	💱 	\:currency_exchange: 	CURRENCY EXCHANGE
" U+1F4B2 	💲 	\:heavy_dollar_sign: 	HEAVY DOLLAR SIGN
" U+1F4B3 	💳 	\:credit_card: 	CREDIT CARD
" U+1F4B4 	💴 	\:yen: 	BANKNOTE WITH YEN SIGN
" U+1F4B5 	💵 	\:dollar: 	BANKNOTE WITH DOLLAR SIGN
" U+1F4B6 	💶 	\:euro: 	BANKNOTE WITH EURO SIGN
" U+1F4B7 	💷 	\:pound: 	BANKNOTE WITH POUND SIGN
" U+1F4B8 	💸 	\:money_with_wings: 	MONEY WITH WINGS
" U+1F4B9 	💹 	\:chart: 	CHART WITH UPWARDS TREND AND YEN SIGN
" U+1F4BA 	💺 	\:seat: 	SEAT
" U+1F4BB 	💻 	\:computer: 	PERSONAL COMPUTER
" U+1F4BC 	💼 	\:briefcase: 	BRIEFCASE
" U+1F4BD 	💽 	\:minidisc: 	MINIDISC
" U+1F4BE 	💾 	\:floppy_disk: 	FLOPPY DISK
" U+1F4BF 	💿 	\:cd: 	OPTICAL DISC
" U+1F4C0 	📀 	\:dvd: 	DVD
" U+1F4C1 	📁 	\:file_folder: 	FILE FOLDER
" U+1F4C2 	📂 	\:open_file_folder: 	OPEN FILE FOLDER
" U+1F4C3 	📃 	\:page_with_curl: 	PAGE WITH CURL
" U+1F4C4 	📄 	\:page_facing_up: 	PAGE FACING UP
" U+1F4C5 	📅 	\:date: 	CALENDAR
" U+1F4C6 	📆 	\:calendar: 	TEAR-OFF CALENDAR
" U+1F4C7 	📇 	\:card_index: 	CARD INDEX
" U+1F4C8 	📈 	\:chart_with_upwards_trend: 	CHART WITH UPWARDS TREND
" U+1F4C9 	📉 	\:chart_with_downwards_trend: 	CHART WITH DOWNWARDS TREND
" U+1F4CA 	📊 	\:bar_chart: 	BAR CHART
" U+1F4CB 	📋 	\:clipboard: 	CLIPBOARD
" U+1F4CC 	📌 	\:pushpin: 	PUSHPIN
" U+1F4CD 	📍 	\:round_pushpin: 	ROUND PUSHPIN
" U+1F4CE 	📎 	\:paperclip: 	PAPERCLIP
" U+1F4CF 	📏 	\:straight_ruler: 	STRAIGHT RULER
" U+1F4D0 	📐 	\:triangular_ruler: 	TRIANGULAR RULER
" U+1F4D1 	📑 	\:bookmark_tabs: 	BOOKMARK TABS
" U+1F4D2 	📒 	\:ledger: 	LEDGER
" U+1F4D3 	📓 	\:notebook: 	NOTEBOOK
" U+1F4D4 	📔 	\:notebook_with_decorative_cover: 	NOTEBOOK WITH DECORATIVE COVER
" U+1F4D5 	📕 	\:closed_book: 	CLOSED BOOK
" U+1F4D6 	📖 	\:book: 	OPEN BOOK
" U+1F4D7 	📗 	\:green_book: 	GREEN BOOK
" U+1F4D8 	📘 	\:blue_book: 	BLUE BOOK
" U+1F4D9 	📙 	\:orange_book: 	ORANGE BOOK
" U+1F4DA 	📚 	\:books: 	BOOKS
" U+1F4DB 	📛 	\:name_badge: 	NAME BADGE
" U+1F4DC 	📜 	\:scroll: 	SCROLL
" U+1F4DD 	📝 	\:memo: 	MEMO
" U+1F4DE 	📞 	\:telephone_receiver: 	TELEPHONE RECEIVER
" U+1F4DF 	📟 	\:pager: 	PAGER
" U+1F4E0 	📠 	\:fax: 	FAX MACHINE
" U+1F4E1 	📡 	\:satellite: 	SATELLITE ANTENNA
" U+1F4E2 	📢 	\:loudspeaker: 	PUBLIC ADDRESS LOUDSPEAKER
" U+1F4E3 	📣 	\:mega: 	CHEERING MEGAPHONE
" U+1F4E4 	📤 	\:outbox_tray: 	OUTBOX TRAY
" U+1F4E5 	📥 	\:inbox_tray: 	INBOX TRAY
" U+1F4E6 	📦 	\:package: 	PACKAGE
" U+1F4E7 	📧 	\:e-mail: 	E-MAIL SYMBOL
" U+1F4E8 	📨 	\:incoming_envelope: 	INCOMING ENVELOPE
" U+1F4E9 	📩 	\:envelope_with_arrow: 	ENVELOPE WITH DOWNWARDS ARROW ABOVE
" U+1F4EA 	📪 	\:mailbox_closed: 	CLOSED MAILBOX WITH LOWERED FLAG
" U+1F4EB 	📫 	\:mailbox: 	CLOSED MAILBOX WITH RAISED FLAG
" U+1F4EC 	📬 	\:mailbox_with_mail: 	OPEN MAILBOX WITH RAISED FLAG
" U+1F4ED 	📭 	\:mailbox_with_no_mail: 	OPEN MAILBOX WITH LOWERED FLAG
" U+1F4EE 	📮 	\:postbox: 	POSTBOX
" U+1F4EF 	📯 	\:postal_horn: 	POSTAL HORN
" U+1F4F0 	📰 	\:newspaper: 	NEWSPAPER
" U+1F4F1 	📱 	\:iphone: 	MOBILE PHONE
" U+1F4F2 	📲 	\:calling: 	MOBILE PHONE WITH RIGHTWARDS ARROW AT LEFT
" U+1F4F3 	📳 	\:vibration_mode: 	VIBRATION MODE
" U+1F4F4 	📴 	\:mobile_phone_off: 	MOBILE PHONE OFF
" U+1F4F5 	📵 	\:no_mobile_phones: 	NO MOBILE PHONES
" U+1F4F6 	📶 	\:signal_strength: 	ANTENNA WITH BARS
" U+1F4F7 	📷 	\:camera: 	CAMERA
" U+1F4F9 	📹 	\:video_camera: 	VIDEO CAMERA
" U+1F4FA 	📺 	\:tv: 	TELEVISION
" U+1F4FB 	📻 	\:radio: 	RADIO
" U+1F4FC 	📼 	\:vhs: 	VIDEOCASSETTE
" U+1F500 	🔀 	\:twisted_rightwards_arrows: 	TWISTED RIGHTWARDS ARROWS
" U+1F501 	🔁 	\:repeat: 	CLOCKWISE RIGHTWARDS AND LEFTWARDS OPEN CIRCLE ARROWS
" U+1F502 	🔂 	\:repeat_one: 	CLOCKWISE RIGHTWARDS AND LEFTWARDS OPEN CIRCLE ARROWS WITH CIRCLED ONE OVERLAY
" U+1F503 	🔃 	\:arrows_clockwise: 	CLOCKWISE DOWNWARDS AND UPWARDS OPEN CIRCLE ARROWS
" U+1F504 	🔄 	\:arrows_counterclockwise: 	ANTICLOCKWISE DOWNWARDS AND UPWARDS OPEN CIRCLE ARROWS
" U+1F505 	🔅 	\:low_brightness: 	LOW BRIGHTNESS SYMBOL
" U+1F506 	🔆 	\:high_brightness: 	HIGH BRIGHTNESS SYMBOL
" U+1F507 	🔇 	\:mute: 	SPEAKER WITH CANCELLATION STROKE
" U+1F508 	🔈 	\:speaker: 	SPEAKER
" U+1F509 	🔉 	\:sound: 	SPEAKER WITH ONE SOUND WAVE
" U+1F50A 	🔊 	\:loud_sound: 	SPEAKER WITH THREE SOUND WAVES
" U+1F50B 	🔋 	\:battery: 	BATTERY
" U+1F50C 	🔌 	\:electric_plug: 	ELECTRIC PLUG
" U+1F50D 	🔍 	\:mag: 	LEFT-POINTING MAGNIFYING GLASS
" U+1F50E 	🔎 	\:mag_right: 	RIGHT-POINTING MAGNIFYING GLASS
" U+1F50F 	🔏 	\:lock_with_ink_pen: 	LOCK WITH INK PEN
" U+1F510 	🔐 	\:closed_lock_with_key: 	CLOSED LOCK WITH KEY
" U+1F511 	🔑 	\:key: 	KEY
" U+1F512 	🔒 	\:lock: 	LOCK
" U+1F513 	🔓 	\:unlock: 	OPEN LOCK
" U+1F514 	🔔 	\:bell: 	BELL
" U+1F515 	🔕 	\:no_bell: 	BELL WITH CANCELLATION STROKE
" U+1F516 	🔖 	\:bookmark: 	BOOKMARK
" U+1F517 	🔗 	\:link: 	LINK SYMBOL
" U+1F518 	🔘 	\:radio_button: 	RADIO BUTTON
" U+1F519 	🔙 	\:back: 	BACK WITH LEFTWARDS ARROW ABOVE
" U+1F51A 	🔚 	\:end: 	END WITH LEFTWARDS ARROW ABOVE
" U+1F51B 	🔛 	\:on: 	ON WITH EXCLAMATION MARK WITH LEFT RIGHT ARROW ABOVE
" U+1F51C 	🔜 	\:soon: 	SOON WITH RIGHTWARDS ARROW ABOVE
" U+1F51D 	🔝 	\:top: 	TOP WITH UPWARDS ARROW ABOVE
" U+1F51E 	🔞 	\:underage: 	NO ONE UNDER EIGHTEEN SYMBOL
" U+1F51F 	🔟 	\:keycap_ten: 	KEYCAP TEN
" U+1F520 	🔠 	\:capital_abcd: 	INPUT SYMBOL FOR LATIN CAPITAL LETTERS
" U+1F521 	🔡 	\:abcd: 	INPUT SYMBOL FOR LATIN SMALL LETTERS
" U+1F522 	🔢 	\:1234: 	INPUT SYMBOL FOR NUMBERS
" U+1F523 	🔣 	\:symbols: 	INPUT SYMBOL FOR SYMBOLS
" U+1F524 	🔤 	\:abc: 	INPUT SYMBOL FOR LATIN LETTERS
" U+1F525 	🔥 	\:fire: 	FIRE
" U+1F526 	🔦 	\:flashlight: 	ELECTRIC TORCH
" U+1F527 	🔧 	\:wrench: 	WRENCH
" U+1F528 	🔨 	\:hammer: 	HAMMER
" U+1F529 	🔩 	\:nut_and_bolt: 	NUT AND BOLT
" U+1F52A 	🔪 	\:hocho: 	HOCHO
" U+1F52B 	🔫 	\:gun: 	PISTOL
" U+1F52C 	🔬 	\:microscope: 	MICROSCOPE
" U+1F52D 	🔭 	\:telescope: 	TELESCOPE
" U+1F52E 	🔮 	\:crystal_ball: 	CRYSTAL BALL
" U+1F52F 	🔯 	\:six_pointed_star: 	SIX POINTED STAR WITH MIDDLE DOT
" U+1F530 	🔰 	\:beginner: 	JAPANESE SYMBOL FOR BEGINNER
" U+1F531 	🔱 	\:trident: 	TRIDENT EMBLEM
" U+1F532 	🔲 	\:black_square_button: 	BLACK SQUARE BUTTON
" U+1F533 	🔳 	\:white_square_button: 	WHITE SQUARE BUTTON
" U+1F534 	🔴 	\:red_circle: 	LARGE RED CIRCLE
" U+1F535 	🔵 	\:large_blue_circle: 	LARGE BLUE CIRCLE
" U+1F536 	🔶 	\:large_orange_diamond: 	LARGE ORANGE DIAMOND
" U+1F537 	🔷 	\:large_blue_diamond: 	LARGE BLUE DIAMOND
" U+1F538 	🔸 	\:small_orange_diamond: 	SMALL ORANGE DIAMOND
" U+1F539 	🔹 	\:small_blue_diamond: 	SMALL BLUE DIAMOND
" U+1F53A 	🔺 	\:small_red_triangle: 	UP-POINTING RED TRIANGLE
" U+1F53B 	🔻 	\:small_red_triangle_down: 	DOWN-POINTING RED TRIANGLE
" U+1F53C 	🔼 	\:arrow_up_small: 	UP-POINTING SMALL RED TRIANGLE
" U+1F53D 	🔽 	\:arrow_down_small: 	DOWN-POINTING SMALL RED TRIANGLE
" U+1F550 	🕐 	\:clock1: 	CLOCK FACE ONE OCLOCK
" U+1F551 	🕑 	\:clock2: 	CLOCK FACE TWO OCLOCK
" U+1F552 	🕒 	\:clock3: 	CLOCK FACE THREE OCLOCK
" U+1F553 	🕓 	\:clock4: 	CLOCK FACE FOUR OCLOCK
" U+1F554 	🕔 	\:clock5: 	CLOCK FACE FIVE OCLOCK
" U+1F555 	🕕 	\:clock6: 	CLOCK FACE SIX OCLOCK
" U+1F556 	🕖 	\:clock7: 	CLOCK FACE SEVEN OCLOCK
" U+1F557 	🕗 	\:clock8: 	CLOCK FACE EIGHT OCLOCK
" U+1F558 	🕘 	\:clock9: 	CLOCK FACE NINE OCLOCK
" U+1F559 	🕙 	\:clock10: 	CLOCK FACE TEN OCLOCK
" U+1F55A 	🕚 	\:clock11: 	CLOCK FACE ELEVEN OCLOCK
" U+1F55B 	🕛 	\:clock12: 	CLOCK FACE TWELVE OCLOCK
" U+1F55C 	🕜 	\:clock130: 	CLOCK FACE ONE-THIRTY
" U+1F55D 	🕝 	\:clock230: 	CLOCK FACE TWO-THIRTY
" U+1F55E 	🕞 	\:clock330: 	CLOCK FACE THREE-THIRTY
" U+1F55F 	🕟 	\:clock430: 	CLOCK FACE FOUR-THIRTY
" U+1F560 	🕠 	\:clock530: 	CLOCK FACE FIVE-THIRTY
" U+1F561 	🕡 	\:clock630: 	CLOCK FACE SIX-THIRTY
" U+1F562 	🕢 	\:clock730: 	CLOCK FACE SEVEN-THIRTY
" U+1F563 	🕣 	\:clock830: 	CLOCK FACE EIGHT-THIRTY
" U+1F564 	🕤 	\:clock930: 	CLOCK FACE NINE-THIRTY
" U+1F565 	🕥 	\:clock1030: 	CLOCK FACE TEN-THIRTY
" U+1F566 	🕦 	\:clock1130: 	CLOCK FACE ELEVEN-THIRTY
" U+1F567 	🕧 	\:clock1230: 	CLOCK FACE TWELVE-THIRTY
" U+1F5FB 	🗻 	\:mount_fuji: 	MOUNT FUJI
" U+1F5FC 	🗼 	\:tokyo_tower: 	TOKYO TOWER
" U+1F5FD 	🗽 	\:statue_of_liberty: 	STATUE OF LIBERTY
" U+1F5FE 	🗾 	\:japan: 	SILHOUETTE OF JAPAN
" U+1F5FF 	🗿 	\:moyai: 	MOYAI
" U+1F600 	😀 	\:grinning: 	GRINNING FACE
" U+1F601 	😁 	\:grin: 	GRINNING FACE WITH SMILING EYES
" U+1F602 	😂 	\:joy: 	FACE WITH TEARS OF JOY
" U+1F603 	😃 	\:smiley: 	SMILING FACE WITH OPEN MOUTH
" U+1F604 	😄 	\:smile: 	SMILING FACE WITH OPEN MOUTH AND SMILING EYES
" U+1F605 	😅 	\:sweat_smile: 	SMILING FACE WITH OPEN MOUTH AND COLD SWEAT
" U+1F606 	😆 	\:laughing: 	SMILING FACE WITH OPEN MOUTH AND TIGHTLY-CLOSED EYES
" U+1F607 	😇 	\:innocent: 	SMILING FACE WITH HALO
" U+1F608 	😈 	\:smiling_imp: 	SMILING FACE WITH HORNS
" U+1F609 	😉 	\:wink: 	WINKING FACE
" U+1F60A 	😊 	\:blush: 	SMILING FACE WITH SMILING EYES
" U+1F60B 	😋 	\:yum: 	FACE SAVOURING DELICIOUS FOOD
" U+1F60C 	😌 	\:relieved: 	RELIEVED FACE
" U+1F60D 	😍 	\:heart_eyes: 	SMILING FACE WITH HEART-SHAPED EYES
" U+1F60E 	😎 	\:sunglasses: 	SMILING FACE WITH SUNGLASSES
" U+1F60F 	😏 	\:smirk: 	SMIRKING FACE
" U+1F610 	😐 	\:neutral_face: 	NEUTRAL FACE
" U+1F611 	😑 	\:expressionless: 	EXPRESSIONLESS FACE
" U+1F612 	😒 	\:unamused: 	UNAMUSED FACE
" U+1F613 	😓 	\:sweat: 	FACE WITH COLD SWEAT
" U+1F614 	😔 	\:pensive: 	PENSIVE FACE
" U+1F615 	😕 	\:confused: 	CONFUSED FACE
" U+1F616 	😖 	\:confounded: 	CONFOUNDED FACE
" U+1F617 	😗 	\:kissing: 	KISSING FACE
" U+1F618 	😘 	\:kissing_heart: 	FACE THROWING A KISS
" U+1F619 	😙 	\:kissing_smiling_eyes: 	KISSING FACE WITH SMILING EYES
" U+1F61A 	😚 	\:kissing_closed_eyes: 	KISSING FACE WITH CLOSED EYES
" U+1F61B 	😛 	\:stuck_out_tongue: 	FACE WITH STUCK-OUT TONGUE
" U+1F61C 	😜 	\:stuck_out_tongue_winking_eye: 	FACE WITH STUCK-OUT TONGUE AND WINKING EYE
" U+1F61D 	😝 	\:stuck_out_tongue_closed_eyes: 	FACE WITH STUCK-OUT TONGUE AND TIGHTLY-CLOSED EYES
" U+1F61E 	😞 	\:disappointed: 	DISAPPOINTED FACE
" U+1F61F 	😟 	\:worried: 	WORRIED FACE
" U+1F620 	😠 	\:angry: 	ANGRY FACE
" U+1F621 	😡 	\:rage: 	POUTING FACE
" U+1F622 	😢 	\:cry: 	CRYING FACE
" U+1F623 	😣 	\:persevere: 	PERSEVERING FACE
" U+1F624 	😤 	\:triumph: 	FACE WITH LOOK OF TRIUMPH
" U+1F625 	😥 	\:disappointed_relieved: 	DISAPPOINTED BUT RELIEVED FACE
" U+1F626 	😦 	\:frowning: 	FROWNING FACE WITH OPEN MOUTH
" U+1F627 	😧 	\:anguished: 	ANGUISHED FACE
" U+1F628 	😨 	\:fearful: 	FEARFUL FACE
" U+1F629 	😩 	\:weary: 	WEARY FACE
" U+1F62A 	😪 	\:sleepy: 	SLEEPY FACE
" U+1F62B 	😫 	\:tired_face: 	TIRED FACE
" U+1F62C 	😬 	\:grimacing: 	GRIMACING FACE
" U+1F62D 	😭 	\:sob: 	LOUDLY CRYING FACE
" U+1F62E 	😮 	\:open_mouth: 	FACE WITH OPEN MOUTH
" U+1F62F 	😯 	\:hushed: 	HUSHED FACE
" U+1F630 	😰 	\:cold_sweat: 	FACE WITH OPEN MOUTH AND COLD SWEAT
" U+1F631 	😱 	\:scream: 	FACE SCREAMING IN FEAR
" U+1F632 	😲 	\:astonished: 	ASTONISHED FACE
" U+1F633 	😳 	\:flushed: 	FLUSHED FACE
" U+1F634 	😴 	\:sleeping: 	SLEEPING FACE
" U+1F635 	😵 	\:dizzy_face: 	DIZZY FACE
" U+1F636 	😶 	\:no_mouth: 	FACE WITHOUT MOUTH
" U+1F637 	😷 	\:mask: 	FACE WITH MEDICAL MASK
" U+1F638 	😸 	\:smile_cat: 	GRINNING CAT FACE WITH SMILING EYES
" U+1F639 	😹 	\:joy_cat: 	CAT FACE WITH TEARS OF JOY
" U+1F63A 	😺 	\:smiley_cat: 	SMILING CAT FACE WITH OPEN MOUTH
" U+1F63B 	😻 	\:heart_eyes_cat: 	SMILING CAT FACE WITH HEART-SHAPED EYES
" U+1F63C 	😼 	\:smirk_cat: 	CAT FACE WITH WRY SMILE
" U+1F63D 	😽 	\:kissing_cat: 	KISSING CAT FACE WITH CLOSED EYES
" U+1F63E 	😾 	\:pouting_cat: 	POUTING CAT FACE
" U+1F63F 	😿 	\:crying_cat_face: 	CRYING CAT FACE
" U+1F640 	🙀 	\:scream_cat: 	WEARY CAT FACE
" U+1F645 	🙅 	\:no_good: 	FACE WITH NO GOOD GESTURE
" U+1F646 	🙆 	\:ok_woman: 	FACE WITH OK GESTURE
" U+1F647 	🙇 	\:bow: 	PERSON BOWING DEEPLY
" U+1F648 	🙈 	\:see_no_evil: 	SEE-NO-EVIL MONKEY
" U+1F649 	🙉 	\:hear_no_evil: 	HEAR-NO-EVIL MONKEY
" U+1F64A 	🙊 	\:speak_no_evil: 	SPEAK-NO-EVIL MONKEY
" U+1F64B 	🙋 	\:raising_hand: 	HAPPY PERSON RAISING ONE HAND
" U+1F64C 	🙌 	\:raised_hands: 	PERSON RAISING BOTH HANDS IN CELEBRATION
" U+1F64D 	🙍 	\:person_frowning: 	PERSON FROWNING
" U+1F64E 	🙎 	\:person_with_pouting_face: 	PERSON WITH POUTING FACE
" U+1F64F 	🙏 	\:pray: 	PERSON WITH FOLDED HANDS
" U+1F680 	🚀 	\:rocket: 	ROCKET
" U+1F681 	🚁 	\:helicopter: 	HELICOPTER
" U+1F682 	🚂 	\:steam_locomotive: 	STEAM LOCOMOTIVE
" U+1F683 	🚃 	\:railway_car: 	RAILWAY CAR
" U+1F684 	🚄 	\:bullettrain_side: 	HIGH-SPEED TRAIN
" U+1F685 	🚅 	\:bullettrain_front: 	HIGH-SPEED TRAIN WITH BULLET NOSE
" U+1F686 	🚆 	\:train2: 	TRAIN
" U+1F687 	🚇 	\:metro: 	METRO
" U+1F688 	🚈 	\:light_rail: 	LIGHT RAIL
" U+1F689 	🚉 	\:station: 	STATION
" U+1F68A 	🚊 	\:tram: 	TRAM
" U+1F68B 	🚋 	\:train: 	TRAM CAR
" U+1F68C 	🚌 	\:bus: 	BUS
" U+1F68D 	🚍 	\:oncoming_bus: 	ONCOMING BUS
" U+1F68E 	🚎 	\:trolleybus: 	TROLLEYBUS
" U+1F68F 	🚏 	\:busstop: 	BUS STOP
" U+1F690 	🚐 	\:minibus: 	MINIBUS
" U+1F691 	🚑 	\:ambulance: 	AMBULANCE
" U+1F692 	🚒 	\:fire_engine: 	FIRE ENGINE
" U+1F693 	🚓 	\:police_car: 	POLICE CAR
" U+1F694 	🚔 	\:oncoming_police_car: 	ONCOMING POLICE CAR
" U+1F695 	🚕 	\:taxi: 	TAXI
" U+1F696 	🚖 	\:oncoming_taxi: 	ONCOMING TAXI
" U+1F697 	🚗 	\:car: 	AUTOMOBILE
" U+1F698 	🚘 	\:oncoming_automobile: 	ONCOMING AUTOMOBILE
" U+1F699 	🚙 	\:blue_car: 	RECREATIONAL VEHICLE
" U+1F69A 	🚚 	\:truck: 	DELIVERY TRUCK
" U+1F69B 	🚛 	\:articulated_lorry: 	ARTICULATED LORRY
" U+1F69C 	🚜 	\:tractor: 	TRACTOR
" U+1F69D 	🚝 	\:monorail: 	MONORAIL
" U+1F69E 	🚞 	\:mountain_railway: 	MOUNTAIN RAILWAY
" U+1F69F 	🚟 	\:suspension_railway: 	SUSPENSION RAILWAY
" U+1F6A0 	🚠 	\:mountain_cableway: 	MOUNTAIN CABLEWAY
" U+1F6A1 	🚡 	\:aerial_tramway: 	AERIAL TRAMWAY
" U+1F6A2 	🚢 	\:ship: 	SHIP
" U+1F6A3 	🚣 	\:rowboat: 	ROWBOAT
" U+1F6A4 	🚤 	\:speedboat: 	SPEEDBOAT
" U+1F6A5 	🚥 	\:traffic_light: 	HORIZONTAL TRAFFIC LIGHT
" U+1F6A6 	🚦 	\:vertical_traffic_light: 	VERTICAL TRAFFIC LIGHT
" U+1F6A7 	🚧 	\:construction: 	CONSTRUCTION SIGN
" U+1F6A8 	🚨 	\:rotating_light: 	POLICE CARS REVOLVING LIGHT
" U+1F6A9 	🚩 	\:triangular_flag_on_post: 	TRIANGULAR FLAG ON POST
" U+1F6AA 	🚪 	\:door: 	DOOR
" U+1F6AB 	🚫 	\:no_entry_sign: 	NO ENTRY SIGN
" U+1F6AC 	🚬 	\:smoking: 	SMOKING SYMBOL
" U+1F6AD 	🚭 	\:no_smoking: 	NO SMOKING SYMBOL
" U+1F6AE 	🚮 	\:put_litter_in_its_place: 	PUT LITTER IN ITS PLACE SYMBOL
" U+1F6AF 	🚯 	\:do_not_litter: 	DO NOT LITTER SYMBOL
" U+1F6B0 	🚰 	\:potable_water: 	POTABLE WATER SYMBOL
" U+1F6B1 	🚱 	\:non-potable_water: 	NON-POTABLE WATER SYMBOL
" U+1F6B2 	🚲 	\:bike: 	BICYCLE
" U+1F6B3 	🚳 	\:no_bicycles: 	NO BICYCLES
" U+1F6B4 	🚴 	\:bicyclist: 	BICYCLIST
" U+1F6B5 	🚵 	\:mountain_bicyclist: 	MOUNTAIN BICYCLIST
" U+1F6B6 	🚶 	\:walking: 	PEDESTRIAN
" U+1F6B7 	🚷 	\:no_pedestrians: 	NO PEDESTRIANS
" U+1F6B8 	🚸 	\:children_crossing: 	CHILDREN CROSSING
" U+1F6B9 	🚹 	\:mens: 	MENS SYMBOL
" U+1F6BA 	🚺 	\:womens: 	WOMENS SYMBOL
" U+1F6BB 	🚻 	\:restroom: 	RESTROOM
" U+1F6BC 	🚼 	\:baby_symbol: 	BABY SYMBOL
" U+1F6BD 	🚽 	\:toilet: 	TOILET
" U+1F6BE 	🚾 	\:wc: 	WATER CLOSET
" U+1F6BF 	🚿 	\:shower: 	SHOWER
" U+1F6C0 	🛀 	\:bath: 	BATH
" U+1F6C1 	🛁 	\:bathtub: 	BATHTUB
" U+1F6C2 	🛂 	\:passport_control: 	PASSPORT CONTROL
" U+1F6C3 	🛃 	\:customs: 	CUSTOMS
" U+1F6C4 	🛄 	\:baggage_claim: 	BAGGAGE CLAIM
" U+1F6C5 	🛅 	\:left_luggage:

