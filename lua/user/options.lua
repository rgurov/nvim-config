local o = vim.opt

o.nu = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.cursorline = true

o.smartindent = true

o.wrap = false

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

o.hlsearch = false
o.incsearch = true

o.termguicolors = true

o.scrolloff = 8
o.signcolumn = "yes"
o.isfname:append("@-@")

o.updatetime = 50

o.mouse = "a"
o.showmode = false
o.showtabline = 2

o.list = true
o.termguicolors = true

o.showtabline = 1
