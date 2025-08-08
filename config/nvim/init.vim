set nocompatible

" keep terminal background colour, make sure syntax highlighting is readable
set background=light
autocmd ColorScheme * highlight Normal ctermbg=None guibg=None
" colorscheme peachpuff
colorscheme vim

set titlestring=%f
set title

set tabstop=2
set shiftwidth=0 " always same as 'tabstop'
set expandtab

set list

filetype plugin indent on
