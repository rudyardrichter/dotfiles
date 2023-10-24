local packer = require("packer")

local compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua"
packer.init({compile_path = compile_path})

local use = packer.use

use "wbthomason/packer.nvim"
use {
  "nvim-lua/plenary.nvim",
}
use {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end,
}
use {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup()
  end,
}

use "nvim-tree/nvim-web-devicons"

use({
  "freddiehaddad/feline.nvim",
  requires = {"nvim-tree/nvim-web-devicons"},
  config = function()
    require("plugins.configs.feline")
  end,
})

use {
  "ellisonleao/gruvbox.nvim",
  tag = "2.0.0",
  config = function()
    local palette = require("gruvbox").palette
    require("gruvbox").setup({
      inverse = false,
      transparent_mode = true,
      overrides = {
        Folded = {bg = palette.dark0},
        Operator = {italic = false},
        Pmenu = {bg = palette.dark0},
        Search = { fg = palette.bg0, bg = palette.yellow, reverse = true },
        IncSearch = { fg = palette.bg0, bg = palette.orange, reverse = true },
        CurSearch = { link = "IncSearch" },
        SignColumn = {bg = palette.dark0},
        String = {fg = palette.green, italic = false},
        NormalFloat = { bg = palette.dark0 },
      }
    })
    vim.cmd("colorscheme gruvbox")
    vim.cmd("highlight IndentBlanklineContextChar guifg=" .. palette.dark4)
  end
}

use {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter").setup()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      ensure_installed = {"python", "rust", "typescript"},
      highlight = {enable = true, additional_vim_regex_highlighting = false},
      ident = {enable = true},
      rainbow = {enable = true, extended_mode = true},
      sync_install = false
    })
  end,
}

use {
  "neovim/nvim-lspconfig",
  after = {"mason.nvim", "mason-lspconfig.nvim"},
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = vim.tbl_deep_extend(
      "force",
      lspconfig.util.default_config.capabilities,
      require("cmp_nvim_lsp").default_capabilities()
    )
    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
      flags = flags,
      -- on_attach = require("aerial").on_attach,
      settings = {
        ["rust-analyzer"] = {
          assist = {
            importGranularity = "module",
            importPrefix = "by_self",
          },
          cargo = {
            buildScripts = {enable = true},
            loadOutDirsFromCheck = true,
          },
          check = {
            command = "clippy",
          },
          checkOnSave = {
            allFeatures = true,
            overrideCommand = {
              "cargo", "clippy", "--workspace", "--message-format=json",
              "--all-targets", "--all-features"
            }
          },
          diagnostics = {
            disabled = {"inactive-code", "unresolved-import", "macro-error", "unresolved-proc-macro"},
          },
          procMacro = {
            enable = false,
          },
        }
      }
    })
    lspconfig.pyright.setup({
      capabilities = capabilities,
      flags = flags,
      on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "formatexpr", "")
      end,
    })
    lspconfig.terraformls.setup({
      capabilities = capabilities,
    })
    lspconfig.texlab.setup({
      capabilities = capabilities,
      latexindent = {
        ["local"] = vim.fn.stdpath("config") .. "/latexindent.yaml",
      },
    })
    lspconfig.tsserver.setup({
      capabilities = capabilities,
    })
  end,
}

use{
  "rudyardrichter/pretty-fold.nvim",
  config = function()
    require("pretty-fold").setup({
      sections = {
        left = {
          'content',
        },
        right = {
          ' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
          function(config) return config.fill_char:rep(3) end
        }
      },
      fill_char = '·',
      fill_left = false,
      remove_fold_markers = true,
      keep_indentation = true,
      process_comment_signs = 'spaces',
      comment_signs = {},
      -- List of patterns that will be removed from content foldtext section.
      stop_words = {
      },
      add_close_pattern = false, -- true, 'last_line' or false
      matchup_patterns = {
        {  '{', '}' },
        { '%(', ')' }, -- % to escape lua pattern char
        { '%[', ']' }, -- % to escape lua pattern char
      },
      ft_ignore = { 'neorg' },
    })
  end
}

use {
  "hrsh7th/nvim-cmp",
  requires = {
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-omni",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "zbirenbaum/copilot-cmp",
  },
  config = function()
    require("plugins.configs.cmp")
  end
}

use {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",
  requires = {{"nvim-lua/plenary.nvim"}}
}

use { "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable "make" == 1 }

use {
  "zbirenbaum/copilot.lua",
  config = function()
    vim.defer_fn(function()
      require("copilot").setup({
        filetypes = {
          ["*"] = false,
          go = true,
          haskell = true,
          latex = true,
          lua = true,
          markdown = true,
          python = true,
          rust = true,
          tex = true,
          typescript = true,
          yaml = true,
        },
        panel = {
          keymap = {
            jump_next = "<Tab>",
            jump_prev = "<S-Tab>",
            open = "<C-l>",
            refresh = "r",
          },
        },
        suggestion = { enabled = false },
      })
    end, 100)
  end,
}

use {
  "zbirenbaum/copilot-cmp",
  config = function()
    local copilot_cmp = require("copilot_cmp")
    vim.g.copilot_proxy = "http://localhost:5001"
    copilot_cmp.setup({
    })
  end
}

use {
  "Shatur/neovim-session-manager",
  config = function()
    local config = require("session_manager.config")
    require("session_manager").setup({})
  end
}

use {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.rustfmt,
        {
          name = "blackd",
          method = null_ls.methods.FORMATTING,
          filetypes = { "python" },
          generator = require("null-ls.helpers").formatter_factory{
            command = "blackd-client",
            to_stdin = true,
          },
        },
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.terraform_fmt,
        -- null_ls.builtins.formatting.lua_format.with({
        --   extra_args = {
        --     "--no-keep-simple-function-one-line", "--no-break-after-operator",
        --     "--column-limit=100", "--break-after-table-lb", "--indent-width=2"
        --   }
        -- })
      },
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.diagnostics.chktex,
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Autoformat before save",
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({bufnr = bufnr})
            end
          })
        end
      end,
    })
  end
}

use {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 400,
        virt_text_priority = 10000,
      },
      signcolumn = true,
      numhl = true,
    })
  end,
  requires = {"nvim-lua/plenary.nvim"}
}

use {
  "pwntester/octo.nvim",
  config = function()
    require("octo").setup({
      timeout = 20000,
    })
  end
}

use {
  "simrat39/rust-tools.nvim",
  after = {"nvim-lspconfig"},
  config = function()
    require("rust-tools").setup({
      tools = {
        autoSetHints = true,
        executor = require("rust-tools/executors").termopen,
        inlay_hints = {
          only_current_line = false,
          show_parameter_hints = true,
          parameter_hints_prefix = "",
          other_hints_prefix = ""
        },
      },
      dap = {
        -- adapter = {
        --   type = "executable",
        --   command = "lldb-vscode",
        --   name = "rt_lldb",
        -- },
        adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
      },
    })
  end
}

use {
  "folke/which-key.nvim",
  config = function()
    local whichkey = require("which-key")
    whichkey.setup({
      window = {
        border = "single",
        margin = {4, 8, 4, 8}
      },
    })
    require("plugins.configs.whichkey")
  end
}

use {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  requires = {{"MunifTanjim/nui.nvim", module = "nui"}},
  config = function()
    vim.g.neo_tree_remove_legacy_commands = true
    require("neo-tree").setup({
      auto_close = true,
      close_if_last_window = true,
      disable_netrw = true,
      hijack_netrw = true,
      open_on_tab = true,
      update_cwd = false,
      view = {
        adaptive_size = true,
      },
    })
  end
}

use {
  "folke/trouble.nvim",
  config = function()
    require("trouble").setup({
      mode = "document_diagnostics",
      padding = "false",
      signs = {error = "✖", warning = "✖", hint = "", information = "", other = ""}
    })
  end
}

use({
  "L3MON4D3/LuaSnip",
  config = function()
    require("plugins.configs.luasnip")
  end,
})


use({
  "rafamadriz/friendly-snippets",
  config = function()
    require("luasnip.loaders.from_snipmate").lazy_load({
    })
    require("luasnip.loaders.from_vscode").lazy_load({
    })
  end,
})
