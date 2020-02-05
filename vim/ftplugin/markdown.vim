""" ========================================================
""" Markdown viewer 
""" ========================================================

let vim_markdown_preview_github=1
let g:vim_markdown_preview_browser="Google Chrome"

autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

