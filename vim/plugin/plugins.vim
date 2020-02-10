""" =========================================================================
""" ================================ Deoplete ===============================
""" =========================================================================
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" Disable deoplete when in multi cursor mode
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction
function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

" Use supertab plugin to enable scrolling with tab and shift+tab
let g:SuperTabDefaultCompletionType = "<c-n>"


""" =========================================================================
""" =============================== NERDTree ================================
""" =========================================================================
let g:NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'
let g:NERDTreeIgnore = ['\.meta$']

""" =========================================================================
""" =============================== OmniSharp ===============================
""" =========================================================================
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_mono = 1

let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim
let g:OmniSharp_highlight_types = 3

""" =========================================================================
""" ================================== ALE ==================================
""" =========================================================================
let g:ale_linters = {
\   'javascript': ['eslint', 'prettier'],
\   'vue': ['eslint'],
\   'go': ['golangci-lint'],
\   'python': ['pyls'],
\   'cs': ['OmniSharp'],
\   'cpp': ['clang'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['prettier', 'tslint', 'eslint'],
\   'vue': ['eslint'],
\   'scss': ['prettier'],
\   'html': ['prettier'],
\   'python': ['black'],
\   'cpp': ['clang'],
\}

let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1

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
