--------------------------------------------------------------------------------
----------------------------------- TreeSitter ---------------------------------
--------------------------------------------------------------------------------

require('nvim-treesitter.configs').setup({
  -- A list of parser names, or "all"
  ensure_installed = { 'lua' },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { 'tmux' },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { 'json' },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,

    -- context aware commenting from 'nvim-ts-context-commentstring'
    context_commentstring = {
        enable = true
    }
  },
})

--------------------------------------------------------------------------------
------------------------------ TreeSitter-context ------------------------------
--------------------------------------------------------------------------------

require("treesitter-context").setup({
  max_lines = 2, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = "cursor",  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})

--------------------------------------------------------------------------------
------------------------------------- noice ------------------------------------
--------------------------------------------------------------------------------

require("noice").setup({
  -- Only enable cmdline
  cmdline = {
    enabled = true,
    view = "cmdline_popup",
  },

  messages = { enabled = false },
  popupmenu = { enabled = false },
  notify = { enabled = false },
  presets = {
    bottom_search = false,
    command_palette = false,
    long_message_to_split = false,
    inc_rename = false,
    lsp_doc_border = false,
  },

  -- Default config that can be used if I use native LSP + neotree and a sort
  -- out a few other plugins

  -- lsp = {
  --   enabled = true,
  --   -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --   override = {
  --     ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --     ["vim.lsp.util.stylize_markdown"] = true,
  --     ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
  --   },
  -- },
  -- messages = {
    -- NOTE: If you enable messages, then the cmdline is enabled automatically.
    -- This is a current Neovim limitation.
    -- enabled = true, -- enables the Noice messages UI
    -- view = "notify", -- default view for messages
    -- view_error = "notify", -- view for errors
    -- view_warn = "notify", -- view for warnings
    -- view_history = "messages", -- view for :messages
    -- view_search = false, -- ("virtualtext") view for search count messages. Set to `false` to disable
  -- },
  -- you can enable a preset for easier configuration
  -- presets = {
    -- bottom_search = true, -- use a classic bottom cmdline for search
    -- command_palette = true, -- position the cmdline and popupmenu together
    -- long_message_to_split = true, -- long messages will be sent to a split
    -- inc_rename = false, -- enables an input dialog for inc-rename.nvim
    -- lsp_doc_border = false, -- add a border to hover docs and signature help
  -- },
})

--------------------------------------------------------------------------------
------------------------------------ Copilot -----------------------------------
--------------------------------------------------------------------------------

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-CR>", 'copilot#Accept("<CR>")', {
  silent = true,
  expr = true
})

--------------------------------------------------------------------------------
---------------------------------- CopilotChat ---------------------------------
--------------------------------------------------------------------------------
require("CopilotChat").setup {
  -- model = "gpt-4o",
  model = "claude-3.5-sonnet",
  mappings = {
    reset = {
      normal = '<C-c>',
      insert = '<C-c>',
    }
  },
  window = {
    width = 0.3, -- fractional width of parent, or absolute width in columns when > 1
  }
}

-- open quick chat with current buffer as context
vim.keymap.set(
  "n",
  "<leader>ccq",
  function ()
    local input = vim.fn.input("Quick Chat: ")
    if input ~= "" then
      require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
    end
  end,
  {
    desc = "CopilotChat - Quick chat"
  }
)

-- show prompt actions with telescope
vim.keymap.set(
  {"n", "v"},
  "<leader>ccp",
  function()
    local actions = require("CopilotChat.actions")
    require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
  end,
  {
    desc = "CopilotChat - Quick chat"
  }
)

vim.keymap.set(
  "n",
  "<leader>cc",
  ":CopilotChat<CR>",
  {
    desc = "CopilotChat - Open"
  }
)

--------------------------------------------------------------------------------
---------------------------------- Comment.nvim --------------------------------
--------------------------------------------------------------------------------

require('Comment').setup({
    toggler = {
        ---Line-comment toggle keymap
        line = '<leader>c<space>',
        ---Block-comment toggle keymap
        block = '<leader>cb',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = '<leader>c<space>',
        ---Block-comment keymap
        block = '<leader>cb',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})

--------------------------------------------------------------------------------
----------------------------------- gitsigns -----------------------------------
--------------------------------------------------------------------------------

require("gitsigns").setup({
    signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '' }, -- don't get much value out of delete signs
        topdelete    = { text = '‾' },-- don't get much value out of delete signs
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 650,
      },
})

--------------------------------------------------------------------------------
------------------------------------- AirLine ----------------------------------
--------------------------------------------------------------------------------

vim.g.airline_powerline_fonts = 1
vim.g.airline_section_z = ' %{strftime("%-I:%M %p")}'
vim.g.airline_section_warning = ''
vim.g.airline_theme = 'onedark'

--------------------------------------------------------------------------------
------------------------------- indent-blankline -------------------------------
--------------------------------------------------------------------------------

require("ibl").setup {
    indent = { char = "┆" },
    scope = { enabled = true },
}

--------------------------------------------------------------------------------
------------------------------------ Spectre -----------------------------------
--------------------------------------------------------------------------------

require('spectre').setup({
    default = {
        replace = {
            cmd = "sed"
       }
    }
})

vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})

vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})

vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})

vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

--------------------------------------------------------------------------------
----------------------------------- Autopairs ----------------------------------
--------------------------------------------------------------------------------

require("nvim-autopairs").setup({
    disable_filetype = { },
})

--------------------------------------------------------------------------------
----------------------------------- Telescope ----------------------------------
--------------------------------------------------------------------------------

require('telescope').setup({
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  },
  extensions = {
    coc = {
      -- theme = vim.api.nvim_command_output("colorscheme"),
      -- theme = "catppuccin-frappe",
      
      prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
      push_cursor_on_edit = true, -- save the cursor position to jump back in the future
      timeout = 3000, -- timeout for coc commands
    }
  }
})

require('telescope').load_extension('gh')
require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')

vim.keymap.set("n", "<leader>t", "<cmd>Telescope<cr>")
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>d", "<cmd>Telescope grep_string initial_mode=normal<cr>")
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>ee", "<cmd>Telescope colorscheme<cr>")

-- github plugin
vim.keymap.set("n", "<leader>pr", "<cmd>Telescope gh pull_request initial_mode=normal<cr>")

--------------------------------------------------------------------------------
----------------------------------- NERDTree -----------------------------------
--------------------------------------------------------------------------------

vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeDirArrowExpandable = '↠'
vim.g.NERDTreeDirArrowCollapsible = '↡'
vim.g.NERDTreeIgnore = {
    '\\.meta$',
    -- '^node_modules$',
    '^__pycache__$',
    '^__snapshots__$',
}
vim.g.NERDTreeQuitOnOpen = 1

vim.cmd([[
" Open NERDTree on vim enter unless explicitly disabled
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && !exists("g:nerdtree_disable_on_startup") | NERDTree | endif

" Close vim with q when NERDTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
]])

vim.keymap.set("n", "<leader>q", "<cmd>NERDTreeToggle<CR>")
vim.keymap.set("n", "<leader>rr", "<cmd>NERDTreeFind<CR>")

--------------------------------------------------------------------------------
----------------------------------- NERDTree -----------------------------------
--------------------------------------------------------------------------------

vim.g.easygit_enable_command = 0

--------------------------------------------------------------------------------
-------------------------------- nvim-colorizer --------------------------------
--------------------------------------------------------------------------------

require("colorizer").setup({
  '*'; -- Highlight all files, but customize some others.
  css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
  html = { names = false; } -- Disable parsing "names" like Blue or Gray
})

--------------------------------------------------------------------------------
------------------------------------ pounce ------------------------------------
--------------------------------------------------------------------------------

vim.keymap.set("n", "s", "<cmd>Pounce<CR>")
vim.keymap.set("n", "S", "<cmd>PounceRepeat<CR>")
vim.keymap.set("v", "s", "<cmd>Pounce<CR>")
vim.keymap.set("o", "gs", "<cmd>Pounce<CR>") --'s' is used by vim-surround

--------------------------------------------------------------------------------
------------------------------------ CocVim ------------------------------------
--------------------------------------------------------------------------------

vim.g.coc_global_extensions = {
    'coc-css',
    'coc-html',
    'coc-java',
    'coc-tsserver',
    'coc-prettier',
    'coc-eslint',
    'coc-emmet',
    'coc-json',
    'coc-snippets',
    'coc-ultisnips',
    'coc-go',
    'coc-clangd',
    'coc-pyright',
    'coc-markdownlint',
    'coc-omnisharp',
    'coc-yaml',
    'coc-yank',
    'coc-xml',
    -- 'coc-pairs',
    'coc-diagnostic',
    'coc-vimtex',
    'coc-sh',
    'coc-kotlin',
    'coc-db',
    'coc-eslint',
}

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set

-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keyset("n", "<leader>e", "<Plug>(coc-diagnostic-next)", {silent = true})
keyset("n", "<leader>E", "<Plug>(coc-diagnostic-prev)", {silent = true})

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})

-- keyset("n", "gr", "<Plug>(coc-references)", {silent = true})
keyset("n", "gr", "<CMD>Telescope coc references initial_mode=normal<CR>", {silent = true})


-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})


-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- Symbol renaming
keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

-- Apply codeAction to the selected region
-- Example: `<leader>aap` for current paragraph
local opts = {silent = true, nowait = true}
keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- Remap keys for apply code actions at the cursor position.
keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
-- Remap keys for apply source code actions for current file.
keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
-- Apply the most preferred quickfix action on the current line.
keyset("n", "<leader>F", "<Plug>(coc-fix-current)", opts)

-- Remap keys for apply refactor code actions.
keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

-- Run the Code Lens actions on the current line
keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)


-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
keyset("x", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("o", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("x", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("o", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)


-- Remap <C-f> and <C-b> to scroll float windows/popups
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true, expr = true}

keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keyset("i", "<C-f>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keyset("i", "<C-b>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true}

-- Show all diagnostics
keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions
keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
-- Show commands
keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document
keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- Search workspace symbols
keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
-- Do default action for next item
keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts)
-- Do default action for previous item
keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
-- Resume latest coc list
keyset("n", "<space>p", ":<C-u>CocListResume<cr>", opts)

keyset("n", "<leader>y", ":<C-u>CocList -A --normal yank<cr>", { silent = true })

-- disable coc in diff views
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "DiffviewFiles", "DiffviewFileHistory" },
--   callback = function()
--     vim.b.coc_enabled = 0
--   end,
--   group = vim.api.nvim_create_augroup("CocDisableForFiletypes", { clear = true }),
-- })
