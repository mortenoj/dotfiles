let b:ale_linters = ['eslint', 'prettier']
let b:ale_fixers = ['eslint', 'prettier']

setlocal tabstop=2 softtabstop=2 shiftwidth=2 textwidth=79 expandtab autoindent fileformat=unix
nnoremap <buffer> gd :call LanguageClient#textDocument_definition()<CR>
