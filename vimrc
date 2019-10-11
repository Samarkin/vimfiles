" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

if has('win32') || has('win64')
source $VIMRUNTIME/mswin.vim
behave mswin
endif

""" GUI options
if has('gui_running')
"GUI font name
if has('mac')
set gfn=SF\ Mono:h11
elseif has('win32') || has('win64')
set gfn=Consolas
endif
	set mouse=a " use mouse
	set guioptions+=c " use text menus if possible
	set guioptions+=e " use gui tabs
	set guioptions-=M " no system menu
	set guioptions-=t " no tear-off menus
	set guioptions-=T " no toolbar
	set guioptions+=v " vertical button layout for dialogs
	set lines=30 columns=130 " set initial window size
	let no_buffers_menu = 1 " no buffers menu
else " no GUI
	set mouse= " do not use mouse
endif

""" File format options
set ffs=unix,dos,mac " file formats
set fencs=ucs-bom,utf-8,cp1251 " file encodings
set enc=utf-8

" respect file's EOL settings
if exists("&fixeol")
	au BufWrite * set nofixeol
endif

""" File formats
au BufNewFile,BufRead *.wxs set ft=xml
au BufNewFile,BufRead *.xaml set ft=xml

""" New commands
if has('win32')
	" ???
else
	au FileType xml setlocal equalprg=xmllint\ --format\ -\ 2>/dev/null
	command! Hex   :% ! xxd
	command! Unhex :% ! xxd -r
endif

""" Behavior options
set incsearch " Incremental search
set hlsearch " Highlight search results
set ignorecase " ignore case
set smartcase " if only you're not searching in different cases

set backspace=indent,eol,start " allow to delete special symbols
set whichwrap=b,s,[,] " allow to move through special symbols

set nobackup " turn off backup
set noswapfile " disable swap file
set history=700 " increase history size
set wildmenu " pretty menu for commandline auto completion

set ai " auto indent
set si " smart indent


""" Appearance options
" Show trailing spaces and tabs
set listchars=tab:»\ ,trail:·,nbsp:º
set list

" tab size
set softtabstop=4
set tabstop=4
set shiftwidth=4

set number " display line numbers
set wrap " line wrapping
syntax on " syntax highlighting

" show multikey commands
set showcmd

""" Status line
set laststatus=2 " always enable statusline
set statusline=%{&mod?'[+]':''}                                   " modified flag
set statusline+=%n.                                               " buffer number
set statusline+=%<                                                " truncate here
set statusline+=%F                                                " file name
set statusline+=\ %y                                              " file type
set statusline+=[%{&ff}%{&eol?'-eol':''}]                         " file format
if !exists("&fixeol")
	set statusline+=[NoRespect]
endif
set statusline+=[%{strlen(&fenc)?&fenc:'none'}%{&bomb?'-bom':''}] " file encoding
set statusline+=%=                                                " separator
set statusline+=\ Ln:%3.l\/%L,\ Col:%3.c,\ Char:\ %6.(0x%02B%)    " info about cursor

""" Plugins settings
" Disable netrw history
let g:netrw_dirhistmax = 0
" make gitgutter only track saved changes
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
" NERDCommenter settings
let g:NERDCompactSexyComs = 1

""" Error format
" Don't treat J-Link logo as reported error message
set efm-=%f:%l:%m

""" Colorscheme
set background=light
colorscheme one

""" Load user-specific settings
if filereadable(expand('$HOME/private.vimrc'))
	source $HOME/private.vimrc
endif

""" Поддержка командного режима при русской раскладке (аналог langmap для UTF-8)
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >

