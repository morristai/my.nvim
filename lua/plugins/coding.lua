-- Coding plugins: completion, snippets, formatting, and editing helpers.

return {
  -- nvim-cmp: autocompletion engine (configured by LazyVim, these are overrides)
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping or {}, {
        -- Explicit confirm with Enter
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        -- Tab/S-Tab to navigate completion menu
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      })
      -- Prioritize LSP and path sources for Rust
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "path", priority = 750 },
        { name = "luasnip", priority = 500 },
        { name = "crates", priority = 450 },
      }, {
        { name = "buffer", priority = 250 },
      })
      return opts
    end,
  },

  -- conform.nvim: formatting (LazyVim configures rustfmt via the Rust extra)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        rust = { "rustfmt" },
        toml = { "taplo" },
      },
      -- Format on save
      format_on_save = {
        timeout_ms = 3000,
        lsp_format = "fallback",
      },
    },
  },

  -- nvim-autopairs: auto-close brackets, parens, quotes
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true, -- Use Treesitter for smarter pairing
      fast_wrap = {
        map = "<M-e>", -- Alt+e to wrap with pairs
      },
    },
  },

  -- Comment.nvim: toggle comments with gc/gcc
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- mini.surround: add/delete/change surrounding pairs (sa, sd, sr)
  {
    "nvim-mini/mini.surround",
    opts = {
      mappings = {
        add = "sa", -- Add surrounding
        delete = "sd", -- Delete surrounding
        replace = "sr", -- Replace surrounding
        find = "sf", -- Find surrounding (right)
        find_left = "sF", -- Find surrounding (left)
        highlight = "sh", -- Highlight surrounding
        update_n_lines = "sn", -- Update n_lines
      },
    },
  },
}
