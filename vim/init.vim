""" ========================================================
""" Load Plugins
""" ========================================================
call plug#begin('~/.config/nvim/plugged')

    """============== Visual plugins ==============

    """ Color schemes
    Plug 'joshdick/onedark.vim'
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    Plug 'kyoz/purify', { 'rtp': 'vim' }

    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

    Plug 'windwp/nvim-autopairs'

    """ Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    """ Icons

    Plug 'ryanoasis/vim-devicons'

    """ Color color values in files
    Plug 'norcalli/nvim-colorizer.lua'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-context'

    """============== Functional plugins ==============

    " Markdown preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

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

    Plug 'nvim-lua/plenary.nvim'
    Plug 'TimUntersberger/neogit'
    Plug 'sindrets/diffview.nvim'
    " for diffview: vim-devicons with colors
    Plug 'nvim-tree/nvim-web-devicons'

    Plug 'lewis6991/gitsigns.nvim'

    " Search and replace tool
    Plug 'nvim-pack/nvim-spectre'


    Plug 'tpope/vim-repeat'

    " Visualize indenting
    Plug 'lukas-reineke/indent-blankline.nvim'

    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
    " FZF sorting plugin for telescope
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-telescope/telescope-github.nvim'
    Plug 'nvim-telescope/telescope-symbols.nvim'

    " Literaly just for :Bdelete hidden
    " TODO: replace with Telescope keybindings
    Plug 'Asheq/close-buffers.vim'

    " For make in vim
    Plug 'tpope/vim-dispatch'

    " SQL manager
    Plug 'tpope/vim-dadbod'
    Plug 'kristijanhusak/vim-dadbod-ui'

    " Quick navigation
    Plug 'rlane/pounce.nvim'

    """============== Language plugins ==============

    " Multi language support
    Plug 'sheerun/vim-polyglot'

    " Typescript
    Plug 'HerringtonDarkholme/yats.vim'

    Plug 'pangloss/vim-javascript'

    " Generatl commenting plugin
    Plug 'terrortylor/nvim-comment'
    " Commenting based on context (e.g. html, JSX)
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'

    """==================== Misc ===================
    Plug 'seandewar/nvimesweeper'
call plug#end()

" manual install for golang-ci-lint server
" go get github.com/nametake/golangci-lint-langserver


set termguicolors
