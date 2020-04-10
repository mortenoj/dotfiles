let b:ale_linters = ['pyls']
let b:ale_fixers = ['black']

let python_highlight_all=1
let g:python3_host_prog = expand('/usr/local/bin/python3')
let g:python_host_prog = '/usr/local/bin/python'
let g:python2_host_prog = '/usr/local/bin/python2'

autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
autocmd FileType python nnoremap <buffer> gd :call LanguageClient#textDocument_definition()<CR>
