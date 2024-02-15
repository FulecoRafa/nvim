-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Navigation
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { { 'nvim-tree/nvim-web-devicons' } }
    }

    use {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    }

    use {
        "chentoast/marks.nvim",
        config = function ()
            require'marks'.setup{}
        end
    }

    -- Themes
    use 'kyazdani42/nvim-web-devicons'
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use 'Shatur/neovim-ayu'
    use "catppuccin/nvim"

    -- Syntax highlight
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use {
        'nvim-treesitter/playground',
        requires = { { 'nvim-treesitter/nvim-treesitter' } }
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use "lukas-reineke/indent-blankline.nvim"

    -- Editor aux
    use 'mbbill/undotree'
    use {
        'tomiis4/hypersonic.nvim',
        config = function()
            require('hypersonic').setup()
        end
    }
    use { 'numToStr/Comment.nvim' }
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            { "jay-babu/mason-nvim-dap.nvim" },      -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
    use({
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    })
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use { 'leoluz/nvim-dap-go', requires = { "mfussenegger/nvim-dap" } }
    use { 'mfussenegger/nvim-jdtls', requires = { "mfussenegger/nvim-dap" } }
    use { 'simrat39/rust-tools.nvim', requires = { "mfussenegger/nvim-dap" } }
    use { 'mxsdev/nvim-dap-vscode-js', requires = { "mfussenegger/nvim-dap" } }


    -- Rust
    use {
        'saecki/crates.nvim',
        tag = 'v0.3.0',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    }

    -- Go
    use {
        "olexsmir/gopher.nvim",
        requires = { -- dependencies
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    }

    -- Markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use("ixru/nvim-markdown")

    -- Git
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
    use {
        "FabijanZulj/blame.nvim",
        config = function()
            require('blame').setup()
        end,
    }

    -- Extra
    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }
end)
