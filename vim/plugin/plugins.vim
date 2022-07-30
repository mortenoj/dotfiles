
""" =========================================================================
""" ============================== TreeSitter ===============================
""" =========================================================================

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

""" =========================================================================
""" ================================ CocVim =================================
""" =========================================================================
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-java',
    \ 'coc-tsserver',
    \ 'coc-prettier',
    \ 'coc-eslint',
    \ 'coc-emmet',
    \ 'coc-json',
    \ 'coc-snippets',
    \ 'coc-ultisnips',
    \ 'coc-go',
    \ 'coc-clangd',
    \ 'coc-pyright',
    \ 'coc-markdownlint',
    \ 'coc-omnisharp',
    \ 'coc-yaml',
    \ 'coc-yank',
    \ 'coc-xml',
    \ 'coc-pairs',
    \ 'coc-diagnostic',
    \ 'coc-vimtex',
    \ 'coc-sh',
    \ 'coc-kotlin',
    \ 'coc-db',
    \ 'coc-html',
    \ 'coc-eslint',
\ ]

" auto import for Golang
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" From CocVim recommended settings

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

""" =========================================================================
""" =============================== NERDTree ================================
""" =========================================================================
let g:NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'
let g:NERDTreeIgnore = ['\.meta$', '^node_modules$', '^__pycache__$', '^__snapshots__$']

" Open NERDTree on vim enter
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim with q when NERDtree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeQuitOnOpen = 1

""" =========================================================================
""" ================================== CLAP =================================
""" =========================================================================

let g:clap_layout = { 'relative': 'editor' }
" let g:clap_theme = 'material_design_dark'
" let g:clap_background_shadow_blend = 100
let g:clap_enable_background_shadow = v:false

let g:clap_theme = ''
let g:clap_popup_input_delay = 0
let g:clap_provider_grep_delay = 0
let g:clap_provider_grep_opts = ''
let g:clap_disable_run_rooter=v:true

""" =========================================================================
""" ============================ Neovim Terminal ============================
""" =========================================================================
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert


""" =========================================================================
""" ================================ EasyGit ================================
""" =========================================================================
let g:easygit_enable_command = 0


""" =========================================================================
""" ================================ VimTex =================================
""" =========================================================================
let g:vimtex_view_general_viewer = 'skim'
let g:vimtex_view_skim_activate = 1

" TOC settings
let g:vimtex_toc_config = {
    \ 'name': 'Table of contents (vimtex)',
    \ 'mode': 2,
    \ 'split_width': 50,
    \ 'show_help': 0,
    \ 'tocdepth': 2,
    \ }



""" =========================================================================
""" ================================ DadBod =================================
""" =========================================================================

let g:db_ui_winwidth = 30


""" =========================================================================
""" ============================ nvim-colorizer =============================
""" =========================================================================
lua require'colorizer'.setup { '*'; css = { rgb_fn = true; }; html = { names = false; } }

""" =========================================================================
""" ================================ pounce =================================
""" =========================================================================
nmap s <cmd>Pounce<CR>
nmap S <cmd>PounceRepeat<CR>
vmap s <cmd>Pounce<CR>
omap gs <cmd>Pounce<CR>  " 's' is used by vim-surround
