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
		end,
	},

	{
		"f-person/auto-dark-mode.nvim",
		opts = {
			update_interval = 2000,

			set_dark_mode = function()
				vim.api.nvim_set_option_value("background", "dark", {})
				vim.cmd.colorscheme("catppuccin-mocha")
			end,

			set_light_mode = function()
				vim.api.nvim_set_option_value("background", "light", {})
				vim.cmd.colorscheme("catppuccin-latte")
			end,

			fallback = "dark",
		},
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
		end,
	},

	-- Visual enhancements
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			filetypes = { "*" },
			options = {
				parsers = { css_fn = true },
			},
		},
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
						any = {
							{ find = "fewer lines" },
							{ find = "more lines" },
							{ find = "more lines" },
							{ find = "lines <ed" },
							{ find = "lines >ed" },
							{ find = "lines yanked" },
							-- { find = "pounce>" },
						},
					},
				},
				{
					opts = { skip = true },
					filter = {
						event = "notify",
						any = {
							{ find = "Toggling hidden files" },
						},
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
