filetype indent plugin on

" Dark/Light mode
set background=dark " use dark mode

set number relativenumber
set nu rnu
set re=1
set completeopt=longest,menuone,preview
set completeopt-=preview
set backspace=indent,eol,start

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set fillchars+=vert:\
set wrap breakindent
set encoding=utf-8
set number
set title
set guifont=DroidSansMono\ Nerd\ Font:h11

" Yank highlight
hi HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 400

let python_highlight_all=1
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/bin/python'
let g:python2_host_prog = '/usr/bin/python2'

autocmd BufEnter *.tsx :setlocal filetype=typescript
autocmd BufEnter *.js :setlocal filetype=javascript
