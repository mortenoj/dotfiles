return {
  -- Color schemes
  { "joshdick/onedark.vim" },
  { "sonph/onehalf", rtp = "vim/" },
  { "kyoz/purify", rtp = "vim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({})
      vim.cmd("colorscheme catppuccin-mocha")
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          globalstatus = true, -- Enables a global status line
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
        {
          opts = { skip = true },
          filter = {
            event = "msg_show",
            kind = "",
            any = {
              { find = "fewer lines" },
              { find = "more lines" },
              { find = "lines <ed" },
              { find = "lines >ed" },
              { fine = "Toggling hidden files" },
            }
          },
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
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify", -- optional
    },
  },
}
