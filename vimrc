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
" Plug 'chrisbra/unicode.vim'
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
" Plug 'lervag/vimtex'
" Plug 'drmikehenry/vim-fixkey'
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
set clipboard=unnamed
" set clipboard+=unnamedplus
" vnoremap y ygv"+y

au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! w
" au FileType python setlocal shiftwidth=2 tabstop=2


""" VIM_LEXICAL
" augroup lexical
"   autocmd!
"   autocmd FileType markdown,mkd call lexical#init()
"   autocmd FileType textile call lexical#init()
"   autocmd FileType text call lexical#init({ 'spell': 1 })
"   let g:lexical#dictionary = ['/usr/share/dict/words',]
"   let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt',]
"   let g:lexical#thesaurus_key = '<leader>t'
" augroup END

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
" nnoremap ' "
" nnoremap " '
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
autocmd FileType julia noremap <buffer> ,pr <esc>_Daprintln("<esc>pa = ", <esc>pa)<esc>


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
autocmd FileType julia,python,sh,mongoql,matlab,w3m,perl nmap <buffer> ,pp ,p}}
" autocmd FileType python,sh,mongoql,matlab,w3m,perl nmap <buffer> ,rp viwe<space>
" autocmd FileType python,sh,mongoql,matlab,w3m,perl nmap <buffer> ,rp viw<space>
autocmd FileType julia,python,sh,mongoql,matlab,w3m,perl imap <buffer> <c-l> <Esc><Plug>SlimeLineSendo
autocmd FileType python nmap <buffer> ,) :wa<cr>:!tmux send-keys -t 3 'python3 ' % Enter <cr><cr>
autocmd FileType python nmap <buffer> ,2 :wa<cr>:!tmux send-keys -t 3 'python3 ' main.py Enter <cr><cr>
autocmd FileType python nmap <buffer> ,+ :wa<cr>:!tmux send-keys -t 4 'python3 ' % Enter <cr><cr>
autocmd FileType python nmap <buffer> ,4 :wa<cr>:!tmux send-keys -t 4 'python3 ' main.py Enter <cr><cr>
" autocmd FileType python nmap <buffer> ,] :wa<cr>:!tmux send-keys -t 5 'python3 ' % Enter <cr><cr>
" autocmd FileType python nmap <buffer> ,6 :wa<cr>:!tmux send-keys -t 5 'python3 ' main.py Enter <cr><cr>
autocmd FileType python nmap <buffer> ,] :wa<cr>:!tmux send-keys -t 5 ^c Enter 'cgexec -g memory,cpuset:runex `which python3` ' % Enter <cr><cr>
autocmd FileType python nmap <buffer> ,6 :wa<cr>:!tmux send-keys -t 5 ^c Enter 'cgexec -g memory,cpuset:runex `which python3` ' main.py Enter <cr><cr>
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
