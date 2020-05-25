filetype indent plugin on

" Dark/Light mode
set background=dark " use dark mode

set number
set norelativenumber

set re=0

set completeopt=longest,menuone,preview
set completeopt-=preview
set backspace=indent,eol,start

set incsearch ignorecase smartcase hlsearch

set fillchars+=vert:\
set wrap breakindent

set encoding=utf-8
set title
set guifont=DroidSansMono\ Nerd\ Font:h11

set clipboard+=unnamedplus

autocmd BufEnter *.ts :setlocal filetype=typescript
autocmd BufEnter *.js :setlocal filetype=javascript
"autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd BufNewFile,BufRead .eslintrc set filetype=javascript

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
