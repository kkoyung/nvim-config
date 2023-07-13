return {
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {}
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  { "famiu/bufdelete.nvim" },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = true,
  },

  { "rmagatti/auto-session",
    opts = {
      auto_session_suppress_dirs = { "~/", "/"},
    }
  },

  { "numToStr/Comment.nvim", config = true },
  -- { "m4xshen/hardtime.nvim", event = "VeryLazy", opts = {} },
}
