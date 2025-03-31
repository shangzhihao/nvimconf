# NeoVim Configure

## Requirement

### A Nerd font is necessary.

### LSP
The following language servers are configured:
lua_ls for lua (installed by mason)
pylsp (python-lsp-server) for python

### Format and lint
The following code formatter or linter are configured:
stylua for lua formatting (installed by mason)
isort for python formatting
black for python formatting
ruff for python linting
pylint for python linting
mypy for python linting

### Dependency by plugins
tar, curl and a c compiler are required by nvim-treesitter
ripgrep, fd, and fzf are required by telescope
wget is not required by any plugins, 
but checkhealth says it shoud be installed, no harm anyaway.

### Python packages
pip install python-lsp-server ruff isort black pylint mypy
pip install debugpy (for debugging)

### On windows
tar: winget install -e --id GnuWin32.Tar
curl: winget install -e --id cURL.cURL
fd: winget install -e --id sharkdp.fd
ripgrep: winget install -e --id BurntSushi.ripgrep.MSVC
wget: winget install -e --id JernejSimoncic.Wget

ALL: winget install GnuWin32.Tar cURL.cURL sharkdp.fd BurntSushi.ripgrep.MSVC LLVM.LLVM JernejSimoncic.Wget




