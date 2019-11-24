call plug#begin('~/.config/nvim/plugged')

""" Aesthetics
    Plug 'dracula/vim'
    Plug 'morhetz/gruvbox'
    Plug 'iCyMind/NeoSolarized'
    Plug 'joshdick/onedark.vim'
    Plug 'nightsense/forgotten'
    Plug 'trevordmiller/nova-vim'
    Plug 'zaki/zazen'
    Plug 'rakr/vim-one'
    Plug 'nanotech/jellybeans.vim'
    Plug 'sickill/vim-monokai'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'ryanoasis/vim-devicons'

    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/seoul256.vim'
    Plug 'junegunn/vim-journal'
    Plug 'junegunn/rainbow_parentheses.vim'

    Plug 'sheerun/vim-polyglot'

    Plug 'nightsense/nemo'
    Plug 'yuttie/hydrangea-vim'
    Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
    Plug 'rhysd/vim-color-spring-night'
    Plug 'mhartington/oceanic-next'


""" Functionality

    Plug 'jiangmiao/auto-pairs'     " Auto complete quotes and brackets
    Plug 'scrooloose/nerdcommenter' " Commenter
    Plug 'scrooloose/nerdtree'      " File Tree

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete
    Plug 'davidhalter/jedi-vim'             " Using for goto not completion
    Plug 'zchee/deoplete-jedi'
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

    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
    Plug 'ryanolsonx/vim-lsp-python'

    Plug 'cyansprite/deoplete-omnisharp' , {'do': './install.sh'}

call plug#end()

" Set LEADER first
let mapleader=","

