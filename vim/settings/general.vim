filetype indent plugin on

" Dark/Light mode
set background=dark " use dark mode

set number relativenumber
set nu rnu
set completeopt=longest,menuone,preview
set completeopt-=preview

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
"set ruler laststatus=2 showcmd showmode
"set list listchars=trail:»,tab:»-
set fillchars+=vert:\
set wrap breakindent
set encoding=utf-8
set number
set title
set guifont=DroidSansMono\ Nerd\ Font:h11

" Yank highlight
hi HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 400

" Neovim :Terminal
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert


" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction


""" ========================================================
""" Key Bindings
""" ========================================================
nmap \ <leader>q

nmap <leader>r :so ~/.config/nvim/init.vim<CR>

nmap <leader>t :call TrimWhitespace()<CR>
nmap <leader>s <C-w>s<C-w>j:terminal<CR>
nmap <leader>vs <C-w>v<C-w>l:terminal<CR>

nmap <leader>g :Goyo<CR>
nmap <leader>h :RainbowParentheses!!<CR>
nmap <leader>j :set filetype=journal<CR>
"
nmap <leader>k :ColorToggle<CR>
nmap <leader>l :Limelight!!<CR>
xmap <leader>l :Limelight!!<CR>

nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

map <leader><leader> :noh<cr>
