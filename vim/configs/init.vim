call plug#begin('~/.config/nvim/plugged')

""" Aesthetics

    Plug 'dracula/vim'
    Plug 'morhetz/gruvbox'
    Plug 'iCyMind/NeoSolarized'
    Plug 'joshdick/onedark.vim'
    Plug 'nightsense/forgotten'
    Plug 'trevordmiller/nova-vim'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'ryanoasis/vim-devicons'

    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/vim-journal'
    Plug 'junegunn/rainbow_parentheses.vim'

""" Functionality

    Plug 'jiangmiao/auto-pairs'     " Auto complete quotes and brackets
    Plug 'scrooloose/nerdcommenter' " Commenter
    Plug 'scrooloose/nerdtree'      " File Tree

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete
    Plug 'davidhalter/jedi-vim'             " Using for goto not completion
    Plug 'zchee/deoplete-jedi'

    "Plug 'neoclide/coc.nvim', {'branch': 'release'} " Might be a better deoplete
    Plug 'JamshedVesuna/vim-markdown-preview' " Markdown viewer

    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'

    Plug 'sbdchd/neoformat'                 " Formatter
    Plug 'terryma/vim-multiple-cursors'     " Multiple cursors
    Plug 'machakann/vim-highlightedyank'    " Highlight yanked lines
    Plug 'dense-analysis/ale'               " Code checker
    Plug 'ervandew/supertab'                " Tab for autocompletion
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'majutsushi/tagbar'
    Plug 'junegunn/vim-easy-align'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'Yggdroot/indentLine'
    Plug 'vim-scripts/indentpython.vim'
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'tpope/vim-fugitive'

    Plug 'ryanolsonx/vim-lsp-python'

    Plug 'cyansprite/deoplete-omnisharp' , {'do': './install.sh'}

    Plug 'sheerun/vim-polyglot' " Language support (formatting)

    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }


call plug#end()

" Set LEADER first
let mapleader=","

