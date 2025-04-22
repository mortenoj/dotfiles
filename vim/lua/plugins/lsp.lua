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
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- Set up global LSP UI configurations
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
				max_width = 80,
				max_height = 20,
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
				local setKeyOpts = { buffer = bufnr, noremap = true, silent = true }

				local keymap = vim.keymap.set

				keymap("n", "<leader>e", vim.diagnostic.goto_next, setKeyOpts)
				keymap("n", "<leader>E", vim.diagnostic.goto_prev, setKeyOpts)

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
		end,
	},

	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local setKeyOpts = { noremap = true, silent = true }

			require("lspsaga").setup({
				lightbulb = { enable = false },
				finder = {
					keys = {
						quit = "<Esc>",
						toggle_or_open = "<CR>",
					},
				},
				rename = {
					in_select = false,
					keys = {
						quit = "<Esc>",
					},
				},
			})

			-- Set up Lspsaga keybindings
			vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", setKeyOpts)

			vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", setKeyOpts)
			vim.keymap.set("n", "gpd", "<cmd>Lspsaga peek_definition<CR>", setKeyOpts)
			vim.keymap.set("n", "gpt", "<cmd>Lspsaga peek_type_definition<CR>", setKeyOpts)

			vim.keymap.set("n", "grr", "<cmd>Lspsaga finder<CR>", setKeyOpts)
			vim.keymap.set("n", "gri", "<cmd>Lspsaga finder imp<CR>", setKeyOpts)

			vim.keymap.set("n", "grn", "<cmd>Lspsaga rename<CR>", setKeyOpts)
			vim.keymap.set("n", "gra", "<cmd>Lspsaga code_action<CR>", setKeyOpts)
		end,
	},

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

			"MeanderingProgrammer/render-markdown.nvim",
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
					{ name = "render-markdown" },
				},
			})
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
}

return config
