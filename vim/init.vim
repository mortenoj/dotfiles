    """ ========================================================
    """ Plugins
    """ ========================================================

    call plug#begin()

    """ Aesthetics
        Plug 'dracula/vim'
        Plug 'morhetz/gruvbox'
        Plug 'iCyMind/NeoSolarized'
        Plug 'joshdick/onedark.vim'
        Plug 'nightsense/forgotten'
        Plug 'trevordmiller/nova-vim'
        Plug 'zaki/zazen'
        Plug 'rakr/vim-one'
        Plug 'nanotech/jellybeans.vim'
        Plug 'sickill/vim-monokai'

        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'

        Plug 'ryanoasis/vim-devicons'

        Plug 'junegunn/goyo.vim'
        Plug 'junegunn/limelight.vim'
        Plug 'junegunn/seoul256.vim'
        Plug 'junegunn/vim-journal'
        Plug 'junegunn/rainbow_parentheses.vim'

        Plug 'sheerun/vim-polyglot'

        Plug 'nightsense/nemo'
        Plug 'yuttie/hydrangea-vim'
        Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
        Plug 'rhysd/vim-color-spring-night'
        Plug 'mhartington/oceanic-next'


    """ Functionality

        Plug 'jiangmiao/auto-pairs'     " Auto complete quotes and brackets
        Plug 'scrooloose/nerdcommenter' " Commenter
        Plug 'scrooloose/nerdtree'      " File Tree

        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete
        Plug 'davidhalter/jedi-vim'             " Using for goto not completion
        Plug 'zchee/deoplete-jedi'
        Plug 'Shougo/neosnippet'
        Plug 'Shougo/neosnippet-snippets'

        Plug 'sbdchd/neoformat'                 " Formatter
        Plug 'terryma/vim-multiple-cursors'     " Multiple cursors
        Plug 'machakann/vim-highlightedyank'    " Highlight yanked lines
        Plug 'dense-analysis/ale'               " Code checker
        Plug 'ervandew/supertab'                " Tab for autocompletion
        Plug '/usr/local/opt/fzf'
        Plug 'junegunn/fzf.vim'
        Plug 'majutsushi/tagbar'
        Plug 'junegunn/vim-easy-align'
        Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
        Plug 'Yggdroot/indentLine'
        Plug 'vim-scripts/indentpython.vim'
        Plug 'OmniSharp/omnisharp-vim'
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'
        Plug 'tpope/vim-fugitive'

        Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
        Plug 'ryanolsonx/vim-lsp-python'

        Plug 'cyansprite/deoplete-omnisharp' , {'do': './install.sh'}

    call plug#end()



    """ ========================================================
    """ Settings
    """ ========================================================

    filetype indent plugin on

    " Dark/Light mode
    set background=dark " use dark mode
    "set background=light " uncomment to use light mode

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


    """ ========================================================
    """ Plugin settings
    """ ========================================================

    " Language client
    if executable('pyls')
        au User lsp_setup call lsp#register_server({
            \ 'name': 'pyls',
            \ 'cmd': {server_info->['pyls']},
            \ 'whitelist': ['python'],
            \ })
    endif

    let g:LanguageClient_serverCommands = {
        \ 'javascript': ['javascript-typescript-stdio'],
        \ 'go': ['gopls'],
        \ 'python': ['/usr/local/bin/pyls'],
        \ }

    " SuperTab
    let g:SuperTabDefaultCompletionType = "<c-n>"

    "Ulti snips
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

    " NERDTree
    let NERDTreeShowHidden=1
    let g:NERDTreeDirArrowExpandable = '↠'
    let g:NERDTreeDirArrowCollapsible = '↡'

    " Deoplete
    let g:loaded_youcompleteme = 1
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1

    " Disable deoplete when in multi cursor mode
    function! Multiple_cursors_before()
        let b:deoplete_disable_auto_complete = 1
    endfunction
    function! Multiple_cursors_after()
        let b:deoplete_disable_auto_complete = 0
    endfunction

    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

    " Jedi
    let g:jedi#completions_enabled = 0 " disable autocompletion, cause we use deoplete for completion
    let g:jedi#use_splits_not_buffers = 'right' " open the go-to function in split, not another buffer
    let g:jedi#rename_command = "<leader>R"

    " Neoformat
    " Enable alignment
    let g:neoformat_basic_format_align = 1

    " Enable tab to spaces conversion
    let g:neoformat_basic_format_retab = 1

    " Enable trimmming of trailing whitespace
    let g:neoformat_basic_format_trim = 1


    " ALE settins
    let g:ale_linters = {
    \   'javascript': ['eslint', 'prettier'],
    \   'vue': ['eslint'],
    \   'go': ['gofmt', 'errcheck', 'gopls','golint'],
    \   'python': ['pyls', 'pylint', 'flake8'],
    \   'cs': ['omni'],
    \}

    let g:ale_fixers = {
    \    '*': ['remove_trailing_lines', 'trim_whitespace'],
    \    'javascript': ['eslint', 'prettier'],
    \    'typescript': ['prettier', 'tslint', 'eslint'],
    \    'vue': ['eslint'],
    \    'scss': ['prettier'],
    \    'html': ['prettier'],
    \    'reason': ['refmt'],
    \    'python': ['black'],
    \    'go': ['gofmt', 'goimports' ],
    \}

    let g:ale_cs_mcsc_assemblies = [ '/Applications/2018.3.4f1/Unity.app/Contents/Managed/UnityEngine.dll' ]

    let g:ale_fix_on_save = 1
    let g:ale_sign_column_always = 1
    let g:ale_set_highlights = 0
    "let g:ale_sign_error = '>>'
    "let g:ale_sign_warning = '--'
    let g:ale_sign_error = '⤫'
    let g:ale_sign_warning = '⚠'
    let g:airline#extensions#ale#enabled = 1


    " indentLine
    let g:indentLine_char = '▏'
    let g:indentLine_color_gui = '#363949'

    " TagBar
    let g:tagbar_width = 30
    let g:tagbar_iconchars = ['↠', '↡']

    " fzf-vim
    let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'Type'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Character'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

    "highlight ALEWarning ctermbg=DarkMagenta



    """ ========================================================
    """ Language Support
    """ ========================================================

    " HTML, XML, JS, Jinja
    autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 textwidth=79 expandtab autoindent fileformat=unix
    autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
    autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
    autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

    " Markdown and Journal
    autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

    " Python
    autocmd FileType py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
    let python_highlight_all=1
    let g:python3_host_prog = expand('/usr/local/bin/python3')
    let g:python_host_prog = '/usr/local/bin/python'
    let g:python2_host_prog = '/usr/local/bin/python2'

    " Golang
    let g:go_fmt_command = "goimports"

    " turn highlighting on
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_auto_type_info = 1

    let g:go_def_mode='gopls'
    let g:go_info_mode='gopls'
    let g:go_highlight_build_constraints = 1

    " Go Highlight same identifiers Disabled because it is very slow
    "let g:go_auto_sameids = 1

    " Go Show variable info
    let g:go_auto_type_info = 1

    " C#
    "autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
    autocmd FileType cs setlocal omnifunc=ale#completion#OmniFunc

    let g:ycm_autoclose_preview_window_after_completion=1
    let g:OmniSharp_server_stdio = 1
    let g:OmniSharp_server_use_mono = 1
    let g:OmniSharp_timeout = 5
    let g:OmniSharp_highlight_types = 1



    """ ========================================================
    """ Custom Functions
    """ ========================================================

    " Trim Whitespaces
    function! TrimWhitespace()
        let l:save = winsaveview()
        %s/\\\@<!\s\+$//e
        call winrestview(l:save)
    endfunction

    " (Dark)
    function! ColorOne()
        let g:airline_theme=''
        colorscheme onedark
    endfunction

    " (Dark)
    function! ColorNeoSolarized()
        let g:airline_theme=''
        colorscheme onedark
    endfunction

    " (Dark)
    function! ColorNova()
        let g:airline_theme='silver'
        colorscheme nova
    endfunction

    " (Light)
    function! ColorForgotten()
        let g:airline_theme='tomorrow'
        color forgotten-light
    endfunction

    " (Dark)
    function! ColorMonokai()
        let g:airline_theme='badcat'
        colorscheme monokai
    endfunction


    """ ========================================================
    """ Key Bindings
    """ ========================================================
    let mapleader=","

    nmap <leader>q :NERDTreeToggle<CR>
    nmap <leader>w :TagbarToggle<CR>
    nmap \ <leader>q

    nmap <leader>ee :Colors<CR>
    nmap <leader>ea :AirlineTheme<CR>

    nmap <leader>e1 :call ColorOne()<CR>
    nmap <leader>e2 :call ColorNova()<CR>
    nmap <leader>e3 :call ColorForgotten()<CR>
    nmap <leader>e4 :call ColorMonokai()<CR>
    nmap <leader>r :so ~/.config/nvim/init.vim<CR>


    nmap <leader>t :call TrimWhitespace()<CR>

    nmap <leader>s <C-w>s<C-w>j:terminal<CR>
    nmap <leader>vs <C-w>v<C-w>l:terminal<CR>

    """nmap <leader>d <Plug>(pydocstring)
    nmap <leader>f :Files<CR>
    nmap <leader>g :Goyo<CR>
    nmap <leader>h :RainbowParentheses!!<CR>
    "nmap <leader>j :set filetype=journal<CR>
    "
    nmap <leader>k :ColorToggle<CR>
    nmap <leader>l :Limelight!!<CR>
    xmap <leader>l :Limelight!!<CR>
    nmap <leader>d :!./deploy.sh<CR>
    autocmd FileType python nmap <leader>x :0,$!~/.config/nvim/env/bin/python -m yapf<CR>

    nmap <Tab> :bnext<CR>
    nmap <S-Tab> :bprevious<CR>
    noremap <Leader>y "*y
    noremap <Leader>p "*p
    noremap <Leader>Y "+y
    noremap <Leader>P "+p

    nnoremap <Leader>e :ALENextWrap<CR>
    nnoremap <Leader>E :ALEPreviousWrap<CR>
    map <leader><leader> :noh<cr>


autocmd FileType javascript nnoremap <buffer> gd :call LanguageClient#textDocument_definition()<CR>
autocmd FileType python nnoremap <buffer> gd :call LanguageClient#textDocument_definition()<CR>
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

augroup omnisharp_commands
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>



""" ========================================================
""" Colors
""" ========================================================

" Enable 24bit colors
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on

" Opaque Background (Comment out to use terminal's profile)
set termguicolors
color dracula
"set notermguicolors "could fix tmux issues

"colorscheme gruvbox
colorscheme onedark
"colorscheme nova
"colorscheme NeoSolarized
"colorscheme one
"colorscheme jellybeans
"colorscheme monokai

highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none

" Transparent Background (For i3 and compton)
"highlight Normal guibg=NONE ctermbg=NONE
"highlight LineNr guibg=NONE ctermbg=NONE

"let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
