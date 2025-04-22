return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			dap.adapters.go = { type = "server", host = "127.0.0.1", port = 38697 }
			dap.configurations.go = { { type = "go", name = "Debug", request = "launch", program = "${file}" } }

			local keymap = vim.keymap.set

			keymap("n", "<F5>", require("dap").continue, { desc = "Start/Continue Debugging" })
			keymap("n", "<F10>", require("dap").step_over, { desc = "Step Over" })
			keymap("n", "<F11>", require("dap").step_into, { desc = "Step Into" })
			keymap("n", "<F12>", require("dap").step_out, { desc = "Step Out" })
			keymap("n", "<leader>b", require("dap").toggle_breakpoint, { desc = "Toggle Breakpoint" })
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

			local dap = require("dap")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				require("dapui").open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				require("dapui").close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				require("dapui").close()
			end
		end,
	},
}
