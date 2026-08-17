# Neovim configuration

This configuration targets Neovim 0.12 or newer and uses the built-in `vim.pack` package manager.

## Runtime requirements

- Git, curl, tar, a C compiler, and `tree-sitter-cli`
- A Nerd Font
- `rg`, `fd`, and `fzf`
- Language servers: `lua-language-server`, `vtsls`, `vue-language-server`, `cspell-lsp`,
  `vscode-json-language-server`, `tailwindcss-language-server`, `taplo`, `ty`, and `ruff`
- Formatters: `stylua`, `rustfmt`, `taplo`, and `ruff`

For Vue support, install `vue-language-server` and `vtsls`. The configuration derives the
`@vue/typescript-plugin` directory from the `vue-language-server` executable. Set
`VUE_LANGUAGE_SERVER_PATH` to the package root if the executable is wrapped or installed in a
non-standard layout.

## Layout

- `lua/config/`: core options, keymaps, commands, and the single package declaration
- `lua/plugins/`: plugin configuration grouped by responsibility
- `nvim-pack-lock.json`: revisions managed by `vim.pack`; do not edit it manually

Files under `lua/plugins/` are not discovered automatically. `lua/plugins/init.lua` loads them
explicitly.

## Updating plugins

Run this inside Neovim:

```vim
:lua vim.pack.update()
```

Review the confirmation buffer and write it to apply the update. The `PackChanged` hook updates
Tree-sitter parsers when nvim-treesitter changes. Restart Neovim, run `:checkhealth`, then commit
the updated lockfile.

To restore revisions after reverting the lockfile:

```vim
:lua vim.pack.update(nil, { offline = true, target = "lockfile" })
```

## Verification

```vim
:checkhealth
:checkhealth vim.lsp
:checkhealth vim.treesitter
:checkhealth vim.deprecated
```
