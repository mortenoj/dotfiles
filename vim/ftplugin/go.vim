" Get IndentLine working after vim-go disables it
set list lcs=tab:¦\ ,

let b:ale_enabled = 1

" Settings for golangci for ALE
let b:ale_linters = ['golangci-lint']
let b:ale_fixers = ['gofmt', 'goimports']
let b:ale_go_gofmt_options = "-s"

let b:ale_go_golangci_lint_package = 1
" let b:ale_go_golangci_lint_options = '--enable-all --disable=gomnd --disable=godot --disable=lll --exclude-use-default=false'
let b:ale_go_golangci_lint_options = ''
let b:ale_go_staticcheck_lint_package = 1

nnoremap <Leader>e :ALENextWrap<CR>
nnoremap <Leader>E :ALEPreviousWrap<CR>
