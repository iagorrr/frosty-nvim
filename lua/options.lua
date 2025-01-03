local opt = vim.opt

opt.termguicolors = true

opt.lazyredraw = true

opt.timeoutlen = 500

opt.wrap = true
opt.whichwrap = "bshl<>[]~"

opt.mouse = "a"

opt.signcolumn = "yes:1"
opt.fillchars = { eob = " " }

opt.ruler = false
opt.showmode = false

opt.scrolloff = 4

opt.splitbelow = true
opt.splitright = true

opt.number = false
opt.relativenumber = false

opt.expandtab = true
opt.smartindent = true
opt.tabstop = 8
opt.softtabstop = 8
opt.shiftwidth = 8

opt.swapfile = false

opt.showmode = false
opt.ruler = false
opt.showcmd = false
opt.shortmess = "F"
opt.hidden = false

opt.ignorecase = true
opt.smartcase = true

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- TODO: Make this string dynamic so when the buffer width changes it wont break...
opt.laststatus = 0
vim.api.nvim_set_hl(0, "Statusline", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "StatuslineNC", { link = "FloatBorder" })
local str = string.rep("─", vim.api.nvim_win_get_width(0))
vim.opt.statusline = "%#FloatBorder#" .. str .. "%*"
