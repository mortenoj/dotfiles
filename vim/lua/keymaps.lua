vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.keymap.set("n", "<Leader><Leader>", ':noh<cr>')

-- make it easier to jump between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-x>", "<C-w>x")

-- Tabs and buffers
vim.keymap.set("n", "<leader>tn", ":tabnew<cr>")
vim.keymap.set("n", "<leader>t<leader>", ":tabnext<cr>")
vim.keymap.set("n", "<leader>tm", ":tabmove<cr>")
vim.keymap.set("n", "<leader>tc", ":tabclose<cr>")
vim.keymap.set("n", "<leader>to", ":tabonly<cr>")

vim.keymap.set("n", "<Tab>", ":bnext<cr>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<cr>")

-- Move between wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("v", "<esc>", "<C-c>")
