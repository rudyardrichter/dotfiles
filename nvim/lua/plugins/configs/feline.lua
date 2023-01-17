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
  elseif mode == "COMMAND" then
    mode = "COMMAND"
  end
  return mode
end

local function word_count()
  return tostring(vim.fn.wordcount().words) .. "w "
end

local function any_git_changes()
  local git_info = vim.b.gitsigns_status_dict
  if git_info == nil then
    return false
  else
    return (
      (git_info["added"] ~= nil and git_info["added"] > 0)
      or (git_info["changed"] ~= nil and git_info["changed"] > 0)
      or (git_info["removed"] ~= nil and git_info["removed"] > 0)
    )
  end
end

local components = {
  {
    {
      provider = function()
        return " " .. vi_mode_name() .. " "
      end,
      hl = function()
        return {
          fg = C.dark0,
          bg = vi.get_mode_color(),
          style = "bold",
        }
      end,
      style = "bold",
    },
    { provider = " ", hl = { bg = git_bg }, enabled = git.git_info_exists },
    {
      name = "git_branch",
      provider = "git_branch",
      short_provider = "",
      priority = 1,
      hl = { fg = C.bright_aqua, bg = git_bg },
      icon = " ",
    },
    {
      provider = " ",
      short_provider = "",
      priority = 0,
      hl = { bg = git_bg },
      enabled = function()
        return git.git_info_exists() and not any_git_changes()
      end,
    },
    {
      provider = "git_diff_added",
      hl = { fg = C.bright_green, bg = git_bg },
      icon = " +",
    },
    {
      provider = "git_diff_changed",
      hl = { fg = C.bright_yellow, bg = git_bg },
      icon = " ~",
    },
    {
      provider = "git_diff_removed",
      hl = { fg = C.bright_red, bg = git_bg },
      icon = " -",
    },
    {
      provider = " ",
      hl = { bg = git_bg },
      enabled = any_git_changes,
    },
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
    {
      provider = function(_, opts) 
        return word_count()
      end,
      enabled = function()
        local fts = {markdown = true, text = true}
        return fts[vim.bo.filetype] ~= nil
      end,
    },
    {
      provider = {
        name = "file_type",
        opts = { filetype_icon = true, case = "lowercase" }
      },
      truncate_hide = true,
      priority = 0,
      enabled = has_filetype,
    },
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
