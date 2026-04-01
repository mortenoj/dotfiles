return {
	--
	-- NB: Trying out supermaven-nvim instead of copilot.vim
	--
	-- {
	-- 	"github/copilot.vim",
	-- 	config = function()
	-- 		-- remap accept from tab to <C-CR> (Ctrl + Enter)
	-- 		vim.g.copilot_no_tab_map = true
	-- 		vim.api.nvim_set_keymap("i", "<C-CR>", 'copilot#Accept("<CR>")', {
	-- 			silent = true,
	-- 			expr = true,
	-- 		})
	--
	-- 		-- note: other models are not support yet
	-- 		vim.g.copilot_settings = { selectedCompletionModel = "gpt-4o-copilot" }
	-- 	end,
	-- },

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

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		config = function()
			require("CopilotChat").setup({
				model = "claude-sonnet-4",
				mappings = {
					reset = {
						normal = "<C-c>",
						insert = "<C-c>",
					},
				},
				window = {
					width = 0.4, -- fractional width of parent, or absolute width in columns when > 1
				},
			})

			-- open quick chat with current buffer as context
			vim.keymap.set("n", "<leader>ccq", function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
				end
			end, {
				desc = "CopilotChat - Quick chat",
			})

			-- show prompt actions with telescope
			vim.keymap.set({ "n", "v" }, "<leader>ccp", function()
				local actions = require("CopilotChat.actions")
				require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
			end, {
				desc = "CopilotChat - Quick chat",
			})

			local open = function()
				local select = require("CopilotChat.select")

				require("CopilotChat").open({
					selection = function(source)
						return select.visual(source) or select.buffer(source)
					end,
				})
			end

			vim.keymap.set("n", "<leader>cc", open, { desc = "CopilotChat - Open " })
			vim.keymap.set("v", "<leader>cc", open, { desc = "CopilotChat - Open " })
		end,
	},
}
