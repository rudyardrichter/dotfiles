local packer = require("packer")

local compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua"
packer.init({compile_path = compile_path})

-- Automatically sync when writing to this file
vim.cmd[[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost */plugins/init.lua source <afile> | PackerSync
  augroup end
]]

local use = packer.use

use "wbthomason/packer.nvim"

use({
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
})

use({
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = lspconfig.util.default_config.capabilities
    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern("Cargo.toml"),
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
  end
})

use({
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
})

use({
  "hrsh7th/nvim-cmp",
  requires = {"hrsh7th/cmp-nvim-lsp"},
  config = function()
    require("plugins.configs.cmp")
  end
})

use({
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",
  requires = {{"nvim-lua/plenary.nvim"}}
})
