return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = "all",
        ignore_install = { "" },
        highlight = {
          enable = true,
          disable = { "latex" },
          additional_vim_regex_highlighting = true,
        },
        indent = {
          enable = true
        },

        -- Setup for nvim-ts-rainbow
        rainbow = {
          enable = true,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        },
      }
    end,
    dependencies = { "HiPhish/nvim-ts-rainbow2" },
  },
  { "windwp/nvim-autopairs", config = true },
  { "lukas-reineke/indent-blankline.nvim" },
}
