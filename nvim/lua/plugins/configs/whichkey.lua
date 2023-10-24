local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    d = {name = "Debug"},
    l = {name = "Lsp"},
    p = {name = "Packer"},
    s = {name = "Session"},
  }
})

wk.register(
  {
    d = {
      name = "Debug",
      C = { function() require("dap").set_breakpoint(vim.fn.input "[Condition] > ") end, "Conditional Breakpoint" },
      E = { function() require("dapui").eval(vim.fn.input "[Expression] > ") end, "Evaluate Input" },
      R = { function() require("dap").run_to_cursor() end, "Run to Cursor" },
      S = { function() require("dap.ui.widgets").scopes() end, "Scopes" },
      U = { function() require("dapui").toggle() end, "Toggle UI" },
      b = { function() require("dap").step_back() end, "Step Back" },
      c = { function() require("dap").continue() end, "Continue" },
      d = { function() require("dap").disconnect() end, "Disconnect" },
      e = { function() require("dapui").eval() end, "Evaluate" },
      g = { function() require("dap").session() end, "Get Session" },
      h = { function() require("dap.ui.widgets").hover() end, "Hover Variables" },
      k = { function() require("dap").toggle_breakpoint() end, "Toggle Breakpoint" },
      o = { function() require("dap").step_over() end, "Step Over" },
      p = { function() require("dap").pause.toggle() end, "Pause" },
      q = { function() require("dap").close() end, "Quit" },
      r = { function() require("dap").repl.toggle() end, "Toggle Repl" },
      s = { function() require("dap").step_into() end, "Step Into" },
      u = { function() require("dap").step_out() end, "Step Out" },
      x = { function() require("dap").terminate() end, "Terminate" },
    },
  },
  {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  }
)
