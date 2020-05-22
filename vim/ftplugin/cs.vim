let b:ale_linters = ['OmniSharp']
let b:ale_fixers = ['uncrustify']

setlocal omnifunc=OmniSharp#Complete

nnoremap gd :OmniSharpGotoDefinition<CR>
nnoremap <Leader>fi :OmniSharpFindImplementations<CR>
nnoremap <Leader>fs :OmniSharpFindSymbol<CR>
nnoremap <Leader>fu :OmniSharpFindUsages<CR>
nnoremap <Leader>fm :OmniSharpFindMembers<CR>

call deoplete#custom#option('omni_patterns', {
\   'cs': '[^. *\t]\.\w*',
\})
