syntax on

""" ========================================================
""" Colors
""" ========================================================

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none

highlight Normal ctermfg=12 ctermbg=8 cterm=NONE

let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''

set background=dark

colorscheme purify

let g:airline_theme='onehalfdark'

" ALE
highlight ALEWarning ctermbg=DarkMagenta

:function LightMode()
    colorscheme onehalflight
    set background=light
:endfunction

:function DarkMode()
    " colorscheme onehalfdark
    colorscheme purify
    set background=dark
:endfunction

hi HighlightedyankRegion term=bold ctermbg=0 guibg=#555555
