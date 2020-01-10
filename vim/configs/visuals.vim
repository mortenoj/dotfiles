" (Dark)
function! ColorOne()
    let g:airline_theme=''
    colorscheme onedark
endfunction

" (Dark)
function! ColorNeoSolarized()
    let g:airline_theme=''
    colorscheme onedark
endfunction

" (Dark)
function! ColorNova()
    let g:airline_theme='silver'
    colorscheme nova
endfunction

" (Light)
function! ColorForgotten()
    let g:airline_theme='tomorrow'
    color forgotten-light
endfunction


" Bindings
nmap <leader>ee :Colors<CR>
nmap <leader>ea :AirlineTheme<CR>

nmap <leader>e1 :call ColorOne()<CR>
nmap <leader>e2 :call ColorNova()<CR>
nmap <leader>e3 :call ColorForgotten()<CR>

""" ========================================================
""" Colors
""" ========================================================

" Enable 24bit colors
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on

" Opaque Background (Comment out to use terminal's profile)
set termguicolors
"set notermguicolors "could fix tmux issues

colorscheme onedark

highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none

" Transparent Background (For i3 and compton)
"highlight Normal guibg=NONE ctermbg=NONE
"highlight LineNr guibg=NONE ctermbg=NONE

"let g:airline_theme='onedark'
"let g:airline_theme='badcat'
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
