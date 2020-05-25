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

" FZF
nmap <leader>f :Files<CR>

" Quality of life
vnoremap < <gv
vnoremap > >gv

vnoremap <ESC> <C-c>

" COC settings
nnoremap <Leader>e <Plug>(coc-diagnostic-next)
nnoremap <Leader>E <Plug>(coc-diagnostic-prev)
nmap <silent> gd <Plug>(coc-definition)

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" TMUX Navigator

let  s:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <c-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <c-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <c-w>l :TmuxNavigateRight<cr>
