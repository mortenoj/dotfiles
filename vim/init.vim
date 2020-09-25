""" ========================================================
""" Load Plugins
""" ========================================================
call plug#begin('~/.config/nvim/plugged')

    """============== Visual plugins ==============

    """ Color schemes
    Plug 'joshdick/onedark.vim'
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    Plug 'kyoz/purify', { 'rtp': 'vim' }


    """ Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    """ Icons
    Plug 'ryanoasis/vim-devicons'


    """============== Functional plugins ==============

    " Inelisense for VIM
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Surround
    Plug 'tpope/vim-surround'

    Plug 'vifm/vifm.vim'

    " Filetree
    Plug 'preservim/nerdtree'

    " Git plugins
    Plug 'tpope/vim-fugitive'
    Plug 'neoclide/vim-easygit'

    Plug 'tmux-plugins/vim-tmux-focus-events'

    " Code checker
    Plug 'dense-analysis/ale'

    " Visualize indenting
    Plug 'Yggdroot/indentLine'

    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

    " For make in vim
    Plug 'tpope/vim-dispatch'


    """============== Language plugins ==============

    " Multi language support
    Plug 'sheerun/vim-polyglot'

    " Typescript
    Plug 'HerringtonDarkholme/yats.vim'

    Plug 'pangloss/vim-javascript'

    " Commenting based on context (JSX)
    Plug 'tyru/caw.vim'
    Plug 'Shougo/context_filetype.vim'
call plug#end()
