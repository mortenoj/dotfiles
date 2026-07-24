return {
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<C-CR>", -- Ctrl + Enter
				},
				color = {
					suggestion_color = "#6c7086", -- darker than surface2
					cterm = 242, -- approx match in 256-color
				},
			})
		end,
	},

	-- disabled copilot.vim config so that codecompanion can use the auth settings
	{
		"github/copilot.vim",
		config = function()
			vim.g.copilot_enabled = 0
		end,
	},
	{
		"olimorris/codecompanion.nvim",
		version = "^19.0.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			--  make it so "auto-edits" are always reviewable
			display = {
				diff = { enabled = true },
			},
		},
	},
}
