autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 textwidth=79 expandtab autoindent fileformat=unix
autocmd FileType javascript nnoremap <buffer> gd :call LanguageClient#textDocument_definition()<CR>
