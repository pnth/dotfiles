" Commands:
"
" :WincmdTag
"
"   give each window a label, i.e. set a variable w:tagwinnr to its window
"   number.
"
"
" :WincmdW [N]  or
" :[N]WincmdW
"
"   go to the window labelled with [N].
"
"   Default [N] is 0, which is out of range.  [N] being out of range goes to
"   the window with the smallest (highest) available label.
"

com! -bar WincmdTag  call s:WincmdTag()
com! -bar -count WincmdW  call s:WincmdW(<count>)

func! s:WincmdTag()
     for wnr in range(1, winnr("$"))
         " w:tagwinnr
         call setwinvar(wnr, "tagwinnr", wnr)
     endfor
     let t:tagwinnr_max = winnr("$")
endfunc

func! s:WincmdW(num)
     " w:tagwinnr
     let labels = map(range(1, winnr("$")), 'getwinvar(v:val, "tagwinnr")')
     let numbers = filter(copy(labels), 'type(v:val)==0')
     if empty(numbers)
         echo 'WincmdW: no labels found (try :WincmdTag first)'
         return
         " or all labelled windows removed
     endif
     if !exists("t:tagwinnr_max")
         " not expected to happen
         let t:tagwinnr_max = max(numbers)
     endif
     if a:num == 0
         let num = min(numbers)
     elseif a:num > t:tagwinnr_max
         let num = max(numbers)
     elseif index(numbers, a:num) == -1
         echo printf('WincmdW: label %d not found (window closed?)', a:num)
         return
     else
         let num = a:num
     endif
     let wnr = 1 + index(labels, num)
     exec wnr. "wincmd w"
endfunc 
