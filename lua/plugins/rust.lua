-- Rust-specific plugins and keybindings beyond what the LazyVim extras provide.

return {
  -- crates.nvim: manage Cargo.toml dependencies inline
  -- (installed by LazyVim rust extra; these are keybinding additions)
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    keys = {
      { "<leader>rcu", function() require("crates").upgrade_all_crates() end, desc = "Upgrade all crates" },
      { "<leader>rcU", function() require("crates").update_all_crates() end, desc = "Update all crates" },
      { "<leader>rci", function() require("crates").show_crate_popup() end, desc = "Crate info" },
      { "<leader>rcv", function() require("crates").show_versions_popup() end, desc = "Crate versions" },
      { "<leader>rcf", function() require("crates").show_features_popup() end, desc = "Crate features" },
      { "<leader>rcd", function() require("crates").show_dependencies_popup() end, desc = "Crate dependencies" },
    },
  },

  -- Rustaceanvim: enhanced Rust support (hover actions, runnables, etc.)
  -- This is included by the LazyVim rust extra; these are keybinding additions.
  {
    "mrcjkb/rustaceanvim",
    keys = {
      { "<leader>re", "<cmd>RustLsp expandMacro<cr>", desc = "Expand macro", ft = "rust" },
      { "<leader>rr", "<cmd>RustLsp runnables<cr>", desc = "Runnables", ft = "rust" },
      { "<leader>rd", "<cmd>RustLsp debuggables<cr>", desc = "Debuggables", ft = "rust" },
      { "<leader>rm", "<cmd>RustLsp parentModule<cr>", desc = "Parent module", ft = "rust" },
      { "<leader>rj", "<cmd>RustLsp joinLines<cr>", desc = "Join lines", ft = "rust" },
      { "<leader>rh", "<cmd>RustLsp hover actions<cr>", desc = "Hover actions", ft = "rust" },
      { "<leader>rc", "<cmd>RustLsp openCargo<cr>", desc = "Open Cargo.toml", ft = "rust" },
      { "<leader>rg", "<cmd>RustLsp crateGraph<cr>", desc = "Crate graph", ft = "rust" },
      { "<leader>rt", "<cmd>RustLsp testables<cr>", desc = "Testables", ft = "rust" },
      { "<leader>rp", "<cmd>RustLsp rebuildProcMacros<cr>", desc = "Rebuild proc macros", ft = "rust" },
    },
  },
}
