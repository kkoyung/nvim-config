return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      -- Load VS Code-like snippets from rafamadriz/friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Load custom snippets from ~/.config/nvim/luasnip/
      require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/luasnip/"})
    end,
  },
}
