-- GitHub Copilot: AI-powered code completion.

return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Accept suggestion with Ctrl+a (C-y conflicts with nvim-cmp confirm)
      vim.g.copilot_no_tab_map = true
      vim.keymap.set("i", "<C-a>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
        desc = "Accept Copilot suggestion",
      })
      vim.keymap.set("i", "<C-w>", "<Plug>(copilot-accept-word)", { desc = "Accept Copilot word" })
      vim.keymap.set("i", "<C-]>", "<Plug>(copilot-next)", { desc = "Next Copilot suggestion" })
      vim.keymap.set("i", "<C-[>", "<Plug>(copilot-previous)", { desc = "Previous Copilot suggestion" })
      vim.keymap.set("i", "<C-\\>", "<Plug>(copilot-dismiss)", { desc = "Dismiss Copilot suggestion" })

      -- Disable Copilot for certain filetypes
      vim.g.copilot_filetypes = {
        ["TelescopePrompt"] = false,
        ["DressingInput"] = false,
      }
    end,
  },
}
