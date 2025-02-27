------------
-- Default settings and keymaps
------------
local set = vim.opt

-- Your existing settings with some additions/optimizations
vim.o.shiftwidth = 4
vim.o.showmatch = true
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.lazyredraw = true
vim.o.showmode = false -- Changed to false since statusline typically shows mode
vim.o.ignorecase = true
vim.o.smartcase = true -- Added: case-sensitive if search contains uppercase
vim.o.ruler = true
vim.o.relativenumber = true
vim.o.number = true -- Added to complement relativenumber
vim.o.updatetime = 250
vim.o.breakindent = true
vim.o.mouse = 'a'
vim.o.completeopt = 'menu,menuone,noselect' -- Slightly optimized
vim.o.scrolloff = 8 -- Added: keep 8 lines visible above/below cursor
vim.o.sidescrolloff = 8 -- Added: keep 8 columns visible left/right
vim.o.undofile = true -- Added: persistent undo
vim.o.swapfile = false -- Added: disable swap files

vim.wo.signcolumn = 'yes:2' -- Enhanced: allow 2 columns for signs

set.expandtab = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

local function map(mode, lhs, rhs, opts)
    local options = {
        silent = true
    }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

------------
-- Keymaps
------------
-- Navigation improvements
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", {
    expr = true
})
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", {
    expr = true
})
map('n', '[b', '<cmd>BufferPrevious<CR>', {
    desc = "Previous buffer"
})
map('n', ']b', '<cmd>BufferNext<CR>', {
    desc = "Next buffer"
})
map('n', '<leader>bd', '<cmd>BufferClose<CR>', {
    desc = "Close buffer"
})

-- Search and highlights
map({"i", "n"}, "<esc>", "<cmd>noh<CR><esc>", {
    desc = "Clear highlights"
})
map('n', '<leader>/', ': Telescope live_grep<CR>', {
    desc = "Search project"
})

-- windows
map('n', '<C-h>', '<C-w>h', {})
map('n', '<C-j>', '<C-w>j', {})
map('n', '<C-k>', '<C-w>k', {})
map('n', '<C-l>', '<C-w>l', {})
map('n', '<leader>wh', '<cmd>wincmd H<CR>', {
    desc = "Move window left"
})
map('n', '<leader>wj', '<cmd>wincmd J<CR>', {
    desc = "Move window down"
})
map('n', '<leader>wk', '<cmd>wincmd K<CR>', {
    desc = "Move window up"
})
map('n', '<leader>wl', '<cmd>wincmd L<CR>', {
    desc = "Move window right"
})
map('n', '<leader>w=', '<cmd>wincmd =<CR>', {
    desc = "Equalize windows"
})

-- Quick access
map('n', '<leader>e', ':NvimTreeToggle<CR>', {
    desc = "Toggle file explorer"
})
map('n', '<leader>ff', ':Telescope find_files<CR>', {
    desc = "Find files"
})
map('n', '<leader>fb', ':Telescope buffers<CR>', {
    desc = "Find buffers"
})

-- Terminal
map('t', '<Esc>', '<C-\\><C-n>', {
    desc = "Exit terminal mode"
})
map('n', '<leader>t', ':terminal<CR>', {
    desc = "Open terminal"
})

-- Hop configuration
local hop = require('hop')
local directions = require('hop.hint').HintDirection
map('', 'f', function()
    hop.hint_char1({
        direction = directions.AFTER_CURSOR,
        current_line_only = true
    })
end, {
    remap = true
})
map('', 'F', function()
    hop.hint_char1({
        direction = directions.BEFORE_CURSOR,
        current_line_only = true
    })
end, {
    remap = true
})
map('n', '<leader>s', function()
    hop.hint_words({})
end, {
    desc = "Hop to word"
})

-- Diagnostics
map('n', '<leader>dk', vim.diagnostic.goto_prev, {
    desc = "Previous diagnostic"
})
map('n', '<leader>dj', vim.diagnostic.goto_next, {
    desc = "Next diagnostic"
})
map('n', '<leader>dd', vim.diagnostic.open_float, {
    desc = "Show diagnostic"
})

--------------------
-- Startup commands
--------------------
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "startinsert",
    desc = "Start terminal in insert mode"
})

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 200
        })
    end,
    desc = "Highlight yanked text"
})
