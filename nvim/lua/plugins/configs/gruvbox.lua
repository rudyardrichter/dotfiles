local gruvbox = require("gruvbox")
local config = gruvbox.config
local palette = require("gruvbox.palette")
local colors = palette.get_base_colors(vim.o.background, config.contrast)
gruvbox.setup({
  italic = {strings = false},
  overrides = {
    Folded = {bg = colors.bg0},
    SignColumn = {bg = colors.bg0},
    GruvboxRedSign = {bg = colors.bg0},
    GruvboxGreenSign = {bg = colors.bg0},
    GruvboxYellowSign = {bg = colors.bg0},
    GruvboxBlueSign = {bg = colors.bg0},
    GruvboxPurpleSign = {bg = colors.bg0},
    GruvboxAquaSign = {bg = colors.bg0},
    GruvboxOrangeSign = {bg = colors.bg0},
    ["@lsp.type.struct"] = {fg = colors.yellow},
    ["@lsp.type.interface"] = {fg = colors.orange},
    ["@punctuation.bracket"] = {fg = colors.fg4},
    ["@string"] = {fg = colors.neutral_aqua},
    ["@number"] = {fg = colors.neutral_aqua},
  },
})
gruvbox.load()
