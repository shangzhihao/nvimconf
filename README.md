# Neovim Configuration

Opinionated, plugin-driven Neovim setup optimised for daily development with fast navigation, rich UI, and batteries-included language tooling.

## Requirements

- Neovim ≥ 0.10.0 (uses the native `vim.lsp.config`/`vim.lsp.enable` APIs)
- `git`, `curl`
- [`ripgrep`](https://github.com/BurntSushi/ripgrep) for Telescope live grep
- SQLite 3 (bundled with macOS; required by `smart-open.nvim` via `sqlite.lua`)
- A Nerd Font for icons used by lualine, Oil, Telescope, and Alpha

## Installation

1. Back up any existing Neovim configuration (`~/.config/nvim`).
2. Clone this repository (the examples assume dotfiles live in `~/dotfiles`):

   ```bash
   git clone <repo-url> ~/dotfiles/nvim
   ```

3. Link the configuration into Neovim’s config directory:

   ```bash
   ln -s ~/dotfiles/nvim ~/.config/nvim
   ```

4. Launch `nvim` once to let [lazy.nvim](https://github.com/folke/lazy.nvim) bootstrap and install plugins.
5. Inside Neovim run `:Lazy sync` to ensure everything is pulled at the locked versions defined in `lazy-lock.json`.

> **Tip:** Install external LSP servers (e.g. `pyright`) with your preferred package manager. This configuration relies on Neovim’s built-in client rather than Mason.

## Highlights

### UI & Ergonomics

- [catppuccin](https://github.com/catppuccin/nvim) (Frappe) is the default colorscheme; [tokyonight](https://github.com/folke/tokyonight.nvim) is pre-installed as an alternative (`lua/config/vim-options.lua`).
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) with a live macro recorder indicator.
- [noice.nvim](https://github.com/folke/noice.nvim) combined with [nvim-notify](https://github.com/rcarriga/nvim-notify) provides a modern command line, message routing, and ephemeral notifications.
- [alpha-nvim](https://github.com/goolord/alpha-nvim) start screen with a random tip of the day and most-recently-used file list.

### Navigation & Search

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) with `ui-select`, `notify`, and [`smart-open`](https://github.com/danielfalk/smart-open.nvim) for project-aware fuzzy finding.
- [oil.nvim](https://github.com/stevearc/oil.nvim) as the primary file explorer, exposed through floating windows with metadata columns.
- [vim-easymotion](https://github.com/easymotion/vim-easymotion) for quick in-buffer jumps.
- [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) provides smooth scrolling helpers.

### Editing Workflow

- [which-key.nvim](https://github.com/folke/which-key.nvim) drives the leader-key menu with iconography (`lua/config/key-binding.lua`).
- Spell checking is enabled by default (`en_us`) with quick navigation helpers.
- [inc-rename.nvim](https://github.com/smjonas/inc-rename.nvim) powers inline LSP renames.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) for structural editing.
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) previews Markdown structure directly in the buffer.
- [vim-illuminate](https://github.com/RRethy/vim-illuminate) and [rainbow-delimiters](https://github.com/HiPhish/rainbow-delimiters.nvim) improve code comprehension.

### Language Tooling

- Native LSP client configured for:
  - `lua_ls` (with diagnostics tailored for Neovim runtime)
  - `pyright` for Python
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) with auto-install, highlighting, and indentation.
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) keeps the current scope in view.

### Quality-of-life Automations

- `DirChanged` autocmd announces the new working directory (shortened when inside `/Users/shang/`), implemented in `lua/user/autocmd.lua`.
- Utility helpers live in `lua/user/utils.lua` (e.g. directory detection, command checks).

## Keymap Cheatsheet

Leader key is `<Space>` and local leader is `,`. The table below lists the mappings you are likely to use most often; [which-key](https://github.com/folke/which-key.nvim) reveals the complete catalogue on demand.

| Mapping | Mode | Action |
| --- | --- | --- |
| `<leader>ff` | Normal | Telescope `smart_open` (fuzzy find files) |
| `<leader>fw` | Normal | Save buffer |
| `<leader>fm` | Normal | Toggle Oil file manager (floating) |
| `<leader>fh` | Normal | Toggle hidden files in Oil |
| `<leader>bl` | Normal | Telescope buffers |
| `<leader>bn` / `<leader>bp` | Normal | Next / previous buffer |
| `<leader>ld` | Normal | Jump to LSP definition |
| `<leader>lr` | Normal | Show LSP references |
| `<leader>la` | Normal | Trigger LSP code action |
| `<leader>ln` | Normal | Incremental rename for symbol under cursor |
| `<leader>ss` | Normal | Telescope live grep |
| `<leader>sr` | Normal | Launch global search & replace (`GrugFar`) |
| `<leader>sp` | Normal | Telescope projects (requires project source) |
| `<leader>sm` | Normal | Browse notification history |
| `<leader>cn` / `<leader>cp` | Normal | Next / previous spelling issue |
| `<leader>ca` | Normal | Add word to spell dictionary |
| `<leader>xh` | Normal | Toggle search highlight |
| `<leader>xw` | Normal | Toggle line wrapping |
| `<leader>mm` | Normal | EasyMotion two-character jump |
| `<leader>k` / `<leader>j` | Normal | Smooth scroll up / down via Neoscroll |

> **Note:** `<leader>sr` expects a `:GrugFar` command (for example from `grug-far.nvim`) and `<leader>so` expects `:TodoTelescope`. Add the corresponding plugins if you rely on those mappings.

## Plugin Management

- Run `:Lazy` to inspect plugin status, updates, or logs.
- `lazy-lock.json` pins plugin versions for reproducible setups; update via `:Lazy sync` and commit the lockfile.
- Add or remove plugins under `lua/plugins/` (each plugin lives in its own module).

## Customisation Guide

- Core options (line numbers, colorscheme, spell check, indentation) live in `lua/config/vim-options.lua`.
- Adjust keybindings in `lua/config/key-binding.lua` and helper functions in `lua/user/key-bind-fun.lua`.
- Tweak plugin behaviour by editing the corresponding `lua/plugins/*.lua` module.
- Startup screen tweaks (MRU list, banner, tips) live in `lua/config/startui-mru.lua` and `lua/config/tips.lua`.
- Icons used by which-key are centralised in `lua/config/icons.lua`.

## Troubleshooting

- Run `:checkhealth` after first launch to ensure external tools (e.g. `rg`, LSP servers) are available.
- If `smart-open` complains about SQLite, install the `sqlite3` CLI or ensure macOS command line tools are present.
- Notifications appear briefly; use `<leader>sm` to reopen the history when needed.
- To switch themes, update the `vim.cmd.colorscheme` line in `lua/config/vim-options.lua` or toggle inside Neovim (e.g. `:colorscheme catppuccin-mocha`).

## License

This configuration is distributed under the MIT License (see the included `LICENSE` file).

## Credits

Built on top of the Neovim ecosystem—thanks to the maintainers of lazy.nvim, Telescope, Oil, catppuccin, noice, alpha, and all other plugins bundled here.
