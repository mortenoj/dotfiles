local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.config/nvim/plugged")

------------ Visual plugins ------------
--  Color schemes
Plug('joshdick/onedark.vim')
Plug('sonph/onehalf', { ["rtp"] =  "vim/" })
Plug('kyoz/purify', { ["rtp"] =  "vim" })

Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })

Plug('windwp/nvim-autopairs')

-- Airline
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')

-- Icons

Plug('ryanoasis/vim-devicons')

-- Color color-values in files
Plug('norcalli/nvim-colorizer.lua')

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('nvim-treesitter/nvim-treesitter-context')

----------------- Functional plugins -----------------

-- Inelisense for VIM
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })

Plug('github/copilot.vim')
Plug('CopilotC-Nvim/CopilotChat.nvim') -- requires plenery and copilot

-- Surround
Plug('tpope/vim-surround')

Plug('vifm/vifm.vim')

-- Filetree
Plug('preservim/nerdtree')

-- Git plugins
Plug('tpope/vim-fugitive')
Plug('neoclide/vim-easygit')

Plug('nvim-lua/plenary.nvim')
Plug('TimUntersberger/neogit')
Plug('sindrets/diffview.nvim')

-- for diffview: vim-devicons with colors
Plug('nvim-tree/nvim-web-devicons')

Plug('lewis6991/gitsigns.nvim')

-- Search and replace tool
Plug('nvim-pack/nvim-spectre')

-- Lua completions for NVIM config
Plug('folke/lazydev.nvim')

Plug('tpope/vim-repeat')

-- Visualize indenting
Plug('lukas-reineke/indent-blankline.nvim')

Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.x' })
-- FZF sorting plugin for telescope
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug('nvim-telescope/telescope-github.nvim')
Plug('nvim-telescope/telescope-symbols.nvim')

-- Literaly just for :Bdelete hidden
-- TODO: replace with Telescope keybindings
Plug('Asheq/close-buffers.vim')

-- For make in vim
Plug('tpope/vim-dispatch')

-- Quick navigation
Plug('rlane/pounce.nvim')

-- Experimental UI for cmd line and messages
Plug('folke/noice.nvim')
Plug('MunifTanjim/nui.nvim')

----------------- Language plugins -----------------

-- Multi language support
Plug('sheerun/vim-polyglot')

-- Typescript
Plug('HerringtonDarkholme/yats.vim')

Plug('pangloss/vim-javascript')

-- TODO: try out 'folke/ts-comments.nvim'
-- General commenting plugin
Plug('numToStr/Comment.nvim')
-- Commenting based on context (e.g. html, JSX)
Plug('JoosepAlviste/nvim-ts-context-commentstring')

-------------------- Misc -------------------
Plug('seandewar/nvimesweeper')
vim.call("plug#end")
