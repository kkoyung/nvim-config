local dap = require("dap")

-- Load `.vscode/launch.json` file
require('dap.ext.vscode').load_launchjs(nil, {rt_lldb={'rust'}})

-- Rust
-- https://github.com/simrat39/rust-tools.nvim/wiki/Debugging#codelldb-a-better-debugging-experience
local codelldb_root = require("mason-registry").get_package("codelldb"):get_install_path() .. "/extension/"
local codelldb_path = codelldb_root .. "adapter/codelldb"
local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"
local opts = {
  dap = {
    adapter = require('rust-tools.dap').get_codelldb_adapter(
      codelldb_path, liblldb_path)
  }
}
-- Normal setup
require('rust-tools').setup(opts)
-- Default configuration
dap.configurations.rust = {
  {
    name = "Launch",
    type = "rt_lldb",
    request = "launch",
    program = "${workspaceFolder}/target/debug/${workspaceFolderBasename}",
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
