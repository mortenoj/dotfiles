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
    \ 'python': ['/usr/local/bin/pyls'],
    \ }
    "\ 'go': ['gopls'],

""" ========================================================
""" SuperTab
""" ========================================================
let g:SuperTabDefaultCompletionType = "<c-n>"


""" ========================================================
""" UltiSnips
""" ========================================================
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


""" ========================================================
""" NERDTree
""" ========================================================
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'

nmap <leader>q :NERDTreeToggle<CR>

""" ========================================================
""" Deoplete
""" ========================================================
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


""" ========================================================
""" Jedi
""" ========================================================
let g:jedi#completions_enabled = 0 " disable autocompletion, cause we use deoplete for completion
let g:jedi#use_splits_not_buffers = 'right' " open the go-to function in split, not another buffer
let g:jedi#rename_command = "<leader>R"


""" ========================================================
""" Neoformat
""" ========================================================

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1


""" ========================================================
""" ALE
""" ========================================================
let g:ale_linters = {
\   'javascript': ['eslint', 'prettier'],
\   'vue': ['eslint'],
\   'go': ['golangci-lint'],
\   'python': ['pyls', 'pylint', 'flake8'],
\   'cs': ['omni'],
\}

"\   'go': ['gofmt', 'errcheck', 'gopls','golint'],
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'javascript': ['eslint', 'prettier'],
\    'typescript': ['prettier', 'tslint', 'eslint'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'html': ['prettier'],
\    'reason': ['refmt'],
\    'python': ['black'],
\}

"\    'go': ['gofmt', 'goimports' ],
let g:ale_cs_mcsc_assemblies = [ '/Applications/2018.3.4f1/Unity.app/Contents/Managed/UnityEngine.dll' ]

" turn highlighting on
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1

let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

highlight ALEWarning ctermbg=DarkMagenta

nnoremap <Leader>e :ALENextWrap<CR>
nnoremap <Leader>E :ALEPreviousWrap<CR>

""" ========================================================
""" TagBar
""" ========================================================
let g:tagbar_width = 30
let g:tagbar_iconchars = ['↠', '↡']

nmap <leader>w :TagbarToggle<CR>


""" ========================================================
""" FZF-Vim
""" ========================================================
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

nmap <leader>f :Files<CR>
