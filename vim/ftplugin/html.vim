let b:ale_linters = ['prettier']
let b:ale_fixers = ['prettier']

autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html inoremap {{ {{  }}<left><left><left>
autocmd FileType html inoremap {% {%  %}<left><left><left>
autocmd FileType html inoremap {# {#  #}<left><left><left>
