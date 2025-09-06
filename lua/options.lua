local opt = vim.opt
-- TODO: Switch to vim.o

opt.cmdheight = 0
opt.confirm = true
opt.expandtab = true
opt.fillchars = { eob = " ", foldopen = "", foldclose = "", fold = " ", foldsep = " " }
opt.foldlevel = 99
opt.foldtext = ""
opt.ignorecase = true
opt.laststatus = 3
opt.lazyredraw = true
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.ruler = false
opt.scrolloff = 4
opt.sessionoptions = { "blank", "buffers", "curdir", "folds", "globals", "help", "tabpages", "terminal", "winsize" }
opt.shiftwidth = 4
opt.showmode = false
opt.signcolumn = "yes:1"
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 4
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.termguicolors = true
opt.timeoutlen = 100
opt.whichwrap = "bshl<>[]~"
opt.wrap = false

-- Enables spell checker for both english and portuguese
vim.opt.spell = true
vim.opt.spelllang = { "en_us", "pt_br" }
