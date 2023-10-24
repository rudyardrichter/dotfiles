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
local package_path_str = "/Users/rr/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/rr/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/rr/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/rr/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/rr/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugins.configs.luasnip\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-omni"] = {
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/cmp-omni",
    url = "https://github.com/hrsh7th/cmp-omni"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot-cmp"] = {
    config = { "\27LJ\2\nw\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\1'\2\5\0=\2\4\0019\1\6\0004\3\0\0B\1\2\1K\0\1\0\nsetup\26http://localhost:5001\18copilot_proxy\6g\bvim\16copilot_cmp\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    config = { "\27LJ\2\n•\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\15suggestion\1\0\1\fenabled\1\npanel\vkeymap\1\0\0\1\0\4\14jump_next\n<Tab>\frefresh\6r\14jump_prev\f<S-Tab>\topen\n<C-l>\14filetypes\1\0\0\1\0\v\btex\2\rmarkdown\2\ago\2\nlatex\2\tyaml\2\15typescript\2\fhaskell\2\trust\2\vpython\2\6*\1\blua\2\nsetup\fcopilot\frequire-\1\0\4\0\3\0\0066\0\0\0009\0\1\0003\2\2\0)\3d\0B\0\3\1K\0\1\0\0\rdefer_fn\bvim\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.configs.feline\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/freddiehaddad/feline.nvim"
  },
  ["friendly-snippets"] = {
    config = { "\27LJ\2\n‡\1\0\0\3\0\4\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0 luasnip.loaders.from_vscode\14lazy_load\"luasnip.loaders.from_snipmate\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n¥\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\28current_line_blame_opts\1\0\2\23virt_text_priority\3\0\ndelay\3\3\1\0\3\15signcolumn\2\nnumhl\2\23current_line_blame\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    config = { "\27LJ\2\nÉ\4\0\0\a\0%\0;6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\1\0B\1\2\0029\1\3\0015\3\4\0005\4\b\0005\5\6\0009\6\5\0=\6\a\5=\5\t\0045\5\n\0=\5\v\0045\5\f\0009\6\5\0=\6\a\5=\5\r\0045\5\15\0009\6\14\0=\6\16\0059\6\17\0=\6\a\5=\5\18\0045\5\19\0009\6\14\0=\6\16\0059\6\20\0=\6\a\5=\5\21\0045\5\22\0=\5\23\0045\5\24\0009\6\5\0=\6\a\5=\5\25\0045\5\27\0009\6\26\0=\6\16\5=\5\28\0045\5\29\0009\6\5\0=\6\a\5=\5\30\4=\4\31\3B\1\2\0016\1 \0009\1!\1'\3\"\0B\1\2\0016\1 \0009\1!\1'\3#\0009\4$\0&\3\4\3B\1\2\1K\0\1\0\ndark40highlight IndentBlanklineContextChar guifg=\24colorscheme gruvbox\bcmd\bvim\14overrides\16NormalFloat\1\0\0\vString\1\0\1\vitalic\1\ngreen\15SignColumn\1\0\0\14CurSearch\1\0\1\tlink\14IncSearch\14IncSearch\vorange\1\0\1\freverse\2\vSearch\vyellow\afg\1\0\1\freverse\2\bbg0\nPmenu\1\0\0\rOperator\1\0\1\vitalic\1\vFolded\1\0\0\abg\1\0\0\ndark0\1\0\2\21transparent_mode\2\finverse\1\nsetup\fpalette\fgruvbox\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    after = { "nvim-lspconfig" },
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    after = { "nvim-lspconfig" },
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\nê\1\0\0\4\0\t\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0005\3\a\0=\3\b\2B\0\2\1K\0\1\0\tview\1\0\1\18adaptive_size\2\1\0\6\15update_cwd\1\16open_on_tab\2\17hijack_netrw\2\18disable_netrw\2\25close_if_last_window\2\15auto_close\2\nsetup\rneo-tree\frequire$neo_tree_remove_legacy_commands\6g\bvim\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["neovim-session-manager"] = {
    config = { "\27LJ\2\nd\0\0\4\0\4\0\n6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0014\3\0\0B\1\2\1K\0\1\0\nsetup\20session_manager\27session_manager.config\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/neovim-session-manager",
    url = "https://github.com/Shatur/neovim-session-manager"
  },
  ["nui.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/opt/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nI\0\0\4\1\6\0\t6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2B\0\2\1K\0\1\0\1À\nbufnr\1\0\0\vformat\bbuf\blsp\bvimŽ\2\1\2\a\1\r\0\0269\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19€6\2\2\0009\2\3\0029\2\4\0025\4\5\0-\5\0\0=\5\6\4=\1\a\4B\2\2\0016\2\2\0009\2\3\0029\2\b\2'\4\t\0005\5\n\0-\6\0\0=\6\6\5=\1\a\0053\6\v\0=\6\f\5B\2\3\0012\0\0€K\0\1\0\1À\rcallback\0\1\0\1\tdesc\27Autoformat before save\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_methodŸ\4\1\0\n\0\30\00086\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0004\4\0\0B\1\3\0029\2\6\0005\4\22\0004\5\5\0009\6\a\0009\6\b\0069\6\t\6>\6\1\0055\6\n\0009\a\v\0009\a\f\a=\a\r\0065\a\14\0=\a\15\0066\a\0\0'\t\16\0B\a\2\0029\a\17\a5\t\18\0B\a\2\2=\a\19\6>\6\2\0059\6\a\0009\6\b\0069\6\20\6>\6\3\0059\6\a\0009\6\b\0069\6\21\6>\6\4\5=\5\23\0049\5\a\0009\5\b\0059\5\24\5>\5\1\0049\5\a\0009\5\b\0059\5\25\5>\5\2\0049\5\a\0009\5\26\0059\5\27\5>\5\3\0043\5\28\0=\5\29\4B\2\2\0012\0\0€K\0\1\0\14on_attach\0\vchktex\16diagnostics\rprettier\reslint_d\fsources\1\0\0\18terraform_fmt\nisort\14generator\1\0\2\rto_stdin\2\fcommand\18blackd-client\22formatter_factory\20null-ls.helpers\14filetypes\1\2\0\0\vpython\vmethod\15FORMATTING\fmethods\1\0\1\tname\vblackd\frustfmt\15formatting\rbuiltins\nsetup\18LspFormatting\24nvim_create_augroup\bapi\bvim\fnull-ls\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins.configs.cmp\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    after = { "rust-tools.nvim" },
    config = { "\27LJ\2\nO\0\2\a\0\5\0\b6\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\1K\0\1\0\5\15formatexpr\24nvim_buf_set_option\bapi\bvimÖ\a\1\0\t\0005\0O6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\1'\3\4\0009\4\5\0009\4\6\0049\4\a\0046\5\0\0'\a\b\0B\5\2\0029\5\t\5B\5\1\0A\1\2\0029\2\n\0009\2\v\0025\4\f\0=\1\a\0046\5\r\0=\5\r\0045\5!\0005\6\15\0005\a\14\0=\a\16\0065\a\18\0005\b\17\0=\b\19\a=\a\20\0065\a\21\0=\a\22\0065\a\23\0005\b\24\0=\b\25\a=\a\26\0065\a\28\0005\b\27\0=\b\29\a=\a\30\0065\a\31\0=\a \6=\6\"\5=\5#\4B\2\2\0019\2$\0009\2\v\0025\4%\0=\1\a\0046\5\r\0=\5\r\0043\5&\0=\5'\4B\2\2\0019\2(\0009\2\v\0025\4)\0=\1\a\4B\2\2\0019\2*\0009\2\v\0025\4+\0=\1\a\0045\0050\0006\6\2\0009\6,\0069\6-\6'\b.\0B\6\2\2'\a/\0&\6\a\6=\0061\5=\0052\4B\2\2\0019\0023\0009\2\v\0025\0044\0=\1\a\4B\2\2\1K\0\1\0\1\0\0\rtsserver\16latexindent\nlocal\1\0\0\22/latexindent.yaml\vconfig\fstdpath\afn\1\0\0\vtexlab\1\0\0\16terraformls\14on_attach\0\1\0\0\fpyright\rsettings\18rust-analyzer\1\0\0\14procMacro\1\0\1\venable\1\16diagnostics\rdisabled\1\0\0\1\5\0\0\18inactive-code\22unresolved-import\16macro-error\26unresolved-proc-macro\16checkOnSave\20overrideCommand\1\a\0\0\ncargo\vclippy\16--workspace\26--message-format=json\18--all-targets\19--all-features\1\0\1\16allFeatures\2\ncheck\1\0\1\fcommand\vclippy\ncargo\17buildScripts\1\0\1\25loadOutDirsFromCheck\2\1\0\1\venable\2\vassist\1\0\0\1\0\2\17importPrefix\fby_self\22importGranularity\vmodule\nflags\1\0\0\nsetup\18rust_analyzer\25default_capabilities\17cmp_nvim_lsp\17capabilities\19default_config\tutil\nforce\20tbl_deep_extend\bvim\14lspconfig\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÃ\2\0\0\4\0\r\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0005\3\5\0=\3\6\0025\3\a\0=\3\b\0025\3\t\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\frainbow\1\0\2\18extended_mode\2\venable\2\nident\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\4\0\0\vpython\trust\15typescript\1\0\2\17sync_install\1\17auto_install\2\28nvim-treesitter.configs\nsetup\20nvim-treesitter\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\2\nE\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\ftimeout\3 œ\1\nsetup\tocto\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["pretty-fold.nvim"] = {
    config = { "\27LJ\2\n)\0\1\5\0\2\0\0059\1\0\0\18\3\1\0009\1\1\1)\4\3\0D\1\3\0\brep\14fill_char°\3\1\0\6\0\19\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0003\5\a\0>\5\6\4=\4\b\3=\3\n\0024\3\0\0=\3\v\0024\3\0\0=\3\f\0024\3\4\0005\4\r\0>\4\1\0035\4\14\0>\4\2\0035\4\15\0>\4\3\3=\3\16\0025\3\17\0=\3\18\2B\0\2\1K\0\1\0\14ft_ignore\1\2\0\0\nneorg\21matchup_patterns\1\3\0\0\a%[\6]\1\3\0\0\a%(\6)\1\3\0\0\6{\6}\15stop_words\18comment_signs\rsections\1\0\6\22add_close_pattern\1\26process_comment_signs\vspaces\21keep_indentation\2\24remove_fold_markers\2\14fill_left\1\14fill_char\aÂ·\nright\0\1\6\0\0\6 \27number_of_folded_lines\a: \15percentage\6 \tleft\1\0\0\1\2\0\0\fcontent\nsetup\16pretty-fold\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/pretty-fold.nvim",
    url = "https://github.com/rudyardrichter/pretty-fold.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\nû\2\0\0\b\0\18\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\6\0035\4\a\0=\4\b\3=\3\n\0025\3\15\0006\4\0\0'\6\v\0B\4\2\0029\4\f\0046\6\r\0006\a\14\0B\4\3\2=\4\16\3=\3\17\2B\0\2\1K\0\1\0\bdap\fadapter\1\0\0\17liblldb_path\18codelldb_path\25get_codelldb_adapter\19rust-tools.dap\ntools\1\0\0\16inlay_hints\1\0\4\22only_current_line\1\23other_hints_prefix\5\27parameter_hints_prefix\5\25show_parameter_hints\2\rexecutor\rtermopen\25rust-tools/executors\1\0\1\17autoSetHints\2\nsetup\15rust-tools\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/opt/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    cond = { true },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n®\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\nsigns\1\0\5\16information\bï€\thint\bï€\fwarning\bâœ–\nother\bï€\nerror\bâœ–\1\0\2\tmode\25document_diagnostics\fpadding\nfalse\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nž\1\0\0\6\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\3B\1\2\0016\1\0\0'\3\b\0B\1\2\1K\0\1\0\29plugins.configs.whichkey\vwindow\1\0\0\vmargin\1\5\0\0\3\4\3\b\3\4\3\b\1\0\1\vborder\vsingle\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^nui"] = "nui.nvim"
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

-- Config for: friendly-snippets
time([[Config for friendly-snippets]], true)
try_loadstring("\27LJ\2\n‡\1\0\0\3\0\4\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0 luasnip.loaders.from_vscode\14lazy_load\"luasnip.loaders.from_snipmate\frequire\0", "config", "friendly-snippets")
time([[Config for friendly-snippets]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÃ\2\0\0\4\0\r\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0005\3\5\0=\3\6\0025\3\a\0=\3\b\0025\3\t\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\frainbow\1\0\2\18extended_mode\2\venable\2\nident\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\4\0\0\vpython\trust\15typescript\1\0\2\17sync_install\1\17auto_install\2\28nvim-treesitter.configs\nsetup\20nvim-treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\2\nE\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\ftimeout\3 œ\1\nsetup\tocto\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\nê\1\0\0\4\0\t\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0005\3\a\0=\3\b\2B\0\2\1K\0\1\0\tview\1\0\1\18adaptive_size\2\1\0\6\15update_cwd\1\16open_on_tab\2\17hijack_netrw\2\18disable_netrw\2\25close_if_last_window\2\15auto_close\2\nsetup\rneo-tree\frequire$neo_tree_remove_legacy_commands\6g\bvim\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: neovim-session-manager
time([[Config for neovim-session-manager]], true)
try_loadstring("\27LJ\2\nd\0\0\4\0\4\0\n6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0014\3\0\0B\1\2\1K\0\1\0\nsetup\20session_manager\27session_manager.config\frequire\0", "config", "neovim-session-manager")
time([[Config for neovim-session-manager]], false)
-- Config for: copilot-cmp
time([[Config for copilot-cmp]], true)
try_loadstring("\27LJ\2\nw\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\1'\2\5\0=\2\4\0019\1\6\0004\3\0\0B\1\2\1K\0\1\0\nsetup\26http://localhost:5001\18copilot_proxy\6g\bvim\16copilot_cmp\frequire\0", "config", "copilot-cmp")
time([[Config for copilot-cmp]], false)
-- Config for: pretty-fold.nvim
time([[Config for pretty-fold.nvim]], true)
try_loadstring("\27LJ\2\n)\0\1\5\0\2\0\0059\1\0\0\18\3\1\0009\1\1\1)\4\3\0D\1\3\0\brep\14fill_char°\3\1\0\6\0\19\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0003\5\a\0>\5\6\4=\4\b\3=\3\n\0024\3\0\0=\3\v\0024\3\0\0=\3\f\0024\3\4\0005\4\r\0>\4\1\0035\4\14\0>\4\2\0035\4\15\0>\4\3\3=\3\16\0025\3\17\0=\3\18\2B\0\2\1K\0\1\0\14ft_ignore\1\2\0\0\nneorg\21matchup_patterns\1\3\0\0\a%[\6]\1\3\0\0\a%(\6)\1\3\0\0\6{\6}\15stop_words\18comment_signs\rsections\1\0\6\22add_close_pattern\1\26process_comment_signs\vspaces\21keep_indentation\2\24remove_fold_markers\2\14fill_left\1\14fill_char\aÂ·\nright\0\1\6\0\0\6 \27number_of_folded_lines\a: \15percentage\6 \tleft\1\0\0\1\2\0\0\fcontent\nsetup\16pretty-fold\frequire\0", "config", "pretty-fold.nvim")
time([[Config for pretty-fold.nvim]], false)
-- Config for: copilot.lua
time([[Config for copilot.lua]], true)
try_loadstring("\27LJ\2\n•\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\15suggestion\1\0\1\fenabled\1\npanel\vkeymap\1\0\0\1\0\4\14jump_next\n<Tab>\frefresh\6r\14jump_prev\f<S-Tab>\topen\n<C-l>\14filetypes\1\0\0\1\0\v\btex\2\rmarkdown\2\ago\2\nlatex\2\tyaml\2\15typescript\2\fhaskell\2\trust\2\vpython\2\6*\1\blua\2\nsetup\fcopilot\frequire-\1\0\4\0\3\0\0066\0\0\0009\0\1\0003\2\2\0)\3d\0B\0\3\1K\0\1\0\0\rdefer_fn\bvim\0", "config", "copilot.lua")
time([[Config for copilot.lua]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.configs.feline\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n¥\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\28current_line_blame_opts\1\0\2\23virt_text_priority\3\0\ndelay\3\3\1\0\3\15signcolumn\2\nnumhl\2\23current_line_blame\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n®\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\nsigns\1\0\5\16information\bï€\thint\bï€\fwarning\bâœ–\nother\bï€\nerror\bâœ–\1\0\2\tmode\25document_diagnostics\fpadding\nfalse\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: gruvbox.nvim
time([[Config for gruvbox.nvim]], true)
try_loadstring("\27LJ\2\nÉ\4\0\0\a\0%\0;6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\1\0B\1\2\0029\1\3\0015\3\4\0005\4\b\0005\5\6\0009\6\5\0=\6\a\5=\5\t\0045\5\n\0=\5\v\0045\5\f\0009\6\5\0=\6\a\5=\5\r\0045\5\15\0009\6\14\0=\6\16\0059\6\17\0=\6\a\5=\5\18\0045\5\19\0009\6\14\0=\6\16\0059\6\20\0=\6\a\5=\5\21\0045\5\22\0=\5\23\0045\5\24\0009\6\5\0=\6\a\5=\5\25\0045\5\27\0009\6\26\0=\6\16\5=\5\28\0045\5\29\0009\6\5\0=\6\a\5=\5\30\4=\4\31\3B\1\2\0016\1 \0009\1!\1'\3\"\0B\1\2\0016\1 \0009\1!\1'\3#\0009\4$\0&\3\4\3B\1\2\1K\0\1\0\ndark40highlight IndentBlanklineContextChar guifg=\24colorscheme gruvbox\bcmd\bvim\14overrides\16NormalFloat\1\0\0\vString\1\0\1\vitalic\1\ngreen\15SignColumn\1\0\0\14CurSearch\1\0\1\tlink\14IncSearch\14IncSearch\vorange\1\0\1\freverse\2\vSearch\vyellow\afg\1\0\1\freverse\2\bbg0\nPmenu\1\0\0\rOperator\1\0\1\vitalic\1\vFolded\1\0\0\abg\1\0\0\ndark0\1\0\2\21transparent_mode\2\finverse\1\nsetup\fpalette\fgruvbox\frequire\0", "config", "gruvbox.nvim")
time([[Config for gruvbox.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nž\1\0\0\6\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\3B\1\2\0016\1\0\0'\3\b\0B\1\2\1K\0\1\0\29plugins.configs.whichkey\vwindow\1\0\0\vmargin\1\5\0\0\3\4\3\b\3\4\3\b\1\0\1\vborder\vsingle\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins.configs.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugins.configs.luasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nI\0\0\4\1\6\0\t6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2B\0\2\1K\0\1\0\1À\nbufnr\1\0\0\vformat\bbuf\blsp\bvimŽ\2\1\2\a\1\r\0\0269\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19€6\2\2\0009\2\3\0029\2\4\0025\4\5\0-\5\0\0=\5\6\4=\1\a\4B\2\2\0016\2\2\0009\2\3\0029\2\b\2'\4\t\0005\5\n\0-\6\0\0=\6\6\5=\1\a\0053\6\v\0=\6\f\5B\2\3\0012\0\0€K\0\1\0\1À\rcallback\0\1\0\1\tdesc\27Autoformat before save\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_methodŸ\4\1\0\n\0\30\00086\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0004\4\0\0B\1\3\0029\2\6\0005\4\22\0004\5\5\0009\6\a\0009\6\b\0069\6\t\6>\6\1\0055\6\n\0009\a\v\0009\a\f\a=\a\r\0065\a\14\0=\a\15\0066\a\0\0'\t\16\0B\a\2\0029\a\17\a5\t\18\0B\a\2\2=\a\19\6>\6\2\0059\6\a\0009\6\b\0069\6\20\6>\6\3\0059\6\a\0009\6\b\0069\6\21\6>\6\4\5=\5\23\0049\5\a\0009\5\b\0059\5\24\5>\5\1\0049\5\a\0009\5\b\0059\5\25\5>\5\2\0049\5\a\0009\5\26\0059\5\27\5>\5\3\0043\5\28\0=\5\29\4B\2\2\0012\0\0€K\0\1\0\14on_attach\0\vchktex\16diagnostics\rprettier\reslint_d\fsources\1\0\0\18terraform_fmt\nisort\14generator\1\0\2\rto_stdin\2\fcommand\18blackd-client\22formatter_factory\20null-ls.helpers\14filetypes\1\2\0\0\vpython\vmethod\15FORMATTING\fmethods\1\0\1\tname\vblackd\frustfmt\15formatting\rbuiltins\nsetup\18LspFormatting\24nvim_create_augroup\bapi\bvim\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Conditional loads
time([[Conditional loading of telescope-fzf-native.nvim]], true)
  require("packer.load")({"telescope-fzf-native.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of telescope-fzf-native.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-lspconfig ]]

-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\nO\0\2\a\0\5\0\b6\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\1K\0\1\0\5\15formatexpr\24nvim_buf_set_option\bapi\bvimÖ\a\1\0\t\0005\0O6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\1'\3\4\0009\4\5\0009\4\6\0049\4\a\0046\5\0\0'\a\b\0B\5\2\0029\5\t\5B\5\1\0A\1\2\0029\2\n\0009\2\v\0025\4\f\0=\1\a\0046\5\r\0=\5\r\0045\5!\0005\6\15\0005\a\14\0=\a\16\0065\a\18\0005\b\17\0=\b\19\a=\a\20\0065\a\21\0=\a\22\0065\a\23\0005\b\24\0=\b\25\a=\a\26\0065\a\28\0005\b\27\0=\b\29\a=\a\30\0065\a\31\0=\a \6=\6\"\5=\5#\4B\2\2\0019\2$\0009\2\v\0025\4%\0=\1\a\0046\5\r\0=\5\r\0043\5&\0=\5'\4B\2\2\0019\2(\0009\2\v\0025\4)\0=\1\a\4B\2\2\0019\2*\0009\2\v\0025\4+\0=\1\a\0045\0050\0006\6\2\0009\6,\0069\6-\6'\b.\0B\6\2\2'\a/\0&\6\a\6=\0061\5=\0052\4B\2\2\0019\0023\0009\2\v\0025\0044\0=\1\a\4B\2\2\1K\0\1\0\1\0\0\rtsserver\16latexindent\nlocal\1\0\0\22/latexindent.yaml\vconfig\fstdpath\afn\1\0\0\vtexlab\1\0\0\16terraformls\14on_attach\0\1\0\0\fpyright\rsettings\18rust-analyzer\1\0\0\14procMacro\1\0\1\venable\1\16diagnostics\rdisabled\1\0\0\1\5\0\0\18inactive-code\22unresolved-import\16macro-error\26unresolved-proc-macro\16checkOnSave\20overrideCommand\1\a\0\0\ncargo\vclippy\16--workspace\26--message-format=json\18--all-targets\19--all-features\1\0\1\16allFeatures\2\ncheck\1\0\1\fcommand\vclippy\ncargo\17buildScripts\1\0\1\25loadOutDirsFromCheck\2\1\0\1\venable\2\vassist\1\0\0\1\0\2\17importPrefix\fby_self\22importGranularity\vmodule\nflags\1\0\0\nsetup\18rust_analyzer\25default_capabilities\17cmp_nvim_lsp\17capabilities\19default_config\tutil\nforce\20tbl_deep_extend\bvim\14lspconfig\frequire\0", "config", "nvim-lspconfig")

vim.cmd [[ packadd rust-tools.nvim ]]

-- Config for: rust-tools.nvim
try_loadstring("\27LJ\2\nû\2\0\0\b\0\18\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\6\0035\4\a\0=\4\b\3=\3\n\0025\3\15\0006\4\0\0'\6\v\0B\4\2\0029\4\f\0046\6\r\0006\a\14\0B\4\3\2=\4\16\3=\3\17\2B\0\2\1K\0\1\0\bdap\fadapter\1\0\0\17liblldb_path\18codelldb_path\25get_codelldb_adapter\19rust-tools.dap\ntools\1\0\0\16inlay_hints\1\0\4\22only_current_line\1\23other_hints_prefix\5\27parameter_hints_prefix\5\25show_parameter_hints\2\rexecutor\rtermopen\25rust-tools/executors\1\0\1\17autoSetHints\2\nsetup\15rust-tools\frequire\0", "config", "rust-tools.nvim")

time([[Sequenced loading]], false)

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
