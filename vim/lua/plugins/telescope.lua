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
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}), -- Use dropdown theme for ui-select
					},
				},
			})

			-- Load Telescope extensions
			local extensions = { "gh", "fzf", "ui-select" }
			for _, ext in ipairs(extensions) do
				pcall(telescope.load_extension, ext)
			end

			local opts = { noremap = true, silent = true }

			-- Keybindings
			vim.keymap.set("n", "<leader>tt", "<cmd>Telescope<cr>", opts)
			vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
			vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
			vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", opts) -- Adjusted for diagnostics
			vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
			vim.keymap.set("n", "<leader>fc", "<cmd>Telescope git_bcommits<cr>", opts)
			vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
			vim.keymap.set("n", "<leader>cs", "<cmd>Telescope colorscheme<cr>", opts) -- Changed to <leader>c for colorscheme picker

			-- GitHub-specific keybindings
			vim.keymap.set("n", "<leader>pr", "<cmd>Telescope gh pull_request initial_mode=normal<cr>")
		end,
	},

	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope-github.nvim" },
	{ "nvim-telescope/telescope-symbols.nvim" },
}
