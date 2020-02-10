let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

let g:go_fmt_fail_silently = 1
let g:go_metalinter_command=''


" Settings for golangci for ALE
let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = '--enable-all --disable lll'

"call deoplete#custom#option('omni_patterns', {
"\   'go': '\w*',
"\})

let g:deoplete#sources#go#gocode_binary = '~/.go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']


