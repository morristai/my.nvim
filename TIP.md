# Tips & Tricks

## Session Persistence

This config includes **persistence.nvim** (bundled with LazyVim), which automatically saves your session (open buffers, window layout, cursor positions, working directory) when you exit Neovim.

Sessions are saved **per working directory** and stored in `~/.local/state/nvim/sessions/`.

### Keybindings

| Key | Action |
|-----|--------|
| `<Space>qs` | Restore session for current directory |
| `<Space>qS` | Select a session to restore |
| `<Space>ql` | Restore last session (any directory) |
| `<Space>qd` | Stop auto-saving for this session |

### What gets saved

Controlled by `sessionoptions`: buffers, current directory, tab pages, window sizes, help pages, globals, and folds.

### Typical workflow

```
cd ~/my-rust-project && nvim   # open project
# ... work, open files, arrange splits ...
:q                             # exit — session auto-saved
cd ~/my-rust-project && nvim   # reopen later
<Space>qs                      # restore everything
```

Each project directory gets its own independent session.
