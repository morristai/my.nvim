# LazyVim Rust IDE Configuration

A modular Neovim configuration built on [LazyVim](https://www.lazyvim.org/) and optimized for Rust development. Designed to work seamlessly both locally and over SSH.

## Prerequisites

- **Neovim** >= 0.11.2
- **Git** >= 2.19.0
- **Rust toolchain** (`rustup`, `cargo`, `rustfmt`, `clippy`)
- **ripgrep** (`rg`) — required by Telescope live grep
- **fd** — faster file finding for Telescope (optional but recommended)
- A **Nerd Font** — for icons (optional; degrade gracefully without one)
- **C compiler** (`gcc`/`clang`) — for telescope-fzf-native and treesitter parsers

## Installation

```bash
# Back up existing config if needed
mv ~/.config/nvim ~/.config/nvim.bak

# Symlink or copy this directory
ln -s /path/to/vim-setup ~/.config/nvim

# Launch Neovim — plugins install automatically on first run
nvim
```

On a remote VM, just clone this repo and symlink. No Node.js or external runtimes required.

## Directory Structure

```
.
├── init.lua                    # Entry point — bootstraps lazy.nvim
├── lua/
│   ├── config/
│   │   ├── lazy.lua            # lazy.nvim setup, plugin spec loading, LazyVim extras
│   │   ├── options.lua         # Neovim options (indentation, UI, search, etc.)
│   │   ├── keymaps.lua         # Custom keybindings (leader = Space)
│   │   └── autocmds.lua        # Autocommands (yank highlight, Rust filetype settings)
│   └── plugins/
│       ├── editor.lua          # Telescope, which-key, outline, trouble, gitsigns
│       ├── lsp.lua             # Mason, rust-analyzer settings, LSP keybindings
│       ├── coding.lua          # Completion (nvim-cmp), formatting, autopairs, surround
│       ├── copilot.lua         # GitHub Copilot AI completion
│       ├── ui.lua              # Catppuccin theme, lualine, indent guides, noice
│       ├── debug.lua           # DAP (debugger) with codelldb, dap-ui, virtual text
│       ├── test.lua            # Neotest with neotest-rust adapter
│       └── rust.lua            # Rust-specific: crates.nvim keys, rustaceanvim keys
├── KEYMAP.md                   # Full keybinding cheatsheet
└── README.md
```

## Module Reference

### `config/lazy.lua`
Bootstraps `lazy.nvim` (auto-clones on first run), loads LazyVim as the base distribution, and imports all plugin specs from `lua/plugins/`. Disables unused built-in plugins for faster startup.

### `config/options.lua`
Neovim editor options: 4-space indentation (Rust convention), relative line numbers, system clipboard, persistent undo, no swap files, and performance tweaks for SSH (faster `updatetime` and `timeoutlen`).

### `config/keymaps.lua`
Custom keybindings with `<Space>` as leader. Includes window/buffer navigation, line moving, centered scrolling, and diagnostic navigation. All mappings include `desc` fields for which-key discoverability.

### `config/autocmds.lua`
Autocommands for: yank highlighting, auto-resize splits, Rust/TOML filetype settings (colorcolumn at 100 for Rust), close utility windows with `q`, and auto-create parent directories on save.

### `plugins/editor.lua`
| Plugin | Purpose |
|--------|---------|
| **telescope.nvim** | Fuzzy finder for files, grep, symbols, diagnostics, git |
| **telescope-fzf-native** | Native C sorter for faster Telescope filtering |
| **which-key.nvim** | Keybinding discovery popup with group labels |
| **outline.nvim** | Code symbol tree sidebar (functions, structs, enums) |
| **trouble.nvim** | Pretty diagnostics/quickfix lists |
| **todo-comments.nvim** | Highlight and navigate TODO/FIXME/HACK comments |
| **gitsigns.nvim** | Git hunk signs, staging, blame, and diff |

### `plugins/lsp.lua`
Mason ensures `rust-analyzer`, `codelldb`, and `taplo` are installed. Configures `rust-analyzer` with: all features enabled, clippy on save, proc macro support, and inlay hints (chaining, parameter, type hints).

### `plugins/coding.lua`
| Plugin | Purpose |
|--------|---------|
| **nvim-cmp** | Autocompletion with LSP/path/snippet/crates sources |
| **conform.nvim** | Format on save (rustfmt for Rust, taplo for TOML) |
| **nvim-autopairs** | Auto-close brackets, parens, quotes |
| **Comment.nvim** | Toggle comments with `gc`/`gcc` |
| **mini.surround** | Add/delete/change surrounding pairs (`sa`, `sd`, `sr`) |

### `plugins/ui.lua`
| Plugin | Purpose |
|--------|---------|
| **catppuccin** | Colorscheme (mocha variant — SSH-friendly dark theme) |
| **lualine.nvim** | Statusline with active LSP server name |
| **indent-blankline** | Visual indent guides |
| **noice.nvim** | Enhanced command line and notifications |
| **dressing.nvim** | Better `vim.ui.select` and `vim.ui.input` dialogs |

### `plugins/debug.lua`
DAP (Debug Adapter Protocol) setup with `codelldb` for Rust. Includes `nvim-dap-ui` for a visual debugger layout (scopes, breakpoints, stacks, watches, REPL) and `nvim-dap-virtual-text` for inline variable values.

### `plugins/test.lua`
Neotest framework with the `neotest-rust` adapter. Run individual tests, file tests, or debug tests via `codelldb`. Navigate between failed tests with `[T`/`]T`.

### `plugins/rust.lua`
Additional keybindings for Rust-specific features provided by `crates.nvim` (dependency management in Cargo.toml) and `rustaceanvim` (expand macros, runnables, debuggables, crate graph, hover actions).

### `plugins/copilot.lua`
GitHub Copilot integration for AI-powered code completion. Accepts with `Ctrl+y` to avoid conflicts with nvim-cmp's Tab. Requires `:Copilot auth` on first use.

## Keybindings

See **[KEYMAP.md](KEYMAP.md)** for the full cheatsheet organized by category.

## SSH Usage

This config is designed for remote use:

1. **No external runtime dependencies** — no Node.js, Python providers, or system services required beyond Neovim + Git + C compiler.
2. **Auto-bootstrap** — first `nvim` launch clones lazy.nvim and installs everything.
3. **Fast startup** — disabled built-in plugins + lazy-loading keeps startup under 100ms.
4. **Low bandwidth** — catppuccin mocha works in 256-color terminals; no background images or heavy assets.

For a new VM:
```bash
# Install Neovim (Ubuntu/Debian)
sudo apt update && sudo apt install -y neovim git build-essential ripgrep fd-find

# Clone this config
git clone <your-repo-url> ~/.config/nvim

# Install Rust toolchain
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer clippy rustfmt

# Launch — everything auto-installs
nvim
```

## Updating

```vim
:Lazy sync       " Update all plugins
:Mason           " Check/update LSP servers and tools
:LazyHealth      " Verify configuration health
:checkhealth     " Full Neovim health check
```
