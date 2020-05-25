"let b:coc_global_extensions = ['coc-jedi']

"let b:ale_linters = ['pyls']
"let b:ale_fixers = ['black']

autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
autocmd FileType python nnoremap <buffer> gd :call LanguageClient#textDocument_definition()<CR>
