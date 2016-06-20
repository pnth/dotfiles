" https://github.com/spacelis/textabulify/blob/master/ftplugin/tex_textablify.vim
if exists("b:TexTabulify")
	finish
endif
let b:TexTabulify = 1

if !exists("g:TexTabulify_header")
	let g:TexTabulify_header = '\begin{tabular}{%s} \hline'
endif
if !exists("g:TexTabulify_footer")
	let g:TexTabulify_footer = '\end{tabular}'
endif

function! s:TexTabulify(hf) range
python << EOF
import re,vim
def formatline(line):
  """ Format line to table style
  """
  SPACE = re.compile(r'\s+')
  for ch in '\\&%$#{}~^_':
    line = line.replace(ch, '\\' + ch)
  if '|' in line:
    return line.replace('|', ' & ')
  elif ',' in line:
    return line.replace(',', ' & ')
  elif ' ' in line:
    return SPACE.sub(' & ', line)
  elif '\t' in line:
    return SPACE.sub(' & ', line)
  return line

rbuf = vim.current.buffer.range(int(vim.eval('a:firstline')), int(vim.eval('a:lastline')))
for i in range(len(rbuf)):
    rbuf[i] = formatline(rbuf[i]) + r' \\ \hline'

if vim.eval("a:hf") == '1':
  cols = rbuf[-1].count('&') + 1
  rbuf.append(vim.eval('g:TexTabulify_footer '))
  rbuf.append(vim.eval('g:TexTabulify_header') % '|'.join([''] + ['c'] * cols + ['']), 0)
EOF
endfunction

command -nargs=1 -range -buffer TexTabulify <line1>,<line2>call s:TexTabulify(<f-args>)
" com -nargs=1 H call WebHeader(<f-args>)

" # if vim.eval("a:hf") == '1':
" #   cols = rbuf[-1].count('&') + 1
" #   rbuf.append(vim.eval('g:TexTabulify_footer '))
" #   rbuf.append(vim.eval('g:TexTabulify_header') % '|'.join([''] + ['c'] * cols + ['']), 0)



" Ctrl+v
" Select lines.
" :LEXTABLEEnter Create table lines including start and end.
" :LEXTABLE 0Enter Create table lines only.
" :LEXTABLE c l l cEnter Create table lines and use 'c l l c' as column specifiers.
" Sample code:

" function! LaTeXTable(...) range
"     " Replace consecutive spaces with " & "
"     '<,'>s/\s\+/ \& /g
"     " Replace start with \hline
"     '<,'>s/^\s*/\\hline /
"     " Replace end with \\
"     '<,'>s/\s*$/ \\\\/

"     " If argument is 0 then do not add table def
"     if a:1 == "0"
"         return
"     " Else if argument is not empty use it as column specifier
"     elseif a:1 != ""
"         let cc = a:1
"     " Else split first line on & and make all center c
"     else
"         let ands = split(getline(a:firstline), '&')
"         call map(ands, '"c"')
"         let cc = join(ands, " ")
"     endif

"     " Add start of table
"     call append(a:firstline - 1,"\\begin{tabular}{ " . cc . " }")
"     " Add end of table
"     call append(a:lastline  + 1,"\\end{tabular}")
" endfun

" " -nargs=? allow 0 or 1 argument
" " -range   use range
" " LEXTABLE name
" " silent   do not echo what is done
" " <line.>  range
" " <q-args> Quote argument
" command! -nargs=? -range LEXTABLE silent <line1>,<line2>call LaTeXTable(<q-args>)
" If one usually do not want to add start/end of table one can easily change the function to say:

" if arg is empty or 0, then do not create,
" if arg=1 auto, then auto generate
" else use as string.

" It would perhaps be preferable:

" if a:1 == "" || a:1 == "0"
"     return
" elseif a:1 != "1"
"     let cc=a:1
" else
"     let ands = split(getline(a:firstline), '&')
"     call map(ands, '"c"')
"     let cc = join(ands, " ")
" endif
" So then:

" :'<,'>LEXTABLE<Enter>           # Only parse lines, no header.
" :'<,'>LEXTABLE 0<Enter>         # Only parse lines, no header.
" :'<,'>LEXTABLE 1<Enter>         # Auto generate column specifiers.
" :'<,'>LEXTABLE c l<Enter>       # Use 'c l' as column specifiers.
" :'<,'>LEXTABLE c | l l<Enter>   # Use 'c | l l' as column specifiers.
