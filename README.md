# Neovim Configuration

Opinionated, plugin-driven Neovim setup optimised for daily development with fast navigation, rich UI, and batteries-included language tooling.

## Why This Setup

- Tightly curated plugin stack tuned for fast startup and minimal manual tweaking.
- First-class Telescope workflow with project-aware fuzzy finding via smart-open.
- Visual polish (Catppuccin, Noice, Lualine) without sacrificing responsiveness.
- Quality-of-life automation for directory changes, spell checking, and Markdown authoring.

## Prerequisites

- Neovim ≥ 0.10.0 (uses the native `vim.lsp.config`/`vim.lsp.enable` APIs)
- `git`, `curl`
- [`ripgrep`](https://github.com/BurntSushi/ripgrep) for Telescope live grep
- SQLite 3 (bundled with macOS; required by `smart-open.nvim` via `sqlite.lua`)
- A Nerd Font for icons used by lualine, Oil, Telescope, and Alpha

## Quickstart

1. Back up any existing Neovim configuration (`~/.config/nvim`).
2. Clone this repository (examples assume dotfiles live in `~/dotfiles`):

   ```bash
   git clone <repo-url> ~/dotfiles/nvim
   ```

3. Link the configuration into Neovim’s config directory:

   ```bash
   ln -s ~/dotfiles/nvim ~/.config/nvim
   ```

4. Launch `nvim` once to let [lazy.nvim](https://github.com/folke/lazy.nvim) bootstrap and install plugins.
5. Inside Neovim run `:Lazy sync` to ensure everything is pulled at the locked versions defined in `lazy-lock.json`.

> Install external LSP servers (e.g. `pyright`) with your preferred package manager. This configuration relies on Neovim’s built-in client rather than Mason.

## Daily Workflow Highlights

- **UI & Ergonomics**: Catppuccin (Frappe) default theme, alternative Tokyonight preset (`lua/config/vim-options.lua`), modern command line via Noice, notifications through nvim-notify, and an Alpha start screen with MRU and tips.
- **Navigation & Search**: Telescope with `ui-select`, `notify`, and `smart-open`, Oil.nvim floating file explorer, Easymotion for in-buffer jumps, and Neoscroll for smooth page navigation.
- **Editing Experience**: which-key leader hints, inline LSP renames with inc-rename, structural editing via nvim-autopairs, Markdown previews rendered in-buffer, plus illuminate and rainbow-delimiters for rapid comprehension.
- **Language Tooling**: Native LSP client configured for `lua_ls` and `pyright`, Treesitter auto-install/highlighting/indentation, and Treesitter-context to keep the active scope visible.
- **Automations**: `DirChanged` autocmd announces new working directories (shortened inside `/Users/shang/`), with supporting helpers under `lua/user/utils.lua`.

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

> `<leader>sr` expects a `:GrugFar` command (for example from `grug-far.nvim`) and `<leader>so` expects `:TodoTelescope`. Add the corresponding plugins if you rely on those mappings.

## Customisation Guide

- Core options (line numbers, colorscheme, spell check, indentation) live in `lua/config/vim-options.lua`.
- Adjust keybindings in `lua/config/key-binding.lua` and helper functions in `lua/user/key-bind-fun.lua`.
- Plugin behaviour is defined in `lua/plugins/*.lua`; each module owns a single plugin for easy toggling.
- Startup screen tweaks (MRU list, banner, tips) live in `lua/config/startui-mru.lua` and `lua/config/tips.lua`.
- Icon definitions for which-key live in `lua/config/icons.lua`.

## Maintenance

- Run `:Lazy` to inspect plugin status, updates, or logs.
- `lazy-lock.json` pins plugin versions for reproducible setups; update via `:Lazy sync` and commit the lockfile.
- After adding new external tooling (LSP servers, formatters) rerun `:checkhealth` to confirm availability.

## Troubleshooting

- Run `:checkhealth` after first launch to ensure external tools (e.g. `rg`, LSP servers) are available.
- If `smart-open` complains about SQLite, install the `sqlite3` CLI or ensure macOS command line tools are present.
- Notifications appear briefly; use `<leader>sm` to reopen the history when needed.
- To switch themes, update the `vim.cmd.colorscheme` line in `lua/config/vim-options.lua` or toggle inside Neovim (e.g. `:colorscheme catppuccin-mocha`).

## License

This configuration is distributed under the MIT License (see the included `LICENSE` file).

## Credits

Built on top of the Neovim ecosystem—thanks to the maintainers of lazy.nvim, Telescope, Oil, catppuccin, noice, alpha, and all other plugins bundled here.
