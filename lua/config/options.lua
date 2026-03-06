-- Neovim options
-- LazyVim sets sensible defaults; these are overrides/additions.

local opt = vim.opt

-- General
opt.confirm = true -- Confirm before closing unsaved buffers
opt.autowrite = true -- Auto-save before commands like :next
opt.clipboard = "unnamedplus" -- System clipboard integration
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 0 -- Show text normally (no concealing)
opt.mouse = "a" -- Enable mouse in all modes

-- UI
opt.number = true -- Line numbers
opt.relativenumber = true -- Relative line numbers
opt.signcolumn = "yes" -- Always show sign column
opt.cursorline = true -- Highlight current line
opt.termguicolors = true -- True color support
opt.showmode = false -- Don't show mode (statusline handles it)
opt.pumheight = 10 -- Max completion popup height
opt.scrolloff = 8 -- Lines of context above/below cursor
opt.sidescrolloff = 8 -- Columns of context left/right of cursor
opt.splitbelow = true -- Horizontal splits open below
opt.splitright = true -- Vertical splits open right
opt.wrap = false -- No line wrapping

-- Search
opt.ignorecase = true -- Case-insensitive search
opt.smartcase = true -- ...unless uppercase is used
opt.hlsearch = true -- Highlight search results
opt.incsearch = true -- Incremental search

-- Indentation
opt.expandtab = true -- Spaces instead of tabs
opt.shiftwidth = 4 -- Indent size (Rust convention)
opt.tabstop = 4 -- Tab display width
opt.softtabstop = 4 -- Tab editing width
opt.smartindent = true -- Context-aware indentation

-- Files
opt.undofile = true -- Persistent undo
opt.undolevels = 10000 -- Maximum undo levels
opt.swapfile = false -- No swap files (use undo instead)
opt.backup = false -- No backup files
opt.writebackup = false -- No write-backup

-- Performance (helps over SSH)
opt.updatetime = 200 -- Faster CursorHold events
opt.timeoutlen = 300 -- Faster key sequence timeout (which-key appears faster)
opt.lazyredraw = false -- Don't set true; breaks noice.nvim
opt.ttyfast = true -- Fast terminal connection
