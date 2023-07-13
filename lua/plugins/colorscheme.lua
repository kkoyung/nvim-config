return {
  { "catppuccin/nvim", name = "catppuccin" },
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },
  {
    "nyngwang/nvimgelion",
    dependencies = { "lukas-reineke/indent-blankline.nvim" },
    config = function()
      vim.api.nvim_create_autocmd({ 'ColorScheme', 'FileType' }, {
        pattern = '*',
        callback = function ()
          vim.cmd([[
            hi IndentBlanklineChar gui=nocombine guifg=#444C55
            hi IndentBlanklineSpaceChar gui=nocombine guifg=#4d5154
            hi IndentBlanklineContextChar gui=nocombine guifg=#FB5E2A
            " NOTE: don't use `gui=nocombine` here to have correct coloring of gitsigns.nvim.
            hi IndentBlanklineContextStart gui=underline guisp=#FB5E2A
          ]])
        end,
      })
    end,
  },
}
