""" ========================================================
""" Load Plugins
""" ========================================================
call plug#begin('~/.config/nvim/plugged')

    """============== Visual plugins ==============

    """ Color schemes
    Plug 'joshdick/onedark.vim'
    Plug 'trevordmiller/nova-vim'
    Plug 'liuchengxu/space-vim-theme'

    """ Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    """ Icons
    Plug 'ryanoasis/vim-devicons'


    """============== Functional plugins ==============

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Auto completer
    Plug 'jiangmiao/auto-pairs'             " Auto complete quotes and brackets
    Plug 'scrooloose/nerdcommenter'         " Commenter
    Plug 'scrooloose/nerdtree'              " File Tree
    Plug 'sbdchd/neoformat'                 " Formatter
    Plug 'tpope/vim-fugitive'               " Git commands
    Plug 'dense-analysis/ale'               " Code checker
    Plug 'sheerun/vim-polyglot'             " Language support (formatting)
    Plug 'Yggdroot/indentLine'              " Indent lines
    Plug 'machakann/vim-highlightedyank'    " Highlight yanked lines
    Plug '/usr/local/opt/fzf'               " Required by fzf.vim
    Plug 'junegunn/fzf.vim'                 " Fuzzy file finder
    Plug 'ervandew/supertab'                " Tab for autocompletion

    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }


    """============== Language plugins ==============

    Plug 'zchee/deoplete-jedi'
    Plug 'zchee/deoplete-clang'
    "Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Golang support

call plug#end()

