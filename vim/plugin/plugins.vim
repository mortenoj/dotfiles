""" =========================================================================
""" ================================ CocVim =================================
""" =========================================================================
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-java',
    \ 'coc-tsserver',
    \ 'coc-prettier',
    \ 'coc-eslint',
    \ 'coc-emmet',
    \ 'coc-json',
    \ 'coc-snippets',
    \ 'coc-go',
    \ 'coc-clangd',
    \ 'coc-jedi',
    \ 'coc-markdownlint',
    \ 'coc-omnisharp',
    \ 'coc-yaml',
    \ 'coc-yank',
    \ 'coc-xml',
    \ 'coc-pairs',
    \ 'coc-diagnostic',
    \ 'coc-python',
    \ 'coc-vimtex',
\ ]

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" From CocVim recommended settings

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

""" =========================================================================
""" =============================== NERDTree ================================
""" =========================================================================
let g:NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'
let g:NERDTreeIgnore = ['\.meta$', '^node_modules$']

" Open NERDTree on vim enter
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim with q when NERDtree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeQuitOnOpen = 1

""" =========================================================================
""" ================================== ALE ==================================
""" =========================================================================
let g:ale_pattern_options = {
\   '*': {'ale_enabled': 0},
\   '.*\.go$': {'ale_enabled': 1},
\}

let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }

let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

let g:ale_fix_on_save = 1

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1

let g:ale_list_window_size = 5

let g:airline#extensions#ale#enabled = 1

""" =========================================================================
""" ================================== CLAP =================================
""" =========================================================================

let g:clap_layout = { 'relative': 'editor' }
" let g:clap_theme = 'material_design_dark'
" let g:clap_background_shadow_blend = 100
let g:clap_enable_background_shadow = v:false

let g:clap_theme = ''
let g:clap_popup_input_delay = 0
let g:clap_provider_grep_delay = 0
let g:clap_provider_grep_opts = ''

""" =========================================================================
""" ============================ Neovim Terminal ============================
""" =========================================================================
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert


""" =========================================================================
""" ================================ EasyGit ================================
""" =========================================================================
let g:easygit_enable_command = 0


""" =========================================================================
""" ================================ VimTex =================================
""" =========================================================================
let g:vimtex_view_general_viewer = 'skim'
let g:vimtex_view_skim_activate = 1

" TOC settings
let g:vimtex_toc_config = {
    \ 'name': 'Table of contents (vimtex)',
    \ 'mode': 2,
    \ 'split_width': 50,
    \ 'show_help': 0,
    \ 'tocdepth': 2,
    \ }
