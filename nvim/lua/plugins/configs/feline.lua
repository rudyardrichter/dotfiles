local C = require("gruvbox.palette")
local feline = require("feline")
local vi = require("feline.providers.vi_mode")
local git = require("feline.providers.git")
local hl = function(name)
  local v = vim.api.nvim_get_hl_by_name(name, true)
  local fg
  if v.foreground == nil then
    fg = nil
  else
    fg = string.format("#%06x", v.foreground)
  end
  local bg
  if v.background == nil then
    bg = nil
  else
    bg = string.format("#%06x", v.background)
  end
  return { fg = fg, bg = bg }
end
local git_bg = C.dark2
local has_filetype = function()
  return vim.fn.empty(vim.fn.expand "%:t") ~= 1 and vim.bo.filetype and vim.bo.filetype ~= ""
end
local vi_mode_colors = {
  NORMAL = C.bright_blue,
  OP = C.bright_blue,
  INSERT = C.bright_yellow,
  VISUAL = C.bright_purple,
  LINES = C.bright_purple,
  BLOCK = C.bright_purple,
  REPLACE = C.bright_red,
  ["V-REPLACE"] = nil,
  ENTER = nil,
  MORE = nil,
  SELECT = nil,
  COMMAND = C.bright_green,
  SHELL = nil,
  TERM = nil,
  NONE = nil,
}
local vi_mode_name = function()
  local mode = vi.get_vim_mode()
  if mode == "LINES" then
    mode = "VLINES"
  elseif mode == "BLOCK" then
    mode = "VBLOCK"
  end
  return mode
end

local components = {
  {
    {
      provider = function()
        return " " .. vi_mode_name() .. " "
      end,
      hl = function()
        return {
          fg = hl("WildMenu").bg,
          bg = vi.get_mode_color(),
          style = "bold",
        }
      end,
      style = "bold",
    },
    { provider = " ", hl = { bg = git_bg }, enabled = git.git_info_exists },
    {
      provider = "git_branch", hl = { fg = hl("Identifier").fg, bg = git_bg }, icon = " "
    },
    {
      provider = " ",
      hl = { bg = git_bg },
      enabled = function()
        return git.git_info_exists() and not git.git_diff_changed()
      end,
    },
    { provider = "git_diff_added", hl = { fg = hl("GitSignsAdd").fg, bg = git_bg }, icon = " +" }, -- 
    { provider = "git_diff_changed", hl = { fg = hl("GitSignsChange").fg, bg = git_bg }, icon = " ~" }, -- 柳
    { provider = "git_diff_removed", hl = { fg = hl("GitSignsDelete").fg, bg = git_bg }, icon = " -" }, -- 
    { provider = " ", hl = { bg = git_bg }, enabled = function() return git.git_info_exists() and git.git_diff_changed() end },
    { provider = " " },
    { provider = { name = "file_info", opts = { type = "relative", file_modified_icon = "", file_readonly_icon = " " }}, icon = "" },
    {
      provider = " δ",
      hl = { fg = "orange", style = "bold" },
      enabled = function()
        return vim.bo.modified
      end,
    },
    { provider = "diagnostic_errors", hl = { fg = hl("DiagnosticError").fg }, icon = "  " },
    { provider = "diagnostic_warnings", hl = { fg = hl("DiagnosticWarn").fg }, icon = "  " },
    { provider = "diagnostic_info", hl = { fg = hl("DiagnosticInfo").fg }, icon = "  " },
    { provider = "diagnostic_hints", hl = { fg = hl("DiagnosticHint").fg }, icon = "  " },
  },
  {},
  {
    { provider = { name = "file_type", opts = { filetype_icon = true, case = "lowercase" } }, enabled = has_filetype },
    { provider = " ", enabled = has_filetype },
    -- { provider = provider.lsp_progress, hl = { fg = C.light4 }, enabled = conditional.bar_width() },
    -- { provider = provider.lsp_client_names(true), short_provider = provider.lsp_client_names(), hl = { fg = C.light4 }, enabled = conditional.bar_width(), icon = "   " },
    -- { provider = " ", enabled = conditional.bar_width() },
    -- { provider = provider.treesitter_status, enabled = conditional.bar_width(), hl = hl.fg("GitSignsAdd", { fg = C.green }) },
    { provider = "  ", },
    { provider = "position" },
    { provider = " " },
    -- Reversed scroll bar is a bit buggy, with extra pixels hanging out
    -- {
    --   provider = { name = "scroll_bar", opts = { reverse = true } },
    --   hl = function()
    --     return {
    --       bg = vi.get_mode_color(),
    --       fg = "black",
    --       style = "bold",
    --     }
    --   end,
    -- },
    -- {
    {
      provider = "scroll_bar",
      hl = function()
        return {
          fg = vi.get_mode_color(),
        }
      end,
    },
  }
}

feline.setup{
  theme = {
    fg = C.light4,
    bg = C.dark1,
  },
  components = {
    active = components,
    inactive = components,
  },
  vi_mode_colors = vi_mode_colors,
}
