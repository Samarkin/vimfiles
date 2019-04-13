au BufNewFile,BufRead *.js setf es6
au BufNewFile,BufRead *.jsm setf es6
au BufNewFile,BufRead Jakefile setf es6
au BufNewFile,BufRead *.es6 setf es6

fun! s:SelectJavascript()
  if getline(1) =~# '^#!.*/bin/\%(env\s\+\)\?node\>'
    set ft=es6
  endif
endfun
au BufNewFile,BufRead * call s:SelectJavascript()
