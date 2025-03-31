return {
	-- Editing Text
	"Press 'dd' to delete a line",
	"Use 'ci(' to change text inside parentheses",
	"Press 'zz' to center current line",
	"Use 'gd' to go to definition",
	"Press 'A' to append at end of line",
	"Use ':w' to save file",
	"Press 'u' to undo changes",
	"Use 'CTRL-r' to redo changes",
	"Press '%' to jump between matching brackets",
	"Use 'f{char}' to jump to next occurrence of {char}",
	"Press '*' to search for word under cursor",
	"Use ':sp' for horizontal split",
	"Press 'CTRL-w w' to switch between windows",
	"Use 'gg' to go to start of file",
	"Press 'G' to go to end of file",
	"Use 'gUiw' to uppercase inner word - combines the operator (gU) with text object (iw)",
	"Master text objects: 'i(' for inside parentheses, 'a{' for around braces including the braces",
	"Use 'vap' to select a paragraph, combines visual mode with text object",
	"Use 'gJ' to join lines without adding spaces",
	"Try '<C-a>' and '<C-x>' in visual block mode to increment/decrement columns",
	"Use 'g<C-a>' for sequential numbers in visual block",
	"Master ':read !command' to insert command output at cursor",
	"Press 'Y' to yank (copy) the entire line (similar to 'yy')",
	"Use 'diw' to delete the inner word under the cursor",
	"Press '.' to repeat the last change (very handy for repetitive edits)",
	"Press 'cc' to change (delete and enter insert mode) the entire line",
	"Use 'g~' with text objects to toggle case, like 'g~iw' to toggle case for inner word",
	"Use 'gU' and 'gu' in visual mode to change selected text to uppercase or lowercase",

	-- Macros and Repeating
	"Use '@:' to repeat the last Ex command",
	"Use 'qa', then perform actions, and 'q' to stop recording macro 'a'; then '@a' to execute",
	"Use '<C-u>' in insert mode to delete everything from the cursor to the beginning of the line",

	-- Inserting Special Characters
	"Use '<C-k>' followed by two-letter digraphs (e.g., 'th' for '†') to insert special characters",
	"Use '<C-v>u' followed by hex code in insert mode to insert a Unicode character directly",

	-- Marks
	"Press 'ma' to set mark 'a' on a line, then '`a' to jump back to it",
	"Use `:marks` to list all marks and their positions",
	"Use '[a' and ']a' to jump to the start and end of the line marked by 'a'",

	-- Indentation and Formatting
	"Use ':set shiftwidth=4' to change indentation width to 4 spaces",
	"Press 'gg=G' to format the entire file with indentation",
	"Try '>' and '<' in visual mode to adjust indentation",
	"Press '=' to auto-indent selected lines",
	"Use ':retab' to convert all tabs to spaces or vice versa based on current settings",
	"Use '=' followed by a text object, like '=ip' to auto-indent a paragraph",
	"Try ':%!fmt' to wrap long lines to fit within your 'textwidth' setting",
	"Use ':normal! gggqG' to format the entire buffer",

	-- Command Mode Navigation
	"Press '<C-f>' in command mode to open a larger window for command editing",
	"Use 'q:' to open the command history window and edit previous commands",
	"Use '<C-d>' in command mode to list possible completions",

	-- Ex-Mode Shortcuts
	"Use ':cfdo' to run commands on all files in the quickfix list",
	"Use ':cfdo' or ':cdo' to apply an operation to all entries in the quickfix list",
	"Use ':lopen' to open the location list and ':copen' to open the quickfix list",

	-- Folding
	"Create custom folds with 'zf' operator (e.g., 'zfap' folds a paragraph)",
	"Use 'zMzv' to close all folds except current line",
	"Navigate with 'zj'/'zk' to move between fold boundaries",
	"Try ':setlocal foldexpr=getline(v:lnum)=~@/' to fold based on last search",
	"Try 'zR' to open all folds and 'zM' to close all folds",
	"Use 'zx' to update folds for any new text added to the file",
	"Set ':set foldmethod=marker' and use '{{{' and '}}}' markers to define fold regions",

	-- Miscellaneous Tips
	"Press 'ga' to display the ASCII value of the character under the cursor",
	"Use ':.!sort' to sort lines in visual mode",
	"Use ':set spell' to enable spell check, and ']s'/'[s' to navigate misspelled words",
	"Try ':sort u' to sort unique lines",
	"Press '<C-r><C-w>' in command mode to insert the word under the cursor",
	"Use ':!command' to run a shell command and display the output in Neovim",
	"Press '<C-g>' in normal mode to see your current position and file stats",
	"Use ':redir' to capture command output to a variable or file",
	"Set ':set wrap linebreak' for soft wrapping without cutting words mid-line",

	-- Registers and Expression Register
	"Use '\"*p' to paste from the system clipboard",
	"Press '\"_d' to delete to the black hole register (does not overwrite clipboard)",
	"Use '<C-r>' in insert mode to insert the content of a register",
	"Type '\"+y' to yank to the system clipboard on most systems",
	"Record a macro with recursive calls using 'q' within the macro",
	"Execute macro on visual selection with ':normal @q'",
	"Use ':let @q=@q[:-2]' to edit last character of macro in register q",
	"Combine macros: ':let @a=@a.@b' concatenates macro b to a",
	"Use '\"0p' to paste the last yank, not affected by any deletions",
	"Use ':.y A' to append a line to register 'a', rather than overwriting it",
	"Try ':redir @a' to capture command output to register 'a'",
	"Use ':let @/=\"pattern\"' to set search register without searching",
	"Try '<C-r>=system(\"command\")' in insert mode to insert command output",
	"Use expression register with strftime(): '<C-r>=strftime(\"%Y-%m-%d\")<CR>'",
	"Master registers: '\"+p' pastes from system clipboard, '\"0p' pastes last yank",
	"Use '<C-r>=' in command or insert mode to evaluate expressions on the fly",
	"Use '<C-r><C-o>' in insert mode to insert the output of a Vim command",
	"Try ':put =strftime(\"%Y-%m-%d\")' to insert the current date",

	-- Clipboard Tricks
	"Use '\"1p' to paste the most recent deletion, or '\"0p' for the last yank",
	"Try 'gP' to paste before the cursor position",
	"Use ':set clipboard=unnamedplus' to enable clipboard integration on supported systems",
	"Press '\"*y' to yank to the system clipboard, or '\"+p' to paste from it",
	"Use ':let @+ = \"text\"' to copy 'text' directly to the system clipboard",
	"Use '<C-r>+' in insert mode to paste from the system clipboard",
	"Type '\"*p' to paste from the primary selection in Neovim",

	-- Running Shell Commands
	"Use ':!echo Hello' to run a shell command and see the output",
	"Use ':read !ls' to insert the output of a shell command into the buffer",
	"Try ':silent !command' to run a command without displaying output in Neovim",

	-- Visual Mode Tips
	"Press '<' or '>' in visual mode to shift the selected text left or right",
	"Use 'gv' to reselect the last visual selection",
	"Press 'g?' in visual mode to rot13 encode the selection",

	-- Advanced Text Objects
	"Use 'cit' to change everything inside HTML/XML tags",
	"Press 'ca\"' to change everything around double quotes",
	"Use 'vi]' to select inside square brackets",

	-- Ex Mode and Command Mode
	"Use ':w !sudo tee %' to save a file as root",

	-- Vim Script and Macro Tips
	"Use ':let @q=' to edit a macro in register 'q'",
	"Press '@q' to execute the macro in register 'q'",
	"Use ':redir' to capture command output to a register or file",
	"Try ':%!jq .' to pretty-print JSON in Neovim",

	-- Plugins
	"Use ':PackerSync' to update all plugins with packer.nvim",
	"Press 'K' while on a word to access the documentation (with plugins like 'vim-lsp')",
	"Try ':Git blame' to see the Git blame for the current line (requires 'fugitive')",
	"Use ':TSUpdate' to update Treesitter syntax parsers",
	"Use ':lua vim.lsp.buf.format()' to format with LSP on supported files",

	-- Search and Replace
	"Press 'n' to move to the next search result, and 'N' to go to the previous one",
	"Use ':noh' to clear search highlighting",
	"Use ':%s/old/new/gc' to search and replace with confirmation",
	"Press '/' followed by text to search forward and '?' to search backward",
	"Use '\\<word\\>' to search for 'word' as a whole word only",
	"Try ':g/^$/d' to delete all blank lines in the file",
	"Use ':g/^#/' to list all commented lines if using '#' for comments",
	"Use ':%s/\\v' to enter 'very magic' mode, making regex easier",
	"Use '\\ze' and '\\zs' in regex to set the end or start of the match",
	"Try ':bufdo %s/foo/bar/ge | update' for a global search/replace across buffers",
	"Use ':g/pattern/d' to delete all lines matching a pattern",
	"Try ':v/pattern/d' (inverse of :g) to delete all lines NOT matching a pattern",
	"Use 'cgn' to change next match and '.' to repeat the change",
	"Master ':s/\\%Vpattern/replacement/g' for search/replace only within visual selection",

	-- Movement
	"Use marks with operators: 'y`a' yanks from current position to mark 'a'",
	"Navigate changes with 'g;' and 'g,' to move through your change list",
	"Use :delmarks! to delete all lowercase marks",
	"Jump between function boundaries with '[m' and ']m'",
	"Use 'w' to jump to the start of the next word and 'b' to go back to the start of the previous word",
	"Press '^' to jump to the first non-blank character in the line",
	"Use '$' to jump to the end of the line",
	"Use '[(' and '])' to jump between unmatched parentheses",
	"Navigate by screens with 'H'(high), 'M'(middle), 'L'(low)",
	"Jump to previous/next closed fold with '[z' and ']z'",
	"Use 'gv' to reselect last visual selection",

	-- Ex Commands
	"Use ':earlier 5m' to revert file to state 5 minutes ago",
	"Try ':argdo %s/pattern/replacement/ge | update' for multi-file search/replace",
	"Use ':put =range(1,10)' to insert numbers 1 to 10",
	"Master ':normal! @q' to run macro q without custom mappings",
}
