-- LSP configuration overrides
-- The LazyVim rust extra handles most of the setup; these are refinements.

return {
  -- mason.nvim: automatic installation of LSP servers, formatters, and linters
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "codelldb", -- DAP adapter for Rust
        "taplo", -- TOML LSP
      },
    },
  },

  -- nvim-lspconfig: fine-tune rust-analyzer settings
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              -- Cargo
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                buildScripts = { enable = true },
              },
              -- Diagnostics
              diagnostics = {
                enable = true,
              },
              -- Use clippy for linting on save
              checkOnSave = {
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
              -- Proc macros
              procMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
              -- Inlay hints
              inlayHints = {
                bindingModeHints = { enable = false },
                chainingHints = { enable = true },
                closingBraceHints = { enable = true, minLines = 25 },
                closureReturnTypeHints = { enable = "with_block" },
                lifetimeElisionHints = { enable = "never" },
                maxLength = 25,
                parameterHints = { enable = true },
                reborrowHints = { enable = "never" },
                renderColons = true,
                typeHints = {
                  enable = true,
                  hideClosureInitialization = false,
                  hideNamedConstructor = false,
                },
              },
            },
          },
        },
      },
    },
  },

  -- Rust-specific LSP keybindings (on top of LazyVim defaults)
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- These are additional to LazyVim defaults (gd, gr, K, etc.)
      vim.list_extend(keys, {
        { "<leader>ca", vim.lsp.buf.code_action, desc = "Code action" },
        { "<leader>cr", vim.lsp.buf.rename, desc = "Rename symbol" },
        { "K", vim.lsp.buf.hover, desc = "Hover documentation" },
        { "<leader>cl", "<cmd>LspInfo<cr>", desc = "LSP info" },
      })
    end,
  },
}
