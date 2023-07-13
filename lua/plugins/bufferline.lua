return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        -- Shift the bufferline to the right when NvimTree is opened
        -- so that the bufferline is not on top of NvimTree
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
            -- use a "true" to enable the default, or set your own character
          }
        }
      }
    },
  },
}
