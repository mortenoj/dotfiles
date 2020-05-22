let mapleader=","

nmap \ <leader>q

" Refresh nvim bind
nmap <leader>r :so ~/.config/nvim/init.vim<CR>

" Terminal
nmap <leader>s <C-w>s<C-w>j:terminal<CR>
nmap <leader>vs <C-w>v<C-w>l:terminal<CR>

nmap <leader>k :ColorToggle<CR>

nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

map <leader><leader> :noh<cr>

" NERDTree
nmap <leader>q :NERDTreeToggle<CR>

" ALE
nnoremap <Leader>e :ALENextWrap<CR>
nnoremap <Leader>E :ALEPreviousWrap<CR>

" FZF
nmap <leader>f :Files<CR>

" Quality of life
vnoremap < <gv
vnoremap > >gv
