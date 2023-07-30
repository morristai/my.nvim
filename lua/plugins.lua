require('lazy').setup({
    -- colorscheme
    'marko-cerovac/material.nvim',
    {
        "catppuccin/nvim",
        name = "catppuccin"
    },
    'ellisonleao/gruvbox.nvim',
    'EdenEast/nightfox.nvim',
    'folke/tokyonight.nvim',
    'rktjmp/lush.nvim',

    -- Post-install/update hook with neovim command
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {
            -- options
        },
    },
    {
        -- the context on the tabline
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            -- configurations go here
        },
    },

    -- cmp
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'hrsh7th/nvim-cmp',     -- Autocompletion plugin
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp

    -- File navigator
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icon
        },
        version = 'nightly'                -- optional, updated every week. (see issue #1193)
    },

    -- fuzzyf
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Surrounds
    {
        "ur4ltz/surround.nvim",
        config = function()
            require "surround".setup { mappings_style = "surround" }
        end
    },

    -- tabline
    {
        'romgrk/barbar.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- toggleterm
    {
        "akinsho/toggleterm.nvim"
    },

    -- autopairs
    {
        'windwp/nvim-autopairs',
    },

    -- gcc
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    },

    -- git blame
    {
        'f-person/git-blame.nvim',
    },

    -- indent blankline
    "lukas-reineke/indent-blankline.nvim",

    -- debugging
    'mfussenegger/nvim-dap',

    { "rcarriga/nvim-dap-ui",            dependencies = { "mfussenegger/nvim-dap" } },

    'simrat39/rust-tools.nvim',

    -- hop
    {
        'phaazon/hop.nvim',
        branch = 'v2', --  but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    },

    -- trouble
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    -- session
    -- Lua
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {}
    },
})
