return {

  -- Combination: mason.nvim + masan-lspconfig.nvim + nvim-lspconfig
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = true,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { -- Keep loading order
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },

  -- Rust helper
  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      -- Debugging
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function ()
      -- Setup for codelldb
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
      require('rust-tools').setup(opts)
    end
  },

  -- Texlab helper
  {
    "f3fora/nvim-texlabconfig", -- For texlab inverse search
    build = "go build",
    config = true,
  },
}
