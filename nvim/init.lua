require("options")
require("mappings")

if not vim.g.vscode then
  require("lsp")
  require("plugins")
  require("plugins.configs.cmp")
  require("plugins.configs.gruvbox")
  require("plugins.configs.telescope")
  require("packer_compiled")
end
