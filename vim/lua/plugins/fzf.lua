return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "echasnovski/mini.icons" },
		opts = {
			winopts = {
				-- Set default mode to normal mode
				on_create = function()
					vim.cmd("startinsert!")
				end,
			},
			keymap = {
				fzf = {
					["h"] = "abort",
					["j"] = "down",
					["k"] = "up",
					["l"] = "accept",
					["ctrl-d"] = "preview-down",
					["ctrl-u"] = "preview-up",
					["i"] = "unbind(h)+unbind(j)+unbind(k)+unbind(l)+unbind(i)",
					["esc"] = "rebind(h)+rebind(j)+rebind(k)+rebind(l)+rebind(i)",
				},
			},
		},
	},
}
