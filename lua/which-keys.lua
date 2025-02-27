local wk = require("which-key")

-- wk.register({
--   f = {
--     name = "file", -- optional group name
--     f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
--     n = { "New File" }, -- just a label. don't create any mapping
--     e = "Edit File", -- same as above
--     ["1"] = "which_key_ignore",  -- special label to hide it in the popup
--     b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
--   },
-- }, { prefix = "<leader>" })

-- Telescope mappings
wk.add({
  { "<leader>f", group = "Telescope" },
  { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find File" },
  { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
  { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
  { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
})

-- Trouble mappings
wk.add({
  { "<leader>x", group = "Trouble" },
  { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Trouble Toggle" },
  { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace Troubles" },
  { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Document Troubles" },
  { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Quickfix" },
})

-- LSP mappings
wk.add({
  { "g", group = "LSP" },
  { "gd", "<cmd>Lspsaga goto_definition<CR>", desc = "Goto Definitions" },
  { "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", desc = "Goto References" },
  { "gi", "<cmd>lua require'telescope.builtin'.lsp_implementations()<CR>", desc = "Goto Implementations" },
  { "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
})

-- LSP-related mappings with <leader> prefix (moved from vim.keymap.set)
wk.add({
  { "<leader>s", group = "LSP Stuff" }, -- New group for organization
  { "<leader>sd", "<cmd>Lspsaga finder def+ref<CR>", desc = "Find Definitions + References" },
  { "<leader>ds", "<cmd>Lspsaga outline<CR>", desc = "Document Outline" },
  { "<leader>rs", "<cmd>Lspsaga rename<CR>", desc = "Rename Symbol" },
})

-- Code actions/format mappings
wk.add({
  { "<leader>c", group = "code actions/format" },
  { "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "Code Action" },
  { "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", desc = "Format Code" },
})

-- Session mappings
wk.add({
  { "<leader>S", group = "Session" },
  { "<leader>Sl", "<cmd>lua require'persistence'.load()<CR>", desc = "Restore session for curdir" },
  { "<leader>Sr", "<cmd>lua require'persistence'.load({ last = true })<CR>", desc = "Restore last session" },
  { "<leader>Ss", "<cmd>lua require'persistence'.stop()<CR>", desc = "Stop persisting sessions" },
})

-- Buffer-specific LSP mappings (keep these separate as they use bufnr)
local bufopts = { noremap = true, silent = true, buffer = bufnr }
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
vim.keymap.set("n", "[e", '<cmd>lua require("lspsaga.diagnostic"):goto_prev({})<CR>', bufopts)
vim.keymap.set("n", "]e", '<cmd>lua require("lspsaga.diagnostic"):goto_next({})<CR>', bufopts)

-- Toggle term (global, not buffer-specific)
vim.keymap.set({ "n", "t" }, "<A-j>", "<cmd>Lspsaga term_toggle<CR>", { noremap = true, silent = true })