# Keymap Cheatsheet

Leader key: **Space**

> Tip: Press `<Space>` and wait — **which-key** will show all available bindings.
> Use `<Space>fk` to fuzzy-search all keymaps via Telescope.

---

## General

| Key | Mode | Action |
|-----|------|--------|
| `<Space>w` | n | Save file |
| `<Space>q` | n | Quit (confirm) |
| `<Space>Q` | n | Quit all (confirm) |
| `<Esc>` | n | Clear search highlight |

## File Explorer (neo-tree)

| Key | Mode | Action |
|-----|------|--------|
| `<Space>e` | n | Toggle file explorer (root dir) |
| `<Space>E` | n | Toggle file explorer (cwd) |

**Inside the explorer tree:**

| Key | Action |
|-----|--------|
| `a` | Add file/directory (end name with `/` for directory) |
| `d` | Delete file |
| `r` | Rename file |
| `c` | Copy file |
| `m` | Move file |
| `y` | Copy file name |
| `Y` | Copy relative path |
| `p` | Paste file |
| `/` | Filter / search |
| `<CR>` | Open file |
| `s` | Open in vertical split |
| `S` | Open in horizontal split |
| `H` | Toggle hidden files |
| `R` | Refresh tree |
| `?` | Show all neo-tree keybindings |

## Session (persistence.nvim)

| Key | Mode | Action |
|-----|------|--------|
| `<Space>qs` | n | Restore session for current directory |
| `<Space>qS` | n | Select a session to restore |
| `<Space>ql` | n | Restore last session (any directory) |
| `<Space>qd` | n | Stop auto-saving for this session |

## Navigation & Motions

| Key | Mode | Action |
|-----|------|--------|
| `j` / `k` | n, x | Move down/up (respects line wrapping) |
| `n` | n | Next search result (centered) |
| `N` | n | Previous search result (centered) |
| `<C-d>` | n | Scroll half-page down (centered) |
| `<C-u>` | n | Scroll half-page up (centered) |
| `]d` | n | Next diagnostic |
| `[d` | n | Previous diagnostic |
| `]h` | n | Next git hunk |
| `[h` | n | Previous git hunk |
| `]t` | n | Next TODO comment |
| `[t` | n | Previous TODO comment |
| `]T` | n | Next failed test |
| `[T` | n | Previous failed test |

## Windows

| Key | Mode | Action |
|-----|------|--------|
| `<C-h>` | n | Go to left window |
| `<C-j>` | n | Go to lower window |
| `<C-k>` | n | Go to upper window |
| `<C-l>` | n | Go to right window |
| `<C-Up>` | n | Increase window height |
| `<C-Down>` | n | Decrease window height |
| `<C-Left>` | n | Decrease window width |
| `<C-Right>` | n | Increase window width |

## Buffers (`<Space>b`)

| Key | Mode | Action |
|-----|------|--------|
| `<S-h>` | n | Previous buffer |
| `<S-l>` | n | Next buffer |
| `<Space>bd` | n | Delete buffer |

## Find / Telescope (`<Space>f`)

| Key | Mode | Action |
|-----|------|--------|
| `<Space>ff` | n | Find files |
| `<Space>fg` | n | Live grep |
| `<Space>fw` | n | Grep word under cursor |
| `<Space>fb` | n | Buffers |
| `<Space>fr` | n | Recent files |
| `<Space>fh` | n | Help tags |
| `<Space>fk` | n | Keymaps |
| `<Space>f/` | n | Fuzzy find in current buffer |
| `<Space>fs` | n | Document symbols (LSP) |
| `<Space>fS` | n | Workspace symbols (LSP) |
| `<Space>fd` | n | Document diagnostics |
| `<Space>fD` | n | Workspace diagnostics |
| `<Space>fc` | n | Git commits |
| `<Space>ft` | n | Find TODOs |

**Inside Telescope picker:**

| Key | Mode | Action |
|-----|------|--------|
| `<C-j>` | i | Next item |
| `<C-k>` | i | Previous item |
| `<C-q>` | i | Send selected to quickfix list |
| `<Esc>` | i | Close picker |

## LSP / Code (`<Space>c`)

| Key | Mode | Action |
|-----|------|--------|
| `K` | n | Hover documentation |
| `gd` | n | Go to definition (LazyVim default) |
| `gr` | n | References (LazyVim default) |
| `<Space>ca` | n | Code action |
| `<Space>cr` | n | Rename symbol |
| `<Space>cd` | n | Line diagnostics (float) |
| `<Space>cl` | n | LSP info |
| `<Space>co` | n | Toggle code outline sidebar |
| `<Space>cs` | n | Symbols (Trouble) |

## Diagnostics & Trouble (`<Space>x`)

| Key | Mode | Action |
|-----|------|--------|
| `<Space>xx` | n | Toggle workspace diagnostics |
| `<Space>xX` | n | Toggle buffer diagnostics |
| `<Space>xL` | n | Toggle location list |
| `<Space>xQ` | n | Toggle quickfix list |
| `<Space>xt` | n | Toggle TODO list |

## Rust (`<Space>r`)

### Rustaceanvim (active in `.rs` files)

| Key | Mode | Action |
|-----|------|--------|
| `<Space>rr` | n | Runnables |
| `<Space>rd` | n | Debuggables |
| `<Space>rt` | n | Testables |
| `<Space>re` | n | Expand macro |
| `<Space>rm` | n | Go to parent module |
| `<Space>rj` | n | Join lines |
| `<Space>rh` | n | Hover actions |
| `<Space>rc` | n | Open Cargo.toml |
| `<Space>rg` | n | Crate dependency graph |
| `<Space>rp` | n | Rebuild proc macros |

### Crates.nvim (active in `Cargo.toml`)

| Key | Mode | Action |
|-----|------|--------|
| `<Space>rcu` | n | Upgrade all crates |
| `<Space>rcU` | n | Update all crates |
| `<Space>rci` | n | Crate info popup |
| `<Space>rcv` | n | Crate versions popup |
| `<Space>rcf` | n | Crate features popup |
| `<Space>rcd` | n | Crate dependencies popup |

## Debugging / DAP (`<Space>d`)

| Key | Mode | Action |
|-----|------|--------|
| `<Space>db` | n | Toggle breakpoint |
| `<Space>dB` | n | Conditional breakpoint |
| `<Space>dc` | n | Continue |
| `<Space>dC` | n | Run to cursor |
| `<Space>di` | n | Step into |
| `<Space>do` | n | Step over |
| `<Space>dO` | n | Step out |
| `<Space>dl` | n | Run last debug session |
| `<Space>dr` | n | Toggle REPL |
| `<Space>dt` | n | Terminate session |
| `<Space>du` | n | Toggle DAP UI |
| `<Space>de` | n, v | Eval expression under cursor |

## Testing / Neotest (`<Space>t`)

| Key | Mode | Action |
|-----|------|--------|
| `<Space>tn` | n | Run nearest test |
| `<Space>tf` | n | Run all tests in file |
| `<Space>td` | n | Debug nearest test |
| `<Space>ts` | n | Toggle test summary panel |
| `<Space>to` | n | Show test output |
| `<Space>tO` | n | Toggle output panel |
| `<Space>tS` | n | Stop running test |

## Git (`<Space>g`)

| Key | Mode | Action |
|-----|------|--------|
| `<Space>gs` | n | Stage hunk |
| `<Space>gr` | n | Reset hunk |
| `<Space>gS` | n | Stage entire buffer |
| `<Space>gR` | n | Reset entire buffer |
| `<Space>gp` | n | Preview hunk |
| `<Space>gb` | n | Blame line (full) |
| `<Space>gd` | n | Diff this |

## Editing

| Key | Mode | Action |
|-----|------|--------|
| `<A-j>` | n | Move line down |
| `<A-k>` | n | Move line up |
| `<A-j>` | v | Move selection down |
| `<A-k>` | v | Move selection up |
| `p` | x | Paste without yanking replaced text |
| `gc` | n, v | Toggle comment (motion / selection) |
| `gcc` | n | Toggle comment (current line) |

### Surround (mini.surround)

| Key | Mode | Action |
|-----|------|--------|
| `sa` | n, v | Add surrounding |
| `sd` | n | Delete surrounding |
| `sr` | n | Replace surrounding |
| `sf` | n | Find surrounding (right) |
| `sF` | n | Find surrounding (left) |
| `sh` | n | Highlight surrounding |
| `sn` | n | Update `n_lines` for surround search |

## Completion (nvim-cmp)

| Key | Mode | Action |
|-----|------|--------|
| `<Tab>` | i, s | Next completion item |
| `<S-Tab>` | i, s | Previous completion item |
| `<CR>` | i, s | Confirm selected completion |
| `<M-e>` | i | Wrap with pairs (autopairs fast wrap) |

## Copilot

| Key | Mode | Action |
|-----|------|--------|
| `<C-y>` | i | Accept Copilot suggestion |
| `<C-]>` | i | Next Copilot suggestion |
| `<C-[>` | i | Previous Copilot suggestion |
| `<C-\>` | i | Dismiss Copilot suggestion |

## Terminal

| Key | Mode | Action |
|-----|------|--------|
| `<Esc><Esc>` | t | Exit terminal mode |

## Utility Windows

| Key | Mode | Action |
|-----|------|--------|
| `q` | n | Close help, LSP info, quickfix, checkhealth, and test output windows |
