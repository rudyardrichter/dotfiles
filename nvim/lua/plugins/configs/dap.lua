local dap, dapui = require("dap"), require("dapui")

-- dap.set_exception_breakpoints("default")

require("dap-python").setup("python", {})
require("dap-go").setup()

dapui.setup {} -- use default
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.adapters.python = {
  type = 'executable',
  -- assume that virtualenv is activated if needed
  command = 'python',
  args = { '-m', 'debugpy.adapter' },
}
dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
  },
}

dap.configurations.rust = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}
