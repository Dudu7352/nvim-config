:set tabstop=4
:set shiftwidth=4
:set expandtab

call plug#begin()

Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'navarasu/onedark.nvim'
Plug 'folke/tokyonight.nvim', {'branch': 'main'}

call plug#end()

colorscheme tokyonight-night

:source ~/.config/nvim/tree.lua
