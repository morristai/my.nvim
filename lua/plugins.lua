return {
    { "github/copilot.vim" }, -- GitHub Copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = true, auto_trigger = true },
                panel = { enabled = false },
            })
        end,
    },
    -- {
    --     "CopilotC-Nvim/CopilotChat.nvim",
    --     branch = "canary",
    --     dependencies = {
    --         { "zbirenbaum/copilot.lua" },
    --         { "nvim-lua/plenary.nvim" },
    --     },
    --     config = function()
    --         require("CopilotChat").setup()
    --     end,
    -- },

    -- Todo comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = true,
            keywords = {
                FIX = { icon = " ", color = "error" },
                TODO = { icon = " ", color = "info" },
                HACK = { icon = " ", color = "warning" },
                WARN = { icon = " ", color = "warning" },
                PERF = { icon = "󰅒 ", color = "hint" },
                NOTE = { icon = "󰍩 ", color = "hint" },
            },
        },
    },

    -- Notifications
    { "rcarriga/nvim-notify", opts = { timeout = 3000, stages = "fade" } },

    -- Colorschemes
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "oxfist/night-owl.nvim", name = "night-owl" },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "rust", "c", "cpp", "go", "python" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },

    -- LSP
    { "williamboman/mason.nvim", opts = {} },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        opts = { text = { spinner = "dots" } },
    },
    {
        "nvimdev/lspsaga.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        opts = {
            lightbulb = { enable = false },
            symbol_in_winbar = { enable = true },
        },
    },

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-vsnip",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = { expand = function(args) vim.fn["vsnip#anonymous"](args.body) end },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "vsnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    },

    -- File navigation
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = { view = { width = 30 } },
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { defaults = { layout_strategy = "vertical" } },
    },

    -- Surround
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {},
    },

    -- Tabline
    {
        "romgrk/barbar.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        opts = { open_mapping = [[<C-\>]], direction = "float" },
    },

    -- Autopairs
    { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

    -- Comments
    { "numToStr/Comment.nvim", opts = {} },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = { options = { theme = "catppuccin" } },
    },

    -- Git
    { "f-person/git-blame.nvim", opts = { enabled = true } },

    -- Indentation
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- Debugging
    { "mfussenegger/nvim-dap" },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        opts = {},
    },
    { "simrat39/rust-tools.nvim" },

    -- Motion
    {
        "phaazon/hop.nvim",
        branch = "v2",
        opts = { keys = "etovxqpdygfblzhckisuran" },
    },

    -- Diagnostics
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },

    -- Keybindings
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },

    -- Sessions
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {},
    },
}