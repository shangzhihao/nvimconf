return {
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

	-- Advanced Search and Replace
	"Use ':g/pattern/d' to delete all lines matching a pattern",
	"Try ':v/pattern/d' (inverse of :g) to delete all lines NOT matching a pattern",
	"Use 'cgn' to change next match and '.' to repeat the change",
	"Master ':s/\\%Vpattern/replacement/g' for search/replace only within visual selection",

	-- Marks and Jumps
	"Use marks with operators: 'y`a' yanks from current position to mark 'a'",
	"Navigate changes with 'g;' and 'g,' to move through your change list",
	"Use :delmarks! to delete all lowercase marks",
	"Jump between function boundaries with '[m' and ']m'",

	-- Macros and Registers
	"Record a macro with recursive calls using 'q' within the macro",
	"Execute macro on visual selection with ':normal @q'",
	"Use ':let @q=@q[:-2]' to edit last character of macro in register q",
	"Combine macros: ':let @a=@a.@b' concatenates macro b to a",

	-- Advanced Movement
	"Use '[(' and '])' to jump between unmatched parentheses",
	"Navigate by screens with 'H'(high), 'M'(middle), 'L'(low)",
	"Jump to previous/next closed fold with '[z' and ']z'",
	"Use 'gv' to reselect last visual selection",

	-- Buffer/Window Management
	"Use '<C-w>T' to move current window to new tab",
	"Resize splits with '<C-w>_' (maximize height) and '<C-w>|' (maximize width)",
	"Rotate windows with '<C-w>r' or reverse with '<C-w>R'",
	"Use ':bufdo normal @q' to run macro q on all buffers",

	-- Ex Commands
	"Use ':earlier 5m' to revert file to state 5 minutes ago",
	"Try ':argdo %s/pattern/replacement/ge | update' for multi-file search/replace",
	"Use ':put =range(1,10)' to insert numbers 1 to 10",
	"Master ':normal! @q' to run macro q without custom mappings",

	-- Advanced Editing
	"Use 'gJ' to join lines without adding spaces",
	"Try '<C-a>' and '<C-x>' in visual block mode to increment/decrement columns",
	"Use 'g<C-a>' for sequential numbers in visual block",
	"Master ':read !command' to insert command output at cursor",

	-- Registers and Expression Register
	"Use ':let @/=\"pattern\"' to set search register without searching",
	"Try '<C-r>=system(\"command\")' in insert mode to insert command output",
	"Use expression register with strftime(): '<C-r>=strftime(\"%Y-%m-%d\")<CR>'",
	"Master registers: '\"+p' pastes from system clipboard, '\"0p' pastes last yank",

	-- Folding
	"Create custom folds with 'zf' operator (e.g., 'zfap' folds a paragraph)",
	"Use 'zMzv' to close all folds except current line",
	"Navigate with 'zj'/'zk' to move between fold boundaries",
	"Try ':setlocal foldexpr=getline(v:lnum)=~@/' to fold based on last search",

	-- Terminal Integration
	"Use '<C-\\><C-n>' in terminal mode to switch to normal mode",
	"Send commands to terminal buffer with ':call term_sendkeys(bufnr, \"command\\n\")'",
	"Create terminal in split with ':belowright split | terminal'",
	"Use ':terminal ++curwin' to open terminal in current window",
}
