# NeoVim Configure

## Requirement

### A Nerd font is necessary.

### LSP
The following language servers are configured:
lua_ls for lua (installed by mason)
clangd for cpp
pylsp (python-lsp-server) for python
rust-analyzer for rust
jdtls form java

### Format and lint
The following code formatter or linter are configured:
stylua for lua formatting (installed by mason)
isort for python formatting
black for python formatting
pylint for python linting
mypy for python linting
checkstyle for java linting
google-java-format for java formatting

### Debug
dap-ui is installed, but only dap for python is configured now.
Install a debugger for certain language to make it work.

debugpy for python
<lead>dd run pdb in a terminal to debug python file.
It will trigger a terminal tool to debug the current buffer
based on file type in the future.
<leader>dr run the current buffer in as python script in a terminal.
It will the current buffer based on its file type.

### Dependency by plugins
tar, curl and a c compiler are required by nvim-treesitter
ripgrep, fd, and fzf are required by telescope
wget is not required by any plugins, 
but checkhealth says it shoud be installed, no harm anyaway.

### Python packages
pip install python-lsp-server isort black pylint mypy
pip install debugpy (for debugging)

### On windows
tar: winget install -e --id GnuWin32.Tar
curl: winget install -e --id cURL.cURL
clang & lldb: winget install -e --id LLVM.LLVM
fd: winget install -e --id sharkdp.fd
ripgrep: winget install -e --id BurntSushi.ripgrep.MSVC
wget: winget install -e --id JernejSimoncic.Wget

ALL: winget install GnuWin32.Tar cURL.cURL sharkdp.fd BurntSushi.ripgrep.MSVC LLVM.LLVM JernejSimoncic.Wget

The folder that mason installs language server is ~/AppData/Local/nvim-data/mason/bin.
Add the folder to PATH if NeoVim cannot find installed language servers.

### The code
lua code in the lua/user are mostly about key-bindings.
the invocation chain is utils->other->key-bind-fun->key-bindings


### My note
'n': normal mode
'i': insert mode
'v': visual mode
'x': visual block mode
's': select mode
'o': operator-pending mode
'c': command-line mode
't': terminal mode


