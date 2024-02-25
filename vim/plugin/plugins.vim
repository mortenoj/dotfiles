
""" =========================================================================
""" =============================== Autopairs ===============================
""" =========================================================================
lua << EOF
require("nvim-autopairs").setup {
    disable_filetype = { },
}
EOF

""" =========================================================================
""" =============================== Telescope ===============================
""" =========================================================================

lua << EOF
require('telescope').setup()
require('telescope').load_extension('gh')
require('telescope').load_extension('fzf')
require("telescope").load_extension("emoji")
EOF

""" =========================================================================
""" ============================== TreeSitter ===============================
""" =========================================================================

lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { 'json', 'lua', 'vim' },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,

    -- context aware commenting from 'nvim-ts-context-commentstring'
    context_commentstring = {
        enable = true
    }
  },
}
EOF

""" =========================================================================
""" ============================= nvim-comment ==============================
""" =========================================================================

lua <<EOF
require'nvim_comment'.setup {
    -- Linters prefer comment and line to have a space in between markers
    marker_padding = true,
    -- should comment out empty or whitespace only lines
    comment_empty = true,
    -- trim empty comment whitespace
    comment_empty_trim_whitespace = true,
    -- Should key mappings be created
    -- Keybindings are defined in Keybindings.vim
    create_mappings = false,
    -- Hook function to call before commenting takes place
    hook = function()
        -- make sure ts_context_commentstring is inserting context based on
        -- cursor position
        require("ts_context_commentstring.internal").update_commentstring()
    end
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

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
