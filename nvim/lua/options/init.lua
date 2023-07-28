local options_table = {
  g = {
    -- do_filetype_lua = 1, -- use filetype.lua
    -- did_load_filetypes = 0, -- don't use filetype.vim
    highlighturl_enabled = true,
    load_black = false,
    loaded_2html_plugin = true,
    loaded_getscript = true,
    loaded_getscriptPlugin = true,
    loaded_gzip = true,
    loaded_logipat = true,
    loaded_matchit = true,
    loaded_netrwFileHandlers = true,
    loaded_netrwPlugin = true,
    loaded_netrwSettngs = true,
    loaded_remote_plugins = true,
    loaded_tar = true,
    loaded_tarPlugin = true,
    loaded_vimball = true,
    loaded_vimballPlugin = true,
    loaded_zip = true,
    loaded_zipPlugin = true,
    mapleader = " ",
    zipPlugin = false
  },
  opt = {
    backspace = {"indent", "eol", "start", "nostop"}, -- Don't stop backspace at insert
    clipboard = "unnamedplus", -- Connection to the system clipboard
    copyindent = true, -- Copy the previous indentation on autoindenting
    cursorline = true, -- Highlight the text line of the cursor
    expandtab = true, -- Enable the use of space in tab
    fileencoding = "utf-8", -- File content encoding for the buffer
    fillchars = {eob = " "}, -- Disable `~` on nonexistent lines
    ignorecase = true, -- Case insensitive searching
    laststatus = 3, -- globalstatus
    mouse = "a", -- Enable mouse support
    preserveindent = true, -- Preserve indent structure as much as possible
    pumheight = 10, -- Height of the pop up menu
    shiftwidth = 4, -- Number of space inserted for indentation
    showmode = false, -- Disable showing modes in command line
    sidescrolloff = 8, -- Number of columns to keep at the sides of the cursor
    signcolumn = "yes", -- Always show the sign column
    smartcase = true, -- Case sensitivie searching
    splitbelow = true, -- Splitting a new window below the current one
    splitright = true, -- Splitting a new window at the right of the current one
    swapfile = false, -- Disable use of swapfile for the buffer
    tabstop = 4, -- Number of space in a tab
    termguicolors = true, -- Enable 24-bit RGB color in the TUI
    -- timeout = true,  -- need to be left alone for which-key to work
    ttimeout = false,
    timeoutlen = 200,
    ttimeoutlen = 200,
    undofile = true,
    updatetime = 200,
    wrap = false,
    writebackup = false, -- Disable making a backup before overwriting a file
    autoread = true,
    completeopt = {"menuone", "noinsert", "noselect"},
    confirm = true,
    gdefault = true,
    number = false,
    relativenumber = false,
    scrolloff = 0,
    filetype = on,
    foldenable = true,
    foldlevel = 5,
    foldexpr = "nvim_treesitter#foldexpr()",
    foldmethod = "expr",
    shortmess = vim.opt.shortmess + {c = true},
    splitbelow = true,
    splitright = true,
    wildmode = "longest:full,full",
    wildignorecase = true,
    wrap = true,
    linebreak = true,
    undofile = true,
    undolevels = 1000,
    history = 10000,
    lazyredraw = false,
  }
}

for scope, table in pairs(options_table) do
  for setting, value in pairs(table) do vim[scope][setting] = value end
end
