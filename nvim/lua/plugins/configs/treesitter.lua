require("nvim-treesitter.configs").setup{
  ensure_installed = {"lua", "markdown", "python", "rust"},
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
