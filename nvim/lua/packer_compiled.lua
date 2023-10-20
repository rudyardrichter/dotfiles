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
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins.configs.cmp\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n¡\5\0\0\t\0!\0'6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0019\1\4\0019\2\5\0009\2\6\0025\4\a\0=\1\4\0049\5\2\0009\5\b\5'\a\t\0B\5\2\2=\5\n\0045\5\30\0005\6\f\0005\a\v\0=\a\r\0065\a\15\0005\b\14\0=\b\16\a=\a\17\0065\a\18\0=\a\19\0065\a\20\0005\b\21\0=\b\22\a=\a\23\0065\a\25\0005\b\24\0=\b\26\a=\a\27\0065\a\28\0=\a\29\6=\6\31\5=\5 \4B\2\2\1K\0\1\0\rsettings\18rust-analyzer\1\0\0\14procMacro\1\0\1\venable\1\16diagnostics\rdisabled\1\0\0\1\5\0\0\18inactive-code\22unresolved-import\16macro-error\26unresolved-proc-macro\16checkOnSave\20overrideCommand\1\a\0\0\ncargo\vclippy\16--workspace\26--message-format=json\18--all-targets\19--all-features\1\0\1\16allFeatures\2\ncheck\1\0\1\fcommand\vclippy\ncargo\17buildScripts\1\0\1\25loadOutDirsFromCheck\2\1\0\1\venable\2\vassist\1\0\0\1\0\2\17importPrefix\fby_self\22importGranularity\vmodule\rroot_dir\15Cargo.toml\17root_pattern\1\0\0\nsetup\18rust_analyzer\17capabilities\19default_config\tutil\14lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÃ\2\0\0\4\0\r\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0005\3\5\0=\3\6\0025\3\a\0=\3\b\0025\3\t\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\frainbow\1\0\2\venable\2\18extended_mode\2\nident\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\4\0\0\vpython\trust\15typescript\1\0\2\17auto_install\2\17sync_install\1\28nvim-treesitter.configs\nsetup\20nvim-treesitter\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
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
    config = { "\27LJ\2\n)\0\1\5\0\2\0\0059\1\0\0\18\3\1\0009\1\1\1)\4\3\0D\1\3\0\brep\14fill_char°\3\1\0\6\0\19\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0003\5\a\0>\5\6\4=\4\b\3=\3\n\0024\3\0\0=\3\v\0024\3\0\0=\3\f\0024\3\4\0005\4\r\0>\4\1\0035\4\14\0>\4\2\0035\4\15\0>\4\3\3=\3\16\0025\3\17\0=\3\18\2B\0\2\1K\0\1\0\14ft_ignore\1\2\0\0\nneorg\21matchup_patterns\1\3\0\0\a%[\6]\1\3\0\0\a%(\6)\1\3\0\0\6{\6}\15stop_words\18comment_signs\rsections\1\0\6\14fill_char\aÂ·\22add_close_pattern\1\26process_comment_signs\vspaces\21keep_indentation\2\24remove_fold_markers\2\14fill_left\1\nright\0\1\6\0\0\6 \27number_of_folded_lines\a: \15percentage\6 \tleft\1\0\0\1\2\0\0\fcontent\nsetup\16pretty-fold\frequire\0" },
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/pretty-fold.nvim",
    url = "https://github.com/rudyardrichter/pretty-fold.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/rr/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n¡\5\0\0\t\0!\0'6\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0019\1\4\0019\2\5\0009\2\6\0025\4\a\0=\1\4\0049\5\2\0009\5\b\5'\a\t\0B\5\2\2=\5\n\0045\5\30\0005\6\f\0005\a\v\0=\a\r\0065\a\15\0005\b\14\0=\b\16\a=\a\17\0065\a\18\0=\a\19\0065\a\20\0005\b\21\0=\b\22\a=\a\23\0065\a\25\0005\b\24\0=\b\26\a=\a\27\0065\a\28\0=\a\29\6=\6\31\5=\5 \4B\2\2\1K\0\1\0\rsettings\18rust-analyzer\1\0\0\14procMacro\1\0\1\venable\1\16diagnostics\rdisabled\1\0\0\1\5\0\0\18inactive-code\22unresolved-import\16macro-error\26unresolved-proc-macro\16checkOnSave\20overrideCommand\1\a\0\0\ncargo\vclippy\16--workspace\26--message-format=json\18--all-targets\19--all-features\1\0\1\16allFeatures\2\ncheck\1\0\1\fcommand\vclippy\ncargo\17buildScripts\1\0\1\25loadOutDirsFromCheck\2\1\0\1\venable\2\vassist\1\0\0\1\0\2\17importPrefix\fby_self\22importGranularity\vmodule\rroot_dir\15Cargo.toml\17root_pattern\1\0\0\nsetup\18rust_analyzer\17capabilities\19default_config\tutil\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÃ\2\0\0\4\0\r\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0005\3\5\0=\3\6\0025\3\a\0=\3\b\0025\3\t\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\frainbow\1\0\2\venable\2\18extended_mode\2\nident\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\4\0\0\vpython\trust\15typescript\1\0\2\17auto_install\2\17sync_install\1\28nvim-treesitter.configs\nsetup\20nvim-treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: pretty-fold.nvim
time([[Config for pretty-fold.nvim]], true)
try_loadstring("\27LJ\2\n)\0\1\5\0\2\0\0059\1\0\0\18\3\1\0009\1\1\1)\4\3\0D\1\3\0\brep\14fill_char°\3\1\0\6\0\19\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0003\5\a\0>\5\6\4=\4\b\3=\3\n\0024\3\0\0=\3\v\0024\3\0\0=\3\f\0024\3\4\0005\4\r\0>\4\1\0035\4\14\0>\4\2\0035\4\15\0>\4\3\3=\3\16\0025\3\17\0=\3\18\2B\0\2\1K\0\1\0\14ft_ignore\1\2\0\0\nneorg\21matchup_patterns\1\3\0\0\a%[\6]\1\3\0\0\a%(\6)\1\3\0\0\6{\6}\15stop_words\18comment_signs\rsections\1\0\6\14fill_char\aÂ·\22add_close_pattern\1\26process_comment_signs\vspaces\21keep_indentation\2\24remove_fold_markers\2\14fill_left\1\nright\0\1\6\0\0\6 \27number_of_folded_lines\a: \15percentage\6 \tleft\1\0\0\1\2\0\0\fcontent\nsetup\16pretty-fold\frequire\0", "config", "pretty-fold.nvim")
time([[Config for pretty-fold.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins.configs.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)

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
