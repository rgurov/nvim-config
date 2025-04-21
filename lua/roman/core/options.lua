local o = vim.opt

-- Line numbers
o.nu = true -- Show absolute line number on the current line
o.relativenumber = true -- Show relative line numbers on all other lines

-- Indentation and tabs
o.tabstop = 4 -- Number of spaces a <Tab> counts for
o.softtabstop = 4 -- Number of spaces used when pressing <Tab> in insert mode
o.shiftwidth = 4 -- Number of spaces used for each step of (auto)indent
o.expandtab = true -- Convert tabs to spaces
o.smartindent = true -- Automatically insert indents in some cases

-- Cursor and text display
o.cursorline = true -- Highlight the line where the cursor is
o.wrap = false -- Do not wrap long lines

-- File backup and undo
o.swapfile = false -- Disable swap file
o.backup = false -- Disable backup file
o.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Directory to store undo history
o.undofile = true -- Enable persistent undo

-- Search behavior
o.hlsearch = false -- Do not highlight search matches by default
o.incsearch = true -- Show search matches while typing

-- UI behavior and appearance
o.scrolloff = 8 -- Keep 8 lines visible above/below the cursor
o.signcolumn = "yes" -- Always show the sign column (for git, LSP, etc.)
o.isfname:append("@-@") -- Allow @ in file names
o.mouse = "a" -- Enable mouse support in all modes
o.showmode = false -- Don't show mode (like -- INSERT --) in command line
o.cmdheight = 2 -- Height of the command line (set to 2 for more message space)
o.showtabline = 1 -- Show tab line only when there are multiple tabs
o.termguicolors = true -- Enable true color support in the terminal
o.list = true -- Show whitespace characters (tabs, trailing spaces, etc.)

-- Performance
o.updatetime = 50 -- Faster update time (affects CursorHold events, etc.)

-- Messaging
o.shortmess = {
	o = true, -- Suppress "file written" and similar messages
}
