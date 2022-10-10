-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/rudyard/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/rudyard/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/rudyard/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/rudyard/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/rudyard/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  SimpylFold = {
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/SimpylFold",
    url = "https://github.com/tmhedberg/SimpylFold"
  },
  ["aerial.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vaerial\frequire\0" },
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugins.configs.alpha\frequire\0" },
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/rudyard/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/rudyard/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    after_files = { "/home/rudyard/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help/after/plugin/cmp_nvim_lsp_signature_help.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    after_files = { "/home/rudyard/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/rudyard/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.configs.feline\frequire\0" },
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\23current_line_blame\1\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    config = { "\27LJ\2\n·\5\0\0\a\0.\0N6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0005\4\b\0005\5\6\0009\6\5\0=\6\a\5=\5\t\0045\5\n\0009\6\5\0=\6\a\5=\5\v\0045\5\f\0009\6\5\0=\6\a\5=\5\r\0045\5\14\0009\6\5\0=\6\a\5=\5\15\0045\5\16\0009\6\5\0=\6\a\5=\5\17\0045\5\18\0009\6\5\0=\6\a\5=\5\19\0045\5\20\0009\6\5\0=\6\a\5=\5\21\0045\5\22\0009\6\5\0=\6\a\5=\5\23\0045\5\25\0009\6\24\0=\6\26\0059\6\27\0=\6\a\5=\5\28\0045\5\29\0=\5\30\0045\5\31\0009\6\5\0=\6\a\5=\5 \0045\5!\0009\6\5\0=\6\26\0059\6\"\0=\6\a\5=\5#\0045\5$\0009\6\5\0=\6\a\5=\5%\0045\5&\0=\5'\4=\4(\3B\1\2\0016\1)\0009\1*\1'\3+\0B\1\2\0016\1)\0009\1*\1'\3,\0009\4-\0&\3\4\3B\1\2\1K\0\1\0\ndark40highlight IndentBlanklineContextChar guifg=\24colorscheme gruvbox\bcmd\bvim\14overrides\vString\1\0\1\vitalic\1\15SignColumn\1\0\0\vSearch\18bright_yellow\1\0\0\nPmenu\1\0\0\rOperator\1\0\1\vitalic\1\14IncSearch\16bright_blue\afg\1\0\0\ndark1\vFolded\1\0\0\22GruvboxOrangeSign\1\0\0\20GruvboxAquaSign\1\0\0\22GruvboxPurpleSign\1\0\0\20GruvboxBlueSign\1\0\0\22GruvboxYellowSign\1\0\0\21GruvboxGreenSign\1\0\0\19GruvboxRedSign\1\0\0\abg\1\0\0\ndark0\1\0\1\finverse\1\nsetup\fgruvbox\20gruvbox.palette\frequire\0" },
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/opt/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["neovim-session-manager"] = {
    config = { "\27LJ\2\nó\1\0\0\5\0\b\0\r6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\6\0009\4\4\0009\4\5\4=\4\a\3B\1\2\1K\0\1\0\18autoload_mode\1\0\0\rDisabled\17AutoloadMode\nsetup\20session_manager\27session_manager.config\frequire\0" },
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/neovim-session-manager",
    url = "https://github.com/Shatur/neovim-session-manager"
  },
  ["nlsp-settings.nvim"] = {
    config = { "\27LJ\2\né\2\0\0\6\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0006\3\3\0009\3\4\0039\3\5\3'\5\6\0B\3\2\2'\4\a\0&\3\4\3=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0)local_settings_root_markers_fallback\1\2\0\0\t.git\16config_home\1\0\3\23local_settings_dir\19.nlsp-settings\vloader\tjson\27append_default_schemas\2\19/nlsp-settings\vconfig\fstdpath\afn\bvim\nsetup\17nlspsettings\frequire\0" },
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/nlsp-settings.nvim",
    url = "https://github.com/tamago324/nlsp-settings.nvim"
  },
  ["nui.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/opt/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nI\0\0\4\1\6\0\t6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2B\0\2\1K\0\1\0\1¿\nbufnr\1\0\0\vformat\bbuf\blsp\bvimé\2\1\2\a\1\r\0\0269\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19Ä6\2\2\0009\2\3\0029\2\4\0025\4\5\0-\5\0\0=\5\6\4=\1\a\4B\2\2\0016\2\2\0009\2\3\0029\2\b\2'\4\t\0005\5\n\0-\6\0\0=\6\6\5=\1\a\0053\6\v\0=\6\f\5B\2\3\0012\0\0ÄK\0\1\0\0¿\rcallback\0\1\0\1\tdesc\27Autoformat before save\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_methodÁ\1\1\0\a\0\15\0\0266\0\0\0009\0\1\0009\0\2\0'\2\3\0004\3\0\0B\0\3\0026\1\4\0'\3\5\0B\1\2\0029\2\6\0015\4\v\0004\5\3\0009\6\a\0019\6\b\0069\6\t\6>\6\1\0059\6\a\0019\6\b\0069\6\n\6>\6\2\5=\5\f\0043\5\r\0=\5\14\4B\2\2\0012\0\0ÄK\0\1\0\14on_attach\0\fsources\1\0\0\frustfmt\nblack\15formatting\rbuiltins\nsetup\fnull-ls\frequire\18LspFormatting\24nvim_create_augroup\bapi\bvim\0" },
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    cond = { "\27LJ\2\n?\0\0\1\0\4\0\t6\0\0\0009\0\1\0009\0\2\0\a\0\3\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\blua\rfiletype\abo\bvim\0" },
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-cmdline", "cmp-nvim-lsp", "cmp-nvim-lsp-signature-help", "cmp-path", "cmp_luasnip" },
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins.configs.cmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nù\2\0\0\a\1\20\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\0026\3\0\0'\5\6\0B\3\2\0029\3\a\3=\3\a\0025\3\17\0005\4\v\0005\5\t\0005\6\b\0=\6\n\5=\5\f\0045\5\14\0005\6\r\0=\6\15\5=\5\16\4=\4\18\3=\3\19\2B\0\2\1K\0\1\0\0\0\rsettings\18rust-analyzer\1\0\0\16diagnostics\rdisabled\1\0\0\1\2\0\0\18inactive-code\ncargo\1\0\0\17buildScripts\1\0\0\1\0\1\venable\2\14on_attach\vaerial\nflags\1\0\0\nsetup\18rust_analyzer\14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    after = { "playground", "nvim-ts-rainbow", "nvim-ts-autotag" },
    config = { "\27LJ\2\nÄ\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\frainbow\1\0\2\18extended_mode\2\venable\2\nident\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\1\0\3\17sync_install\1\21ensure_installed\ball\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\tocto\frequire\0" },
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    config = { "\27LJ\2\nw\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\15playground\1\0\0\1\0\2\15updatetime\3\25\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["pretty-fold.nvim"] = {
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/pretty-fold.nvim",
    url = "https://github.com/rudyardrichter/pretty-fold.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\n˚\2\0\0\b\0\18\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\6\0035\4\a\0=\4\b\3=\3\n\0025\3\15\0006\4\0\0'\6\v\0B\4\2\0029\4\f\0046\6\r\0006\a\14\0B\4\3\2=\4\16\3=\3\17\2B\0\2\1K\0\1\0\bdap\fadapter\1\0\0\17liblldb_path\18codelldb_path\25get_codelldb_adapter\19rust-tools.dap\ntools\1\0\0\16inlay_hints\1\0\4\22only_current_line\1\23other_hints_prefix\5\27parameter_hints_prefix\5\25show_parameter_hints\1\rexecutor\rtermopen\25rust-tools/executors\1\0\1\17autoSetHints\2\nsetup\15rust-tools\frequire\0" },
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.configs.telescope\frequire\0" },
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n°\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\nsigns\1\0\5\nerror\b‚úñ\nother\bÔÅö\16information\bÔÅö\thint\bÔÅö\fwarning\b‚úñ\1\0\2\fpadding\nfalse\tmode\floclist\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-python-pep8-indent"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/opt/vim-python-pep8-indent",
    url = "https://github.com/Vimjas/vim-python-pep8-indent"
  },
  vimtex = {
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n»\1\0\0\6\0\15\0\0206\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0019\1\3\0005\3\r\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\v\0=\5\f\4=\4\14\3B\1\2\1K\0\1\0\r<leader>\1\0\0\6s\1\0\1\tname\fSession\6p\1\0\1\tname\vPacker\6l\1\0\1\tname\bLsp\6d\1\0\0\1\0\1\tname\nDebug\rregister\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/rudyard/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^nui"] = "nui.nvim",
  ["^plenary"] = "plenary.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: neo-tree.nvim
time([[Setup for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0$neo_tree_remove_legacy_commands\6g\bvim\0", "setup", "neo-tree.nvim")
time([[Setup for neo-tree.nvim]], false)
time([[packadd for neo-tree.nvim]], true)
vim.cmd [[packadd neo-tree.nvim]]
time([[packadd for neo-tree.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vaerial\frequire\0", "config", "aerial.nvim")
time([[Config for aerial.nvim]], false)
-- Config for: nlsp-settings.nvim
time([[Config for nlsp-settings.nvim]], true)
try_loadstring("\27LJ\2\né\2\0\0\6\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0006\3\3\0009\3\4\0039\3\5\3'\5\6\0B\3\2\2'\4\a\0&\3\4\3=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0)local_settings_root_markers_fallback\1\2\0\0\t.git\16config_home\1\0\3\23local_settings_dir\19.nlsp-settings\vloader\tjson\27append_default_schemas\2\19/nlsp-settings\vconfig\fstdpath\afn\bvim\nsetup\17nlspsettings\frequire\0", "config", "nlsp-settings.nvim")
time([[Config for nlsp-settings.nvim]], false)
-- Config for: gruvbox.nvim
time([[Config for gruvbox.nvim]], true)
try_loadstring("\27LJ\2\n·\5\0\0\a\0.\0N6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0005\4\b\0005\5\6\0009\6\5\0=\6\a\5=\5\t\0045\5\n\0009\6\5\0=\6\a\5=\5\v\0045\5\f\0009\6\5\0=\6\a\5=\5\r\0045\5\14\0009\6\5\0=\6\a\5=\5\15\0045\5\16\0009\6\5\0=\6\a\5=\5\17\0045\5\18\0009\6\5\0=\6\a\5=\5\19\0045\5\20\0009\6\5\0=\6\a\5=\5\21\0045\5\22\0009\6\5\0=\6\a\5=\5\23\0045\5\25\0009\6\24\0=\6\26\0059\6\27\0=\6\a\5=\5\28\0045\5\29\0=\5\30\0045\5\31\0009\6\5\0=\6\a\5=\5 \0045\5!\0009\6\5\0=\6\26\0059\6\"\0=\6\a\5=\5#\0045\5$\0009\6\5\0=\6\a\5=\5%\0045\5&\0=\5'\4=\4(\3B\1\2\0016\1)\0009\1*\1'\3+\0B\1\2\0016\1)\0009\1*\1'\3,\0009\4-\0&\3\4\3B\1\2\1K\0\1\0\ndark40highlight IndentBlanklineContextChar guifg=\24colorscheme gruvbox\bcmd\bvim\14overrides\vString\1\0\1\vitalic\1\15SignColumn\1\0\0\vSearch\18bright_yellow\1\0\0\nPmenu\1\0\0\rOperator\1\0\1\vitalic\1\14IncSearch\16bright_blue\afg\1\0\0\ndark1\vFolded\1\0\0\22GruvboxOrangeSign\1\0\0\20GruvboxAquaSign\1\0\0\22GruvboxPurpleSign\1\0\0\20GruvboxBlueSign\1\0\0\22GruvboxYellowSign\1\0\0\21GruvboxGreenSign\1\0\0\19GruvboxRedSign\1\0\0\abg\1\0\0\ndark0\1\0\1\finverse\1\nsetup\fgruvbox\20gruvbox.palette\frequire\0", "config", "gruvbox.nvim")
time([[Config for gruvbox.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÄ\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\frainbow\1\0\2\18extended_mode\2\venable\2\nident\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\1\0\3\17sync_install\1\21ensure_installed\ball\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugins.configs.alpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.configs.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: neovim-session-manager
time([[Config for neovim-session-manager]], true)
try_loadstring("\27LJ\2\nó\1\0\0\5\0\b\0\r6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\6\0009\4\4\0009\4\5\4=\4\a\3B\1\2\1K\0\1\0\18autoload_mode\1\0\0\rDisabled\17AutoloadMode\nsetup\20session_manager\27session_manager.config\frequire\0", "config", "neovim-session-manager")
time([[Config for neovim-session-manager]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.configs.feline\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nI\0\0\4\1\6\0\t6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2B\0\2\1K\0\1\0\1¿\nbufnr\1\0\0\vformat\bbuf\blsp\bvimé\2\1\2\a\1\r\0\0269\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19Ä6\2\2\0009\2\3\0029\2\4\0025\4\5\0-\5\0\0=\5\6\4=\1\a\4B\2\2\0016\2\2\0009\2\3\0029\2\b\2'\4\t\0005\5\n\0-\6\0\0=\6\6\5=\1\a\0053\6\v\0=\6\f\5B\2\3\0012\0\0ÄK\0\1\0\0¿\rcallback\0\1\0\1\tdesc\27Autoformat before save\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_methodÁ\1\1\0\a\0\15\0\0266\0\0\0009\0\1\0009\0\2\0'\2\3\0004\3\0\0B\0\3\0026\1\4\0'\3\5\0B\1\2\0029\2\6\0015\4\v\0004\5\3\0009\6\a\0019\6\b\0069\6\t\6>\6\1\0059\6\a\0019\6\b\0069\6\n\6>\6\2\5=\5\f\0043\5\r\0=\5\14\4B\2\2\0012\0\0ÄK\0\1\0\14on_attach\0\fsources\1\0\0\frustfmt\nblack\15formatting\rbuiltins\nsetup\fnull-ls\frequire\18LspFormatting\24nvim_create_augroup\bapi\bvim\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nù\2\0\0\a\1\20\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\0026\3\0\0'\5\6\0B\3\2\0029\3\a\3=\3\a\0025\3\17\0005\4\v\0005\5\t\0005\6\b\0=\6\n\5=\5\f\0045\5\14\0005\6\r\0=\6\15\5=\5\16\4=\4\18\3=\3\19\2B\0\2\1K\0\1\0\0\0\rsettings\18rust-analyzer\1\0\0\16diagnostics\rdisabled\1\0\0\1\2\0\0\18inactive-code\ncargo\1\0\0\17buildScripts\1\0\0\1\0\1\venable\2\14on_attach\vaerial\nflags\1\0\0\nsetup\18rust_analyzer\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\tocto\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
try_loadstring("\27LJ\2\n˚\2\0\0\b\0\18\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\6\0035\4\a\0=\4\b\3=\3\n\0025\3\15\0006\4\0\0'\6\v\0B\4\2\0029\4\f\0046\6\r\0006\a\14\0B\4\3\2=\4\16\3=\3\17\2B\0\2\1K\0\1\0\bdap\fadapter\1\0\0\17liblldb_path\18codelldb_path\25get_codelldb_adapter\19rust-tools.dap\ntools\1\0\0\16inlay_hints\1\0\4\22only_current_line\1\23other_hints_prefix\5\27parameter_hints_prefix\5\25show_parameter_hints\1\rexecutor\rtermopen\25rust-tools/executors\1\0\1\17autoSetHints\2\nsetup\15rust-tools\frequire\0", "config", "rust-tools.nvim")
time([[Config for rust-tools.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n»\1\0\0\6\0\15\0\0206\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0019\1\3\0005\3\r\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\v\0=\5\f\4=\4\14\3B\1\2\1K\0\1\0\r<leader>\1\0\0\6s\1\0\1\tname\fSession\6p\1\0\1\tname\vPacker\6l\1\0\1\tname\bLsp\6d\1\0\0\1\0\1\tname\nDebug\rregister\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n°\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\nsigns\1\0\5\nerror\b‚úñ\nother\bÔÅö\16information\bÔÅö\thint\bÔÅö\fwarning\b‚úñ\1\0\2\fpadding\nfalse\tmode\floclist\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\23current_line_blame\1\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Conditional loads
time([[Conditional loading of nvim-autopairs]], true)
  require("packer.load")({"nvim-autopairs"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-autopairs]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-ts-autotag ]]
vim.cmd [[ packadd nvim-ts-rainbow ]]
vim.cmd [[ packadd playground ]]

-- Config for: playground
try_loadstring("\27LJ\2\nw\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\15playground\1\0\0\1\0\2\15updatetime\3\25\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "playground")

time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType python ++once lua require("packer.load")({'vim-python-pep8-indent'}, { ft = "python" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
