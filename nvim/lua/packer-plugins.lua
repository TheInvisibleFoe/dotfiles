return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- Stuff I genrally use
    use 'preservim/nerdtree'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    -- use 'vim-airline/vim-airline'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use 'ryanoasis/vim-devicons'
    use "lukas-reineke/indent-blankline.nvim"
    use { 'kaarmu/typst.vim', ft = { 'typst' } }
    -- Color Schemes
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use 'gruvbox-community/gruvbox'
    use 'rafi/awesome-vim-colorschemes'
    use 'ayu-theme/ayu-vim'
    use "rebelot/kanagawa.nvim"
    use "marko-cerovac/material.nvim"
    use "sainnhe/edge"
    use { "catppuccin/nvim", as = 'catppuccin' }
    -- For LaTeX
    use 'lervag/vimtex'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- LSPs and Autocompletion config
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
end)
