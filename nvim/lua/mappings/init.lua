local map_table = {
  [""] = {
    ["H"] = {"^"},
    ["L"] = {"$"},
  },

  n = {
    ["<cr>"] = {"<cmd>w<cr>"},
    ["<tab>"] = {"za"},

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

    ["<C-z>"] = {"&foldlevel ? 'zM' :'zR'", expr = true},

    ["<C-_>"] = {'<cmd>let @/=""<CR><C-l>', silent = true},

    ["<leader>h"] = {"mh*`h"},
    ["<leader>rw"] = {"<cmd>%s/\\s\\+$//<CR> <cmd>nohl<CR> <cmd>w<CR>"},
    ["<leader>i"] = {":Inspect<CR>"},

    -- LS features
    ["<leader>lR"] = {
      function()
        vim.lsp.buf.rename()
      end,
      desc = "Rename current symbol"
    },
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
    ["<leader>d"] = {
      function()
        vim.lsp.buf.definition()
      end,
      desc = "Show the definition of current symbol"
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
    },
        ["<C-f>"] = {
      function()
        require("telescope.builtin").find_files()
      end
    },
    ["<C-s>"] = {
      function()
        require("telescope.builtin").live_grep()
      end
    },
    ["<C-p>"] = {
      function()
        require("telescope.builtin").buffers()
      end
    },
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
