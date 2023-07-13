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
    -- config = true,
    -- Delay setup to dapconfig.lua
  },

  -- Texlab helper
  {
    "f3fora/nvim-texlabconfig", -- For texlab inverse search
    build = "go build",
    config = true,
  },
}
