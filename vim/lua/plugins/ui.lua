return {
  -- Color schemes
  { "joshdick/onedark.vim" },
  { "sonph/onehalf", rtp = "vim/" },
  { "kyoz/purify", rtp = "vim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd("colorscheme catppuccin-mocha")
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "nightfly",
        },
      })
    end
  },

  -- Visual enhancements
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup({
        '*'; -- Highlight all files, but customize some others.
        css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
        html = { names = false; } -- Disable parsing "names" like Blue or Gray
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      indent = { char = "┆" },
      scope = { enabled = true },
    },
  },

  { "MunifTanjim/nui.nvim" },

  {
    "folke/noice.nvim",
    opts = {
      -- Only enable cmdline
      -- cmdline = {
      --   enabled = true,
      --   view = "cmdline_popup",
      -- },
      --
      -- messages = { enabled = false },
      -- popupmenu = { enabled = false },
      -- notify = { enabled = false },
      -- presets = {
      --   bottom_search = false,
      --   command_palette = false,
      --   long_message_to_split = false,
      --   inc_rename = false,
      --   lsp_doc_border = false,
      -- },

      -- Config that lazyvim uses
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = false,
        long_message_to_split = true,
      },
      messages = {
        view_search = false,
      },

      -- Default config that can be used if I use native LSP + neotree and a sort
      -- out a few other plugins
      -- lsp = {
      --   enabled = true,
      --   -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      --   override = {
      --     ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      --     ["vim.lsp.util.stylize_markdown"] = true,
      --     ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      --   },
      -- },
      -- messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        -- enabled = true, -- enables the Noice messages UI
        -- view = "notify", -- default view for messages
        -- view_error = "notify", -- view for errors
        -- view_warn = "notify", -- view for warnings
        -- view_history = "messages", -- view for :messages
        -- view_search = false, -- ("virtualtext") view for search count messages. Set to `false` to disable
      -- },
      -- you can enable a preset for easier configuration
      -- presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        -- command_palette = true, -- position the cmdline and popupmenu together
        -- long_message_to_split = true, -- long messages will be sent to a split
        -- inc_rename = false, -- enables an input dialog for inc-rename.nvim
        -- lsp_doc_border = false, -- add a border to hover docs and signature help
      -- },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify", -- optional
    },
  },
}
