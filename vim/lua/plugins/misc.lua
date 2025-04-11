return {
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      default = {
        replace = {
          cmd = "sed",
        },
      },
    },
    config = function()
      require("spectre").setup({
        default = {
          replace = {
            cmd = "sed",
          },
        },
      })
      vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
          desc = "Toggle Spectre"
      })

      vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
          desc = "Search current word"
      })

      vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
          desc = "Search current word"
      })

      vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
          desc = "Search on current file"
      })
    end,
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
      toggler = {
        ---Line-comment toggle keymap
        line = '<leader>c<space>',
        ---Block-comment toggle keymap
        block = '<leader>cb',
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        line = '<leader>c<space>',
        ---Block-comment keymap
        block = '<leader>cb',
      },
      ---LHS of extra mappings
      extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
      },
      ---Enable keybindings
      ---NOTE: If given `false` then the plugin won't create any mappings
      mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
      },
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    })
    end,
  },
  { "Asheq/close-buffers.vim" },

  -- language specific
  { "sheerun/vim-polyglot" },
  { "HerringtonDarkholme/yats.vim" },
  { "pangloss/vim-javascript" },
  { "folke/lazydev.nvim" },
}
