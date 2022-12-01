local signs = {
  {name = "DiagnosticSignError", text = ""},
  {name = "DiagnosticSignWarn", text = ""},
  {name = "DiagnosticSignInfo", text = ""},
  {name = "DiagnosticSignHint", text = ""},
}
for _, sign in pairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
  float = {border = "rounded", focusable = false, source = "always", header = "", prefix = ""},
  signs = true,
  underline = true,
  update_in_insert = false,
  virtual_text = { prefix = "❯" },
  -- virtual_text = false
})

-- vim.cmd([[
-- set signcolumn=yes
-- autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
-- ]])

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {border = "rounded"}
)
