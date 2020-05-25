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

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'scrooloose/nerdcommenter'         " Commenter
    Plug 'scrooloose/nerdtree'              " File Tree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin'      " GIT status in nerdtree

    Plug 'tpope/vim-fugitive'               " Git commands
    Plug 'dense-analysis/ale'               " Code checker
    Plug 'Yggdroot/indentLine'              " Indent lines
    Plug '/usr/local/opt/fzf'               " Required by fzf.vim
    Plug 'junegunn/fzf.vim'                 " Fuzzy file finder

    "Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

    Plug 'tpope/vim-dispatch' " Make

    Plug 'christoomey/vim-tmux-navigator'


    """============== Language plugins ==============

    Plug 'sheerun/vim-polyglot'             " Language support (formatting)

    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Golang support

    Plug 'HerringtonDarkholme/yats.vim'
call plug#end()
