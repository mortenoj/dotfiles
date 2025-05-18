return {
	{ "tpope/vim-fugitive" },
	{
		"neoclide/vim-easygit",
		config = function()
			vim.g.easygit_enable_command = 0
		end,
	},
	{
		"TimUntersberger/neogit",
		config = function()
			require("neogit").setup()
		end,
	},
	{
		"sindrets/diffview.nvim",
		opts = {
			default_args = {
				DiffviewOpen = { "--ignore-all-space" }, -- Default: `--ignore-space-change`
				DiffviewFileHistory = {},
			},
		},
		config = function()
			vim.keymap.set("n", "<leader>dd", "<cmd>DiffviewOpen<cr>")
			vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<cr>")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "" }, -- don't get much value out of delete signs
				topdelete = { text = "‾" }, -- don't get much value out of delete signs
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 650,
			},
		},
	},
}
