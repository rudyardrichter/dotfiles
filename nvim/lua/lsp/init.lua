vim.diagnostic.config({
  float = {
    border = "rounded",
    focusable = false,
    source = "always", 
    header = "", 
    prefix = ""
  },
  signs = true,
  underline = true,
  update_in_insert = true,
  virtual_text = { prefix = "❯" },
})

local signs = { Error = "✖", Warn = "✖", Hint = "󰁕", Info = "󰁕" }
-- local signs = { Error = "󰶻", Warn = "󰄾", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
