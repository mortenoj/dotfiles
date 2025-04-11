------------- General settings -------------

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- NB: set background=dark
vim.opt.background = "dark"

vim.opt.number = true

-- vim.opt.lazyredraw=true
-- vim.opt.re = 0

vim.opt.cursorline = false
vim.opt.cursorcolumn = false
vim.opt.relativenumber = false

vim.opt.ruler = true

-- set completeopt=longest,menuone,preview
-- set completeopt-=preview
vim.opt.completeopt = { "menu", "preview" }

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.fillchars.vert = "\\"

vim.opt.wrap = true
vim.opt.breakindent = true

vim.opt.title = true
vim.opt.visualbell = true
vim.opt.errorbells = false

vim.opt.linebreak = true

vim.opt.guifont = "MesloLGS Nerd Font Mono:h11"

vim.opt.clipboard = "unnamed"

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true

-- disable mouse mode
vim.opt.mouse = ""

-------------- Theme & Colors --------------

vim.opt.termguicolors = true
vim.cmd("syntax on")

-- default colors I guess?
vim.cmd([[
highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none
highlight Normal ctermfg=12 ctermbg=8 cterm=NONE
highlight HighlightedyankRegion term=bold ctermbg=0 guibg=#555555
]])

-- TODO: remove ?
vim.cmd([[
autocmd BufEnter *.ts :setlocal filetype=typescript
autocmd BufEnter *.js :setlocal filetype=javascript

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd BufNewFile,BufRead .eslintrc set filetype=javascript

" trigger autoread when changing buffers inside while inside vim:
au FocusGained,BufEnter * :checktime
]])
