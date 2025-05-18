return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {
			disable_filetype = {},
			map_cr = true,
		},
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
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
}
