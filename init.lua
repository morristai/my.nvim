-- Disable built-in netrw in favor of nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable 24-bit RGB colors
vim.opt.termguicolors = true

-- Lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- init.lua
-- Set leader keys before anything else
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Load plugin and configuration files
require("lazy").setup("plugins")
require("core")
require("init-tree")
require("init-treesitter")
require("init-lualine")
require("init-autopairs")
require("init-session")
require("init-dap")
require("init-rust")
require("init-colorscheme")
require("init-lsp")
require("init-cmp")
require("which-keys")

-- General settings
vim.opt.clipboard = "unnamedplus" -- Sync clipboard with system
vim.cmd.colorscheme("catppuccin") 

-- Auto-formatting with LSP on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.lua", "*.rs", "*.c", "*.cpp", "*.h", "*.hpp", "*.go", "*.py" },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

-- Optional: Improve performance for large files
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
