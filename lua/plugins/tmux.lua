return {
  {
    "aserowy/tmux.nvim",
    config = function()
      return require("tmux").setup()
    end,
    opts = {
      copy_sync = {
        enable = true,
      }
    }
  }
}
