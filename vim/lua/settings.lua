------------- General settings -------------

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.o.signcolumn = "yes"

-- NB: set background=dark
vim.opt.background = "dark"

vim.opt.number = true

vim.opt.cmdheight = 1

-- vim.opt.lazyredraw=true
-- vim.opt.re = 0

vim.opt.cursorline = false
vim.opt.cursorcolumn = false
vim.opt.relativenumber = false

vim.opt.ruler = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.fillchars.vert = "\\"

vim.opt.wrap = true
vim.opt.breakindent = true

vim.opt.title = true
vim.opt.visualbell = true
vim.opt.errorbells = false

vim.opt.linebreak = true

vim.opt.guifont = "MesloLGS Nerd Font Mono:h11"

vim.opt.clipboard = "unnamed"

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true

-- disable mouse mode
vim.opt.mouse = ""

-------------- Colors --------------

vim.opt.termguicolors = true
vim.cmd("syntax on")

-- yank highlight
vim.api.nvim_set_hl(0, "HighlightedyankRegion", { bg = "#6E738D" })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "HighlightedyankRegion", timeout = 500 })
	end,
})
