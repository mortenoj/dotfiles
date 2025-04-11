return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")

      -- Setup Telescope
      telescope.setup({
        defaults = {
          -- General settings
          prompt_prefix = "> ",
          selection_caret = "> ",
        },
        pickers = {
          colorscheme = {
            enable_preview = true, -- Enable preview for colorschemes
          },
        },
        extensions = {
          coc = {
            prefer_locations = true, -- Always use Telescope locations
            push_cursor_on_edit = true, -- Jump back to saved cursor position
            timeout = 5000, -- Timeout for coc commands (adjust as needed)
          },
         ["ui-select"] = {
            require("telescope.themes").get_dropdown({}) -- Use dropdown theme for ui-select
          },
        },
      })

      -- Load Telescope extensions
      local extensions = { "gh", "fzf", "coc", "ui-select" }
      for _, ext in ipairs(extensions) do
        pcall(telescope.load_extension, ext)
      end

      -- Keybindings
      vim.keymap.set("n", "<leader>t", "<cmd>Telescope<cr>")
      vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>")
      vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>")
      vim.keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics<cr>") -- Adjusted for diagnostics
      vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>")
      vim.keymap.set("n", "<leader>h", "<cmd>Telescope help_tags<cr>")
      vim.keymap.set("n", "<leader>c", "<cmd>Telescope colorscheme<cr>") -- Changed to <leader>c for colorscheme picker

      -- GitHub-specific keybindings
      vim.keymap.set("n", "<leader>pr", "<cmd>Telescope gh pull_request initial_mode=normal<cr>")
    end,
  },

  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "nvim-telescope/telescope-github.nvim" },
  { "nvim-telescope/telescope-symbols.nvim" },
}
