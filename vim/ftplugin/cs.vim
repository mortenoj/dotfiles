" Deoplete omnisharp settings for c# completion
"let g:deoplete_omnisharp_exe_path = '~/.config/nvim/plugged/deoplete-omnisharp/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe'
"let g:deoplete_omnisharp_port = get(g:, "deoplete_omnisharp_port", 9999)

setlocal omnifunc=OmniSharp#Complete

nnoremap gd :OmniSharpGotoDefinition<CR>
nnoremap <Leader>fi :OmniSharpFindImplementations<CR>
nnoremap <Leader>fs :OmniSharpFindSymbol<CR>
nnoremap <Leader>fu :OmniSharpFindUsages<CR>
nnoremap <Leader>fm :OmniSharpFindMembers<CR>


"call deoplete#custom#option('sources', {
    "\ 'cs': ['omnisharp'],
    "\})
"let g:deoplete#sources = {}
"let g:deoplete#sources._ = ['buffer', 'ultisnips', 'file', 'dictionary', 'neco-syntax', 'deoplete-tabnine']
"let g:deoplete#sources.cs = ['omni', 'file', 'buffer', 'ultisnips']

"let g:deoplete#omni_patterns = {
"\   'cs': ['*']
"\}

call deoplete#custom#option('omni_patterns', {
\   'cs': '[^. *\t]\.\w*',
\})

