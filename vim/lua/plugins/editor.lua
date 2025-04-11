return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {
      disable_filetype = { },
    }
  },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  {
    "rlane/pounce.nvim",
    config = function()
      require("pounce").setup({
        -- optional configuration here
      })
      vim.keymap.set("n", "s", "<cmd>Pounce<CR>")
      vim.keymap.set("n", "S", "<cmd>PounceRepeat<CR>")
      vim.keymap.set("v", "s", "<cmd>Pounce<CR>")
      vim.keymap.set("o", "gs", "<cmd>Pounce<CR>") --'s' is used by vim-surround
    end,
  },
  {
    "preservim/nerdtree",
    config = function()
      vim.g.NERDTreeShowHidden = 1
      vim.g.NERDTreeDirArrowExpandable = '↠'
      vim.g.NERDTreeDirArrowCollapsible = '↡'
      vim.g.NERDTreeIgnore = {
          '\\.meta$',
          -- '^node_modules$',
          '^__pycache__$',
          '^__snapshots__$',
      }
      vim.g.NERDTreeQuitOnOpen = 1

      vim.cmd([[
      " Open NERDTree on vim enter unless explicitly disabled
      autocmd StdinReadPre * let s:std_in=1
      autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && !exists("g:nerdtree_disable_on_startup") | NERDTree | endif

      " Close vim with q when NERDTree is the only window open
      autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
      ]])

      vim.keymap.set("n", "<leader>q", "<cmd>NERDTreeToggle<CR>")
      vim.keymap.set("n", "<leader>rr", "<cmd>NERDTreeFind<CR>")
    end,
  },
}
