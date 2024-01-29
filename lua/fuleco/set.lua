-- Line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- No line wrap
vim.opt.wrap = false

-- No backup from vim
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search option
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Colors
vim.opt.termguicolors = true

-- Spacing
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Fast update time
vim.opt.updatetime = 50

-- Horizontal ruler
vim.opt.colorcolumn = "80"

-- Fold with treesitter
vim.opt.foldlevelstart = 25
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Local configuration file
vim.o.exrc = true
