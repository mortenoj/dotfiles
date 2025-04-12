local config = {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {},
				automatic_installation = true,
			})
		end,
	},
	{ "neovim/nvim-lspconfig" },

	-- {
	-- 	"nvimdev/lspsaga.nvim",
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	config = function()
	-- 		require("lspsaga").setup({
	-- 			ui = { border = "rounded" },
	-- 			lightbulb = { enable = false },
	-- 		})
	-- 	end,
	-- },

	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp", -- optional
		config = function()
			local ls = require("luasnip")

			vim.keymap.set({ "i" }, "<C-K>", function()
				ls.expand()
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-L>", function()
				ls.jump(1)
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-J>", function()
				ls.jump(-1)
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-E>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true })
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",

			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()

			--- @diagnostic disable-next-line: redundant-parameter
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
			})

			-- Set up lspconfig.
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local util = require("lspconfig.util")

			-- function to find the root directory containing .git/
			local function get_root_dir()
				return util.find_git_ancestor(vim.fn.expand("%:p")) -- Try to find `.git` folder first
					or vim.fn.getcwd() -- Fallback to the current working directory if no markers are found
			end

			local on_attach = function(_, bufnr)
				local opts = { buffer = bufnr, noremap = true, silent = true }

				-- Keybindings for LSP and Plugins
				local keymap = vim.keymap.set

				-- LSP Keybindings
				keymap("n", "K", vim.lsp.buf.hover, opts)
				keymap("n", "gd", vim.lsp.buf.definition, opts)
				keymap("n", "gr", vim.lsp.buf.references, opts)
				keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
				keymap("n", "<leader>a", vim.lsp.buf.code_action, opts)

				-- Diagnostics Navigation
				keymap("n", "<leader>e", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
				keymap("n", "<leader>E", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

				vim.api.nvim_create_autocmd("CursorHold", {
					buffer = bufnr,
					callback = function()
						vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
					end,
				})
			end

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					local lspconfig = require("lspconfig")
					if server_name == "lua_ls" then
						lspconfig[server_name].setup({
							root_dir = get_root_dir,
							on_attach = on_attach,
							capabilities = capabilities,
							settings = {
								Lua = {
									runtime = {
										version = "LuaJIT",
									},
									diagnostics = {
										-- Get the language server to recognize the `vim` global
										globals = {
											"vim",
											"require",
										},
									},
									workspace = {
										-- Make the server aware of Neovim runtime files
										library = vim.api.nvim_get_runtime_file("", true),
									},
									-- Do not send telemetry data containing a randomized but unique identifier
									telemetry = {
										enable = false,
									},
								},
							},
						})
					else
						lspconfig[server_name].setup({
							root_dir = get_root_dir,
							on_attach = on_attach,
							capabilities = capabilities,
						})
					end
				end,
			})

			vim.o.signcolumn = "yes"
		end,
	},

	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				go = { "golangcilint" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettierd", "eslint_d", stop_after_first = false },
					typescript = { "prettierd", "eslint_d", stop_after_first = false },
					typescriptreact = { "prettierd", "eslint_d", stop_after_first = false },
					go = { "gofmt", "golangci-lint", stop_after_first = false },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})
		end,
	},

	{
		"mfussenegger/nvim-dap",
		-- config = function()
		--   local dap = require("dap")
		--   dap.adapters.go = { type = "server", host = "127.0.0.1", port = 38697 }
		--   dap.configurations.go = { { type = "go", name = "Debug", request = "launch", program = "${file}" } }
		-- end
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		-- config = function()
		--   require("dapui").setup()
		--
		--   local dap = require("dap")
		--   dap.listeners.after.event_initialized["dapui_config"] = function() require("dapui").open() end
		--   dap.listeners.before.event_terminated["dapui_config"] = function() require("dapui").close() end
		--   dap.listeners.before.event_exited["dapui_config"] = function() require("dapui").close() end
		-- end
	},
}

return config

-- DAP Keybindings
-- keymap("n", "<F5>", require("dap").continue, { desc = "Start/Continue Debugging" })
-- keymap("n", "<F10>", require("dap").step_over, { desc = "Step Over" })
-- keymap("n", "<F11>", require("dap").step_into, { desc = "Step Into" })
-- keymap("n", "<F12>", require("dap").step_out, { desc = "Step Out" })
-- keymap("n", "<leader>b", require("dap").toggle_breakpoint, { desc = "Toggle Breakpoint" })
