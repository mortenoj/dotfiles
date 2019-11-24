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

" Go Show variable info
let g:go_auto_type_info = 1

" ALE settings
let g:ale_go_golangci_lint_package=1
let g:ale_go_golangci_lint_options = '--enable-all
\ --disable lll'

" Binds
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
