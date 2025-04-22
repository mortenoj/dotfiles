return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			local keymap = vim.keymap.set

			keymap("n", "<leader>bb", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
			keymap("n", "<leader>bc", dap.continue, { desc = "Start/Continue Debugging" })
			keymap("n", "<leader>bo", dap.step_out, { desc = "Step Out" })
			keymap("n", "<leader>bn", dap.step_over, { desc = "Step Over" })
			keymap("n", "<leader>bi", dap.step_into, { desc = "Step Into" })
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("dapui").setup()

			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},

	{
		"leoluz/nvim-dap-go",
		dependencies = { "mfussenegger/nvim-dap" },
		opts = {},
	},
}
