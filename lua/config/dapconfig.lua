local dap = require("dap")

-- Load `.vscode/launch.json` file
require('dap.ext.vscode').load_launchjs(nil, {rt_lldb={'rust'}})

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
