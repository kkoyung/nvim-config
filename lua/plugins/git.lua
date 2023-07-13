return {
  { "tpope/vim-fugitive" },
  { "rbong/vim-flog" },
  { "lewis6991/gitsigns.nvim", config = true },
  {
    "sindrets/diffview.nvim",
    opts = {
      view = { merge_tool = { layout = "diff3_mixed", }, },
    },
  },
}
