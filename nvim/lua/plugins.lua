-- local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'neovim/nvim-lspconfig'
  use "jose-elias-alvarez/null-ls.nvim"
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  use 'onsails/diaglist.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        mode = "loclist",
        padding = "false",
        signs = {
          -- icons / text used for a diagnostic
          error = "✖",
          warning = "✖",
          hint = "",
          information = "",
          other = ""
        }
      }
    end
}
end)

require("diaglist").init({
    -- optional settings
    -- below are defaults
    debug = false,
    -- increase for noisy servers
    debounce_ms = 100,
})

vim.diagnostic.config({
  virtual_text = {
    prefix = '❯', -- ● ▎
  }
})

-- vim.cmd [[autocmd! CursorHold,CursorHoldI *.py lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.api.nvim_set_keymap("n", "<C-q>", "m`:Trouble loclist<CR>``", {noremap = true})

local signs = { Error = "✖", Warn = "✖", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- PER-LANGUAGE LANGUAGE SERVER SETUP

require('lspconfig').pyright.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = true,
  }
)

-- function _G.disable_diagnostics()
--   vim.lsp.diagnostic.disable(0)
--   vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
-- end
--
-- function _G.enable_diagnostics()
--   vim.lsp.diagnostic.enable(0)
--   vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics, {
--       virtual_text = true,
--       signs = true,
--       underline = true,
--       update_in_insert = false,
--     }
--   )
-- end
--
-- vim.cmd [[autocmd! InsertEnter *.py lua disable_diagnostics()]]
-- vim.cmd [[autocmd! InsertLeavePre *.py lua enable_diagnostics()]]

require('typescript')

local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    find_command = {
      'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--follow', '--color=never'
    },
    prompt_prefix = " ",
    borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<C-c>"] = actions.close,
        ["<CR>"] = actions.select_default + actions.center
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
      }
    }
  }
}
-- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>lua require('telescope.builtin').find_files()<cr>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>lua require('telescope.builtin').live_grep()<cr>", {noremap = true})
