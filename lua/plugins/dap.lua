vim.pack.add({
  -- "https://github.com/mfussenegger/nvim-dap",
  Gh("mfussenegger/nvim-dap"),
  -- "https://github.com/rcarriga/nvim-dap-ui"
  Gh("rcarriga/nvim-dap-ui"),
  Gh("nvim-neotest/nvim-nio"),
  -- Gh("folke/lazydev.nvim"), --lazydev might only be reccommended for lua
  -- Gh("igorlfs/nvim-dap-view"),
})

-- TODO:
--      actually get a decent setup with DAP
--      there should be a way to make dapui
--      or dap-view as good or better than termdebug

local dap = require("dap")
local dapui = require("dapui")
dap.adapters.lldb = {
  type = "executable",
  command = "codelldb",
  name = "lldb",
}

local lldb = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {}, -- provide arguments if needed
    runInTerminal = false,
  },
  {
    name = "Select and attach to process",
    type = "lldb",
    request = "attach",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    pid = function()
      local name = vim.fn.input("Executable name (filter): ")
      return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = "${workspaceFolder}",
  },
}

dap.configurations.c = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {}, -- provide arguments if needed
    runInTerminal = false,
  },
  {
    name = "Select and attach to process",
    type = "lldb",
    request = "attach",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    pid = function()
      local name = vim.fn.input("Executable name (filter): ")
      return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = "${workspaceFolder}",
  },
}

--[[ local dap = require("dap")
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}
dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    args = {}, -- provide arguments if needed
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = "Select and attach to process",
    type = "gdb",
    request = "attach",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    pid = function()
      local name = vim.fn.input("Executable name (filter): ")
      return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = "${workspaceFolder}",
  },
  {
    name = "Attach to gdbserver :1234",
    type = "gdb",
    request = "attach",
    target = "localhost:1234",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
  },
} ]]
require("dapui").setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end

--[[ vim.api.nvim_create_autocmd({'BufEnter'}, {
 pattern = {"*.hl", "hypr*.conf",},
 callback = function(event)
   print(string.format("starting hyprls for %s", vim.inspect(event)))
   vim.lsp.start {
     name = "hyprlang",
     cmd = {"hyprls"},
     root_dir = vim.fn.getcwd(),
   }
 end
}) ]]
