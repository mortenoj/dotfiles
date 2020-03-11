let g:go_fmt_command = "goimports"

let g:deoplete#sources#go#gocode_binary = '~/.go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Settings for golangci for ALE
let g:ale_go_golangci_lint_package=1
let g:ale_go_golangci_lint_options = '--enable-all --disable=gomnd --exclude-use-default=false'

let g:ale_go_staticcheck_lint_package = 1

" Get IndentLine working after vim-go disables it
"setlocal expandtab
set list lcs=tab:¦\ ,
