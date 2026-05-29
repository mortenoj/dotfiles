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
vim.opt.relativenumber = true

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

---- yank highlight ----

local dark_yank = "#6E738D"
local light_yank = "#F3B7C8"

-- apply highlight to yank
local function apply_yank_hl()
	local bg_opt = vim.o.background
	local col = dark_yank

	if bg_opt == "light" then
		col = light_yank
	elseif bg_opt == "dark" then
		col = dark_yank
	end

	vim.api.nvim_set_hl(0, "HighlightedyankRegion", { bg = col })
end

-- apply now and whenever a colorscheme loads (covers auto-dark-mode)
apply_yank_hl()
vim.api.nvim_create_autocmd("ColorScheme", { callback = apply_yank_hl })

-- yank autocmd
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "HighlightedyankRegion", timeout = 500 })
	end,
})
