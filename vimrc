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
let g:airline_powerline_fonts = 1

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
nmap ,jh :TagbarOpenAutoClose<cr>:vertical resize 20<cr>:!tmux resizep -t 2 -x 68<cr><cr><C-l>:set number<cr><C-l>:set number<cr><C-w>=
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

execute "autocmd FileType julia nmap <buffer> ,jl :!tmux send-keys -t 2 'cd(\"" . getcwd(). "\")' Enter<cr><cr>"

autocmd FileType julia map <buffer> <f2> :!tmux split-window &&
      \ tmux select-layout even-horizontal &&
      \ tmux split-window -d -t 2 &&
      \ tmux send-keys -t 2 'julia' Enter<cr><cr>
      \:!tmux select-pane -t:.1 <cr><cr>,en,jj,jl

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
" Α α α  A alpha
" Β β β  B beta
" Γ γ γ  G gamma
" Δ δ δ  D delta
" Ε ε ε  E epsilon
" Ζ ζ ζ  Z zeta
" Η η η  Y eta
" Θ θ θ  H theta
" Ι ι ι  I iota
" Κ κ κ  K kappa
" Λ λ λ  L lambda
" Μ μ μ  M mu
" Ν ν ν  N nu
" Ξ ξ ξ  C xi
" Ο ο ο  O omicron
" Π π π  P pi
" Ρ ρ ρ  R rho
" Σ σ σ  S sigma
" Τ τ τ  T tau
" Υ υ υ  U upsilon
" Φ φ φ  F phi
" Χ χ χ  X chi
" Ψ ψ ψ  Q psi
" Ω ω ω  W omega
"     ϊ  J
"     ϋ  V

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
" U+03012 	〒 	\postalmark 	POSTAL MARK
" U+03030 	〰 	\:wavy_dash: 	WAVY DASH
" U+0303D 	〽 	\:part_alternation_mark: 	PART ALTERNATION MARK
" U+03297 	㊗ 	\:congratulations: 	CIRCLED IDEOGRAPH CONGRATULATION
" U+03299 	㊙ 	\:secret: 	CIRCLED IDEOGRAPH SECRET
