
""" =========================================================================
""" ================================ CocVim =================================
""" =========================================================================
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-clangd',
    \ 'coc-html',
    \ 'coc-java',
    \ 'coc-jedi',
    \ 'coc-json',
    \ 'coc-go',
    \ 'coc-markdownlint',
    \ 'coc-omnisharp',
    \ 'coc-yaml',
    \ 'coc-yank',
    \ 'coc-xml',
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-prettier',
    \ 'coc-eslint',
    \ 'coc-json',
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

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
\ }

""" =========================================================================
""" ================================== ALE ==================================
""" =========================================================================
let g:ale_pattern_options = {
\   '.*\.json$': {'ale_enabled': 0},
\   '.*\.js$': {'ale_enabled': 0},
\   '.*\.ts$': {'ale_enabled': 0},
\   '.*\.jsx$': {'ale_enabled': 0},
\   '.*\.tsx$': {'ale_enabled': 0},
\}

let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }

let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

let g:ale_fix_on_save = 1

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1

let g:ale_list_window_size = 10

let g:airline#extensions#ale#enabled = 1

""" =========================================================================
""" ================================== FZF ==================================
""" =========================================================================
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


""" =========================================================================
""" ================================== CLAP =================================
""" =========================================================================

let g:clap_layout = { 'relative': 'editor' }
let g:clap_theme = 'material_design_dark'


""" =========================================================================
""" ============================ Neovim Terminal ============================
""" =========================================================================
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
