filetype indent plugin on

" Dark/Light mode
set background=dark

set number

set lazyredraw

set nocursorline
set nocursorcolumn
set norelativenumber

set re=0
set ruler

set completeopt=longest,menuone,preview
set completeopt-=preview
set backspace=indent,eol,start

set incsearch ignorecase smartcase hlsearch

set fillchars+=vert:\
set wrap breakindent

set encoding=utf-8
set title

set visualbell
set noerrorbells

set nobackup
set noswapfile

" show a ... for wrapping lines
" set showbreak=...

" don't wrap mid-word
set linebreak

" set guifont=DroidSansMono\ Nerd\ Font:h11
set guifont=MesloLGM\ Nerd\ Font\ Mono:h11

set clipboard+=unnamedplus

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent

autocmd BufEnter *.ts :setlocal filetype=typescript
autocmd BufEnter *.js :setlocal filetype=javascript

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd BufNewFile,BufRead .eslintrc set filetype=javascript

" trigger autoread when changing buffers inside while inside vim:
au FocusGained,BufEnter * :checktime
