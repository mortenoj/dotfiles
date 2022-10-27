"
" Key bindings
" NB: comment keybind is defined in plugins.vim using nvim-comment
""

let mapleader=","

nmap \ <leader>q

" Reload VIMRC in all windows on save
if !exists("*ReloadVimrc")
    function! ReloadVimrc()
        let save_cursor = getcurpos()
        source $MYVIMRC
        call setpos('.', save_cursor)
    endfunction
    com! ReloadVimrc :call ReloadVimrc()
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()


" Refresh nvim bind
nmap <leader>r :call ReloadVimrc()<CR>

" Terminal
nmap <leader>s <C-w>s<C-w>j:terminal<CR>
nmap <leader>vs <C-w>v<C-w>l:terminal<CR>

nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

map <leader><leader> :noh<cr>

" Comment toggle
nnoremap <leader>c<space> :CommentToggle<CR>
vnoremap <leader>c<space> :CommentToggle<CR>

" NERDTree
nmap <leader>q :NERDTreeToggle<CR>

" Clap
nmap <leader>f :Clap files<CR>
nmap <leader>F :Clap blines<CR>
nmap <leader>j :Clap jumps<CR>
nmap <leader>g :Clap live_grep<CR>
nmap <leader>G :Clap live_grep +no-cache<CR>
nmap <leader>d :Clap live_grep ++query=<cword><CR>
vmap <leader>d :Clap live_grep ++query=@visual <CR>
nmap <leader>ee :Clap colors<CR>

" Colors
nmap <leader>el :call LightMode()<CR>
nmap <leader>ed :call DarkMode()<CR>

" Convenience move maps
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-x> <C-w>x


" Tabs
map <leader>tn :tabnew<cr>
map <leader>t<leader> :tabnext<cr>
map <leader>tm :tabmove<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>

" Move between wrapped lines
nnoremap j gj
nnoremap k gk

" Keep selection when indenting
vnoremap < <gv
vnoremap > >gv

vnoremap <ESC> <C-c>

" COC settings
nnoremap <Leader>e <Plug>(coc-diagnostic-next)
nnoremap <Leader>E <Plug>(coc-diagnostic-prev)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

" Tab selection in coc complete menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
