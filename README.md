# nvim-config

My personal Neovim configuration — a single-file setup using the native `vim.pack` package manager (Neovim 0.11+).

## Requirements

- Neovim 0.11+
- [Nerd Font](https://www.nerdfonts.com/) (for icons in statusline and file explorer)
- `git`, `fzf`, `ripgrep` (for fzf-lua)
- Language-specific tools installed via Mason or your system package manager

## Plugins

| Plugin | Purpose |
|---|---|
| [mini.nvim](https://github.com/echasnovski/mini.nvim) | Collection of small independent modules |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | Fuzzy finder for files, grep, LSP, and more |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer sidebar |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and code parsing |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server configuration |
| [mason.nvim](https://github.com/mason-org/mason.nvim) | LSP/tool installer |
| [efmls-configs-nvim](https://github.com/creativenull/efmls-configs-nvim) | EFM language server configs (linters/formatters) |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Completion engine |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |

### Mini modules in use

`mini.ai`, `mini.comment`, `mini.move`, `mini.surround`, `mini.cursorword`, `mini.indentscope`, `mini.pairs`, `mini.trailspace`, `mini.bufremove`, `mini.notify`, `mini.icons`, `mini.diff`, `mini.git`

## LSP Servers

| Server | Language |
|---|---|
| `lua_ls` | Lua |
| `basedpyright` | Python |
| `bashls` | Bash |
| `ts_ls` | TypeScript / JavaScript |
| `gopls` | Go |
| `clangd` | C / C++ |
| `fish-lsp` | Fish shell |
| `efm` | Linting & formatting (all languages) |

Install servers with `:Mason`.

## Linters & Formatters (via EFM)

| Language | Linter | Formatter |
|---|---|---|
| Lua | luacheck | stylua |
| Python | ruff | ruff (format + sort imports) |
| JavaScript / TypeScript | eslint_d | prettier_d |
| CSS / HTML / Markdown / Vue | — | prettier_d |
| JSON / JSONC | eslint_d | fixjson |
| Shell | shellcheck | shfmt |
| C / C++ | cpplint | clang-format |
| Go | go_revive | gofumpt |

Formatting runs automatically on save for supported file types when the EFM server is attached.

## Treesitter Parsers

`vim`, `vimdoc`, `c`, `cpp`, `go`, `html`, `css`, `javascript`, `json`, `lua`, `markdown`, `python`, `typescript`, `vue`, `bash`, `fish`

Parsers are installed automatically on first launch if missing.

## Statusline

Custom built-in statusline with Nerd Font icons showing:
- Current mode (NORMAL / INSERT / VISUAL / etc.)
- File name, flags (modified, readonly)
- Git branch
- File type with icon
- File size
- Cursor position and scroll percentage

Dims automatically for inactive windows.

## Key Mappings

Leader key: `<Space>`

### File Explorer

| Key | Action |
|---|---|
| `<leader>e` | Toggle nvim-tree |

### Fuzzy Finder (fzf-lua)

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find open buffers |
| `<leader>fh` | Help tags |
| `<leader>fx` | Document diagnostics |
| `<leader>fX` | Workspace diagnostics |
| `<leader>fr` | LSP references |
| `<leader>ft` | LSP type definitions |
| `<leader>fs` | LSP document symbols |
| `<leader>fw` | LSP workspace symbols |
| `<leader>fi` | LSP implementations |

### LSP

| Key | Action |
|---|---|
| `<leader>gd` | Go to definition (fzf-lua) |
| `<leader>gD` | Go to definition (native) |
| `<leader>gS` | Go to definition in vertical split |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `<leader>oi` | Organize imports + format |
| `K` | Hover documentation |

### Diagnostics

| Key | Action |
|---|---|
| `<leader>d` | Cursor diagnostics float |
| `<leader>D` | Line diagnostics float |
| `<leader>nd` | Jump to next diagnostic |
| `<leader>pd` | Jump to previous diagnostic |
| `<leader>q` | Open diagnostics in loclist |
| `<leader>dl` | Show line diagnostics float |
| `<leader>td` | Toggle diagnostics on/off |

### Git (mini.diff + mini.git)

| Key | Action |
|---|---|
| `]h` | Next hunk |
| `[h` | Previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hp` | Toggle diff overlay |
| `<leader>hb` | Git blame / show at cursor |

### Buffers & Windows

| Key | Action |
|---|---|
| `<leader>bn` | Next buffer |
| `<leader>bp` | Previous buffer |
| `<leader>sv` | Split vertically |
| `<leader>sh` | Split horizontally |
| `<C-Up>` | Increase window height |
| `<C-Down>` | Decrease window height |
| `<C-Left>` | Decrease window width |
| `<C-Right>` | Increase window width |

### Editing

| Key | Action |
|---|---|
| `<A-j>` | Move line/selection down |
| `<A-k>` | Move line/selection up |
| `<leader>p` | Paste without yanking (visual) |
| `<leader>x` | Delete without yanking |
| `<` / `>` | Indent left/right and reselect (visual) |
| `J` | Join lines, keep cursor position |
| `jk` | Exit insert mode |
| `<leader>pa` | Copy full file path to clipboard |

### Search

| Key | Action |
|---|---|
| `<leader>c` | Clear search highlights |
| `n` | Next match (centered) |
| `N` | Previous match (centered) |

### Completion (blink.cmp)

| Key | Action |
|---|---|
| `<C-Space>` | Toggle completion menu |
| `<CR>` | Accept suggestion |
| `<C-j>` | Select next item |
| `<C-k>` | Select previous item |
| `<Tab>` | Expand / next snippet node |
| `<S-Tab>` | Previous snippet node |

## Notable Behaviors

- **Persistent undo** stored in `~/.vim/undodir` (directory created automatically)
- **No swap/backup files** — undo file is the only persistence mechanism
- **Format on save** triggers only when the EFM server is attached to the buffer
- **Treesitter folding** (`foldmethod=expr`) with all folds open by default (`foldlevel=99`)
- **Wrap + spellcheck** enabled automatically for `markdown`, `text`, and `gitcommit` files
- **Cursor position** restored on buffer open (except in diff mode)
- **Yank highlight** flashes the yanked region after every yank
- **Conceallevel 2** for Obsidian-compatible markdown rendering; cursor line is never concealed
