-- GitHub Copilot: AI-powered code completion.

return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Accept suggestion with Ctrl+y (avoids conflict with nvim-cmp's Tab)
      vim.g.copilot_no_tab_map = true
      vim.keymap.set("i", "<C-y>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
        desc = "Accept Copilot suggestion",
      })
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
