-- Bootstrap Packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path
    })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Automatically PackerSync when writing to this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

local flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 200,
}

local theme = "gruvbox"

require("packer").startup({
  function(use)
    use("wbthomason/packer.nvim")

    use({"nvim-lua/plenary.nvim", module = "plenary"})

    use("L3MON4D3/LuaSnip")
    use("NvChad/nvim-colorizer.lua")
    -- use "WhoIsSethDaniel/mason-tool-installer.nvim"
    use("kyazdani42/nvim-web-devicons")
    use("lervag/vimtex")
    use("lewis6991/impatient.nvim")
    use("mfussenegger/nvim-dap")
    -- use("mong8se/actually.nvim")
    use("nvim-lua/popup.nvim")
    use("onsails/lspkind.nvim")
    use("rafamadriz/friendly-snippets")
    use("rudyardrichter/pretty-fold.nvim")
    use("tmhedberg/SimpylFold")
    use("williamboman/mason-lspconfig.nvim")
    use("williamboman/nvim-lsp-installer")

    use({
      "Shatur/neovim-session-manager",
      config = function()
        local config = require("session_manager.config")
        require("session_manager").setup({
          autoload_mode = config.AutoloadMode.Disabled,
        })
      end
     })

    use({
      "goolord/alpha-nvim",
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function()
        require("plugins.configs.alpha")
      end
    })


    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

    use({
      -- why is this broken in lua??
      "windwp/nvim-autopairs",
      cond = function()
        return vim.bo.filetype ~= "lua"  -- why doesn't this work??
      end,
      config = function()
        require("nvim-autopairs").setup{}
      end,
    })

    use({
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        local null_ls = require("null-ls")
        null_ls.setup({
          sources = {
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.rustfmt,
            -- null_ls.builtins.formatting.lua_format.with({
            --   extra_args = {
            --     "--no-keep-simple-function-one-line", "--no-break-after-operator",
            --     "--column-limit=100", "--break-after-table-lb", "--indent-width=2"
            --   }
            -- })
          },
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
          end
        })
      end
    })

    use({
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup({current_line_blame = false})
      end,
      requires = {"nvim-lua/plenary.nvim"}
    })

    use({
      "simrat39/rust-tools.nvim",
      config = function()
        require("rust-tools").setup({
          tools = {
            autoSetHints = true,
            executor = require("rust-tools/executors").termopen,
            inlay_hints = {
              only_current_line = false,
              show_parameter_hints = false,
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
    })

    use({
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end
    })

    use({
      "neovim/nvim-lspconfig",
      config = function()
        require("lspconfig").rust_analyzer.setup({
          flags = flags,
          on_attach = require("aerial").on_attach,
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                buildScripts = {enable = true}
              },
              diagnostics = {
                disabled = {"inactive-code"}
              },
            }
          }
        })
      end
    })

    use({
      "tamago324/nlsp-settings.nvim",
      config = function()
        require("nlspsettings").setup{
          config_home = vim.fn.stdpath("config") .. "/nlsp-settings",
          local_settings_dir = ".nlsp-settings",
          local_settings_root_markers_fallback = { ".git" },
          append_default_schemas = true,
          loader = "json",
        }
      end,
    })

    use({
      "stevearc/aerial.nvim",
      config = function()
        require("aerial").setup({})
      end
    })

    use({
      "folke/which-key.nvim",
      config = function()
        local whichkey = require("which-key")
        whichkey.setup({})
        whichkey.register({
          ["<leader>"] = {
            d = {name = "Debug"},
            l = {name = "Lsp"},
            p = {name = "Packer"},
            s = {name = "Session"},
          }
        })
      end
    })

    use({
      "feline-nvim/feline.nvim",
      config = function()
        require("plugins.configs.feline")
      end,
    })

    -- use({
    --   "nvim-lualine/lualine.nvim",
    --   requires = {"kyazdani42/nvim-web-devicons", opt = true},
    --   config = function()
    --     local custom = require("lualine.themes.solarized_dark")
    --     if custom.normal.b == nil then
    --       custom.normal.b = {}
    --     end
    --     if custom.insert.b == nil then
    --       custom.insert.b = {}
    --     end
    --     if custom.visual.b == nil then
    --       custom.visual.b = {}
    --     end
    --     if custom.replace.b == nil then
    --       custom.replace.b = {}
    --     end
    --     custom.normal.b.bg = vim.g.terminal_color_10
    --     custom.insert.b.bg = vim.g.terminal_color_10
    --     custom.visual.b.bg = vim.g.terminal_color_10
    --     custom.replace.b.bg = vim.g.terminal_color_10
    --     require("lualine").setup({
    --       options = { theme = custom },
    --     })
    --   end
    -- })

    use({
      "ellisonleao/gruvbox.nvim",
      config = function()
        local palette = require("gruvbox.palette")
        require("gruvbox").setup({
          inverse = false,
          overrides = {
            GruvboxRedSign = {bg = palette.dark0},
            GruvboxGreenSign = {bg = palette.dark0},
            GruvboxYellowSign = {bg = palette.dark0},
            GruvboxBlueSign = {bg = palette.dark0},
            GruvboxPurpleSign = {bg = palette.dark0},
            GruvboxAquaSign = {bg = palette.dark0},
            GruvboxOrangeSign = {bg = palette.dark0},
            Folded = {bg = palette.dark0},
            IncSearch = {fg = palette.dark1, bg = palette.bright_blue},
            Operator = {italic = false},
            Pmenu = {bg = palette.dark0},
            Search = {fg = palette.dark0, bg = palette.bright_yellow},
            SignColumn = {bg = palette.dark0},
            String = {italic = false}
          }
        })
        vim.cmd("colorscheme gruvbox")
        vim.cmd("highlight IndentBlanklineContextChar guifg=" .. palette.dark4)
      end
    })

    use({"Vimjas/vim-python-pep8-indent", ft = "python"})

    use({
      "hrsh7th/nvim-cmp",
      config = function()
        require("plugins.configs.cmp")
      end,
      event = "InsertEnter",
      requires = {
        -- { "onsails/lspkind-nvim", module = "lspkind" },
        -- { "hrsh7th/cmp-buffer", module = "cmp_buffer" },
        {"hrsh7th/cmp-cmdline", after = "nvim-cmp"},
        {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"},
        {"hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp", after = "nvim-cmp"},
        {"hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp"},
        {"hrsh7th/cmp-path", after = "nvim-cmp"},
        {"saadparwaiz1/cmp_luasnip", after = "nvim-cmp"}
        -- { "hrsh7th/cmp-nvim-lua", module = "cmp_nvim_lua" },
        -- { "hrsh7th/cmp-calc", module = "cmp_calc" },
        -- { "hrsh7th/cmp-emoji", module = "cmp_emoji" },
      }
    })

    use({
      "nvim-neo-tree/neo-tree.nvim",
      requires = {{"MunifTanjim/nui.nvim", module = "nui"}},
      setup = function()
        vim.g.neo_tree_remove_legacy_commands = true
      end
    })

    use({
      "nvim-telescope/telescope.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      config = function()
        require("plugins.configs.telescope")
      end
    })

    use({
      "nvim-treesitter/nvim-treesitter",
      config = function()
        -- require("nvim-treesitter").setup()
        require("nvim-treesitter.configs").setup({
          auto_install = true,
          ensure_installed = "all",
          highlight = {enable = true, additional_vim_regex_highlighting = false},
          ident = {enable = true},
          rainbow = {enable = true, extended_mode = true},
          sync_install = false
        })
      end,
      run = function()
        require("nvim-treesitter.install").update({with_sync = true})
      end,
      -- event = {"BufRead", "BufNewFile"},
      -- cmd = {
      --   "TSInstall", "TSInstallInfo", "TSInstallSync", "TSUninstall", "TSUpdate", "TSUpdateSync",
      --   "TSDisableAll", "TSEnableAll"
      -- }
    })

    use({"nvim-treesitter/playground", after = "nvim-treesitter", config = function()
        require("nvim-treesitter.configs").setup({
          playground = {
            enable = true,
            updatetime = 25,
          },
        })
      end
    })

    use({"p00f/nvim-ts-rainbow", after = "nvim-treesitter"})

    use({"windwp/nvim-ts-autotag", after = "nvim-treesitter"})

    use({
      "pwntester/octo.nvim",
      config = function()
        require("octo").setup({})
      end
    })

    use({
      "folke/trouble.nvim",
      config = function()
        require("trouble").setup({
          mode = "loclist",
          padding = "false",
          signs = {error = "✖", warning = "✖", hint = "", information = "", other = ""}
        })
      end
    })

    if packer_bootstrap then require("packer").sync() end
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({border = "single"})
      end
    }
  }
})
