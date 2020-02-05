autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
"autocmd FileType cs setlocal omnifunc=ale#completion#OmniFunc

"let g:ycm_autoclose_preview_window_after_completion=1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_timeout = 5
let g:OmniSharp_highlight_types = 1

"call deoplete#custom#option('sources', {
        "\ 'cs': ['omnisharp'],
        "\})


"call deoplete#custom#option('omni_patterns', {
"\   'cs': ['\w*'],
"\})

"augroup omnisharp_commands
    "autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
    "autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    "autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    "autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    "autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
    "autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
"augroup END

function SetCSSettings()

    " Use deoplete.
    call deoplete#enable()

    " Use smartcase.
    call deoplete#custom#option('smart_case', v:true)

    " Use OmniSharp-vim omnifunc 
    call deoplete#custom#source('omni', 'functions', { 'cs':  'OmniSharp#Complete' })

    " Set how Deoplete filters omnifunc output.
    call deoplete#custom#var('omni', 'input_patterns', {
        \ 'cs': '[^. *\t]\.\w*',
        \})

    " ... then goes your mappings for :OmniSharp* functions, see its doc
endfunction

augroup csharp_commands
    autocmd!

    " Use smartcase.
    " call deoplete#custom#option('smart_case', v:true) 
    autocmd FileType cs call SetCSSettings()

augroup END
