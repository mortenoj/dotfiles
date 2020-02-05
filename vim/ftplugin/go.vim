let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

" Settings for golangci for ALE
let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = '--enable-all --disable lll'

call deoplete#custom#option('omni_patterns', {
\   'go': '[^. *\t]\.\w*',
\})
