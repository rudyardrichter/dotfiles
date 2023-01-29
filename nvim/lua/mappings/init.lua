-- TODO: refactor with whichkey

local map_table = {
  [""] = {
    ["H"] = {"^"},
    ["L"] = {"$"},
  },

  n = {
    ["<cr>"] = {"<cmd>w<cr>"},
    ["<tab>"] = {"za"},

    -- Packer
    ["<leader>pc"] = {"<cmd>PackerCompile<cr>", desc = "Packer Compile"},
    ["<leader>pi"] = {"<cmd>PackerInstall<cr>", desc = "Packer Install"},
    ["<leader>ps"] = {"<cmd>PackerSync<cr>", desc = "Packer Sync"},
    ["<leader>pS"] = {"<cmd>PackerStatus<cr>", desc = "Packer Status"},
    ["<leader>pu"] = {"<cmd>PackerUpdate<cr>", desc = "Packer Update"},

    -- Session
    ["<leader>sl"] = {"<cmd>SessionManager load_current_dir_session<cr>", desc = "Session Load"},

    -- Debugger
    ["<leader>db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Breakpoint",
    },
    ["<leader>dc"] = {
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },
    ["<leader>dn"] = {
      function()
        require("dap").step_over()
      end,
      desc = "Next",
    },
    ["<leader>ds"] = {
      function()
        require("dap").step_into()
      end,
      desc = "Step",
    },

    -- Explorer
    ["<leader>e"] = {"<cmd>Neotree action=focus toggle=false<cr>", desc = "Explorer focus"},
    ["<leader>E"] = {"<cmd>Neotree action=focus toggle=true<cr>", desc = "Explorer toggle"},

    ["n"] = {"nzz"},
    ["N"] = {"Nzz"},

    [";"] = {":", noremap = true},
    ["Q"] = {"<cmd>q<cr>"},
    ["J"] = {"mjJ`j"},
    ["Y"] = {"y$"},

    ["<Up>"] = {"<C-w>k", noremap = true},
    ["<Down>"] = {"<C-w>j", noremap = true},
    ["<Left>"] = {"<C-w>h", noremap = true},
    ["<Right>"] = {"<C-w>l", noremap = true},

    ["<C-h>"] = {"<C-o>", noremap = true},
    ["<C-j>"] = {"<C-e>", noremap = true},
    ["<C-k>"] = {"<C-y>", noremap = true},
    ["<C-l>"] = {"<C-i>", noremap = true},

    ["<C-q>"] = {"<cmd>lua require('telescope.builtin').diagnostics({ bufnr=0 })<cr>"},

    ["<C-z>"] = {"&foldlevel ? 'zM' :'zR'", expr = true},

    ["<C-f>"] = {
      function()
        require("telescope.builtin").find_files()
      end
    },
    ["<C-s>"] = {
      function()
        require("telescope.builtin").live_grep()
        -- require("telescope.builtin").live_grep({["additional_args"] = "-i"})
      end
    },
    ["<C-p>"] = {
      function()
        require("telescope.builtin").buffers()
      end
    },

    ["<C-_>"] = {'<cmd>let @/=""<CR><C-l>', silent = true},

    ["<leader>h"] = {"mh*`h"},
    ["<leader>rw"] = {"<cmd>%s/\\s\\+$//<CR> <cmd>nohl<CR> <cmd>w<CR>"},

    -- LS features
    ["<leader>lR"] = {
      function()
        vim.lsp.buf.rename()
      end,
      desc = "Rename current symbol"
    },
    ["<leader>ls"] = {
      function()
        require("telescope").extensions.aerial.aerial()
      end,
      desc = "Search symbols"
    },
    ["<leader>lS"] = {"<cmd>AerialToggle<cr>", desc = "Symbols outline"},
    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      desc = "Hover symbol details"
    },
    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "LSP code action"
    },
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.formatting_sync()
      end,
      desc = "Format code"
    },
    ["<leader>lh"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      desc = "Signature help"
    },
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      desc = "Declaration of current symbol"
    },
    ["gT"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      desc = "Definition of current type"
    },
    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      desc = "Implementation of current symbol"
    },
    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      desc = "Show the definition of current symbol"
    },
    ["gr"] = {
      require("telescope.builtin").lsp_references,
      desc = "References of current symbol"
    },
    ["<leader>ld"] = {
      function()
        vim.diagnostic.open_float()
      end,
      desc = "Hover diagnostics"
    },
    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      desc = "Previous diagnostic"
    },
    ["]d"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      desc = "Next diagnostic"
    },
    ["gl"] = {
      function()
        vim.diagnostic.open_float()
      end,
      desc = "Hover diagnostics"
    }
  },
  i = {
    ["<C-j>"] = {"<C-c><cmd>w<cr>", noremap = true}
  },
  c = {
    ["<C-l>"] = {'wildmenumode() ? "\\<Down>" : "\\<C-l>"', expr = true, noremap = true}
  },
  v = {
    [";"] = {":", noremap = true},
    ["H"] = {"^"},
    ["L"] = {"$"},
    ["<C-j>"] = {"<C-e>", noremap = true},
    ["<C-k>"] = {"<C-y>", noremap = true}
  }
}

for mode, maps in pairs(map_table) do
  for keymap, options in pairs(maps) do
    if options then
      local cmd = options
      local keymap_opts = base or {}
      if type(options) == "table" then
        cmd = options[1]
        keymap_opts = vim.tbl_deep_extend("force", options, keymap_opts)
        keymap_opts[1] = nil
      end
      vim.keymap.set(mode, keymap, cmd, keymap_opts)
    end
  end
end

vim.cmd([[
  augroup quickfix
    au FileType qf nmap <silent> <buffer> <CR> <cmd>copen<CR>
    au FileType qf nmap <silent> <buffer> <C-j> <cmd>cnext<CR>
    au FileType qf nmap <silent> <buffer> <C-k> <cmd>cprev<CR>
  augroup END
]])
